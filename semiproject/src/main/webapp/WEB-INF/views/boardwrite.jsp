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
<link href="<%=request.getContextPath() %>/resources/css/dashboard.css" rel="stylesheet">
<script src="<%=request.getContextPath() %>/resources/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var session_id = sessionStorage.getItem("id")
	if(session_id==null ){
		$("#logout").css("display", "none")
		$("#logged_in").css("display", "none")
	}
	else{
		$("#login").css("display", "none")
		$("#logged_in").css("display", "block")
		$("#logged_in").html(session_id + "님 환영합니다")
	}
	
	$("#login").on("click", function(e){
		window.location.href = "<%=request.getContextPath()%>/board/login";
	}) 
	
	$("#logout").on("click", function(e){
		sessionStorage.removeItem("id")
		window.location.href = "<%=request.getContextPath()%>/board";
	}) 
	
	$("#write").on('click', function(){
		if(session_id==null){
			alert("로그인을 해주세요!")
		}
		else{
			$.ajax({
				url: "<%=request.getContextPath()%>/board/boardwrite",
				data: {'title':$("#title").val(), 'contents':$("#contents").val(), 
					'writer':sessionStorage.getItem("id")},
				type: 'post',
				dataType: 'json',
				//여기까지 서버에서 받아옴
				//밑에서부터 결과를 받아옴
				success: function(server){
					alert(server.process)
					window.location.href = "<%=request.getContextPath()%>/board"
				},
				error: function (request, status, error){
					var msg = "ERROR : " + request.status + "<br>"
					msg += + "내용 : " + request.responseText + "<br>" + error;
					console.log(msg);
					alert(msg)
				}

			});//ajax 요청함수
		}
		
	})
});
</script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav navbar-right">
            <li><a href="<%=request.getContextPath()%>/board">게시판</a></li>
          </ul>
          <form id="login_form" class="navbar-form navbar-right">
            <button id="login" type="button" class="btn btn-success">로그인</button>
            <button id="logout" type="button" class="btn btn-success">로그아웃</button>
          </form>
          <div id="logged_in"	class="navbar-brand navbar-right" style="display:none"}>
          	로그인
          </div>
 
        </div><!--/.navbar-collapse -->
      </div>
 </nav>
<div class="container">
	<div class="row">
	<form >
	<h3 class="col-md-4">제목:</h3> 
	<input class="col-md-9" type=text id='title'><br>
	<h3 class="col-md-4">내용:</h3> 
	<textarea class="col-md-12" rows="3" cols="100" id='contents'></textarea><br>
	</form>
	
	</div>
	<div class="row">
	<button id="write" type="button" class="btn btn-success">작성</button>
	</div>
	
</div>



<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
</body>
</html>