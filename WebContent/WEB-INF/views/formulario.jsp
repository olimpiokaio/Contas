<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Formulario</title>
	</head>
	<body>
		<h1>Formuario Conta</h1>
		
		<form action="adicionaConta" method="post">
			<input type="hidden" value="${conta.id}" name="id" />
		
			<label for="descricao">Descrição: </label>
			<textarea id="descricao" name="descricao" cols="25" rows="7">${conta.descricao}</textarea>
			<form:errors path="conta.descricao" />
			<br/>
			<br/>
			
			<label for="paga">Paga?: </label>
			<input id="paga" type="checkbox" name="paga" ${conta.paga?'checked':''}/>
			<br/>
			<br/>
			
			<label for="valor">valor: </label>
			<input id="valor" name="valor" type="number" value="${conta.valor}"/>
			<br/>
			<br/>
			
			<label for="data">Data Pagamento</label>
			<input id="data" type="text" name="dataPagamento" value="${conta.dataPagamento}" />
			<br/>
			<br/>
			
			<label for="tipo">Tipo: </label>
			<select id="tipo" name="tipo" >
				<option value="ENTRADA" ${conta.tipo == 'ENTRADA' ? 'selected':''}>Entrada</option>
				<option value="SAIDA" ${conta.tipo == 'SAIDA' ? 'selected':''} >Saida</option>
			</select>
			<br/>
			<br/>
			
			<button type="submit">gravar</button>
		</form>
	</body>
</html>















