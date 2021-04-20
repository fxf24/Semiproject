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
<link href="<%=request.getContextPath() %>/resources/css/jumbotron.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/css/dashboard.css" rel="stylesheet">
<script src="resources/jquery-3.2.1.min.js"></script>
<script>
$$(document).ready(function(){
	
});
</script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
            <div class="form-group">
              <input type="text" placeholder="ID" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
 </nav>
 
 <div class="container-fluid">
	 <div class="row">
		 <div class="col-sm-3 col-md-2 sidebar">
		 <ul class="nav nav-sidebar">
		 <li><a href="#">게시판 </a></li>
		 </ul>
		 </div>
	  	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
					</thead>
					<c:forEach items="${list }" var="vo">
					<tr><td>${vo.seq }</td><td>${vo.title }</td><td>${vo.writer}</td><td>${vo.viewcount}</td></tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
	 </div>
 </div>


</body>
</html>
