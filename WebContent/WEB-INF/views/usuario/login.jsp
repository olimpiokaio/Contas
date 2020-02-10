<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<body>
		<h1>Tela Login</h1>
		
		<form action="efetuaLogin" method="post">
			
			<label for="login">Login</label>
			<input id="login" type="text" name="login" placeholder="digite seu login" required/>
			<br/>
			
			<label for="senha">Senha</label>
			<input id="senha" type="password" name="senha" placeholder="digite sua senha" required/>
			<br/><br/>
			
			<input type="submit" value="autenticar" />
		</form>
		
	</body>
</html>