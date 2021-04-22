<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/signin.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	 $("#login").on('click', function(e){
		/* e.preventDefault() */
		alert($("#id").val() + "로그인 됨")
		var id = $("#id").val()
		alert(${result} )
		/* sessionStorage.setItem("id", $("#id").val()) */
		alert("session:" + sessionStorage.getItem("id"))
	})//on end
});
</script>
</head>
<body>
    <div class="container">

      <form action="<%=request.getContextPath() %>/board/login" method="post" class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" id="id" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pw" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button id="login" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
		<div id="result">
		
		</div>
    </div> <!-- /container -->
</body>
</html>