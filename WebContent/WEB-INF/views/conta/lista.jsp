<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>lista</title>
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$('.btnPagar').click(function(){
				let btnID = this.id;
				const carregar_url = 'pagarConta?id=' + btnID;
				console.log(carregar_url)
				$.ajax({
					url: carregar_url,
					success: function() {
						window.alert('sucesso!')
					}
				})
				
			})
			
		})
	
	</script>
</head>
<body>
	
	<table border="1">
		<thead>
			<th>Código</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Tipo</th>
			<th>Pago</th>
			<th>Data de pagamento</th>
			<th>Ações</th>
		</thead>
		
		<c:forEach items="${todasContas}" var="conta">
			<tbody>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td>${conta.tipo}</td>
				<td>
					<c:if test="${conta.paga eq false}">
						Não paga
					</c:if>
					<c:if test="${conta.paga eq true}">
						Paga
					</c:if>
				</td>
				<td><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/></td>
				<td>
					<a href="deletarConta?id=${conta.id}">deletar</a>
					<a href="mostarConta?id=${conta.id}">editar</a> | 
					<c:if test="${conta.paga eq false}">
						<a href="#" id="${conta.id}" class="btnPagar" >pagar</a>
					</c:if>
				</td>
				
			</tbody>
		</c:forEach>
	</table>
	
</body>
</html>