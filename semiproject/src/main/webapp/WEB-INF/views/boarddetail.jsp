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
	
	$("#boardwrite").on("click", function(e){
		window.location.href = "<%=request.getContextPath()%>/board/boardwrite";
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
 
 <div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
	 	<ul class="nav nav-sidebar ">
		<li><a href="#">게시판 </a></li>
		</ul>
		</div>
	 	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	 		<div class="blog-post">
	 		<h2 class="blog-post-title">${result.title }</h2>
			<p class="blog-post-meta"> 작성시간: ${result.time } 작성자: ${result.writer }</p>
			<p>${result.contents }</p>
			</div>
			<button id="boardwrite" class="btn btn-primary">글쓰기</button>
	 	</div>
	 		
			
	</div>
</div>

<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
</body>
</html>