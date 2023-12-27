<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id ="";
   try{
	   id = (String)session.getAttribute("id");
	   if(id==null || id.equals(""))
           response.sendRedirect("signup.jsp");
	   else{
%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <title>Document</title>
    <style>
        .navbar-brand{
            margin-bottom: 30px;
            font-size: 35px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav class="navbar bg-dark border-bottom border-bottom-dark" data-bs-theme="dark" >
            <a class="navbar-brand" href="#"><i class="bi bi-exclude"></i>Includage</a>
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">홈</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">접수방식</a>
                </li>
                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    서비스
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">서비스1</a></li>
                    <li><a class="dropdown-item" href="#">서비스2</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#">다른 서비스</a></li>
                </ul>
                </li>
                <li class="nav-item">
                <a class="nav-link" href="#">커뮤니티</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">검색</button>
            </form>
            </div>
            <a class="btn btn-outline-light" href="logout.jsp">로그아웃</a>
        </div>
        </nav>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>
