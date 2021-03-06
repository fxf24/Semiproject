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
		/* sessionStorage.setItem("id", $("#id").val()) */
		/* alert("session:" + sessionStorage.getItem("id")) */
		$.ajax({
			url: "<%=request.getContextPath()%>/board/login",
			data: {'id':$("#id").val(), 'pw':$("#pw").val()},
			type: 'post',
			dataType: 'json',
			//여기까지 서버에서 받아옴
			//밑에서부터 결과를 받아옴
			success: function(server){
				console.log(server.process + ":" + server.id)
				if(server.process =='정상로그인'){
					if(server.pw == $("#pw").val()){
						sessionStorage.setItem("id", server.id)
						alert(server.id + "님 환영합니다!")
						window.location.href = "<%=request.getContextPath()%>/board";
					}
					else{
						alert("비밀번호가 잘못됐습니다!")
					}
				}
				else{
					alert("존재하지않는 아이디 입니다!")
				}
				
			},
			error: function (request, status, error){
				var msg = "ERROR : " + request.status + "<br>"
				msg += + "내용 : " + request.responseText + "<br>" + error;
				console.log(msg);
				alert(msg)
			}

		});//ajax 요청함수
	})//login onclick end
	
	$("#signup").on("click", function() {
		window.location.href = "<%=request.getContextPath()%>/board/signup";
	})//signup onclick end
});
</script>
</head>
<body>
    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">로그인</h2>
        <label for="inputId" class="sr-only">ID</label>
        <input type="text" id="id" class="form-control" placeholder="ID" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="pw" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button id="login" type="button" class="btn btn-lg btn-primary btn-block">로그인</button>
        <button id="signup" type="button" class="btn btn-lg btn-primary btn-block">회원가입</button>
      </form>
		<div id="result">
		
		</div>
    </div> <!-- /container -->
    

 <script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
</body>
</html>