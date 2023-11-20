<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  request.setCharacterEncoding("utf-8"); 

  String id = request.getParameter("id");
  if(id == null){ id = ""; }
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 삭제</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-8">
      <div class="alert alert-danger" role="alert">
        <h2>
          <i class="bi bi-x-diamond-fill"></i> 
          member테이블의 레코드 삭제
        </h2>
      </div>

      <form method="post" action="deleteTestPro.jsp">
        <div class="row mb-3">
          <label for="id" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="id" name="id" value="<%=id%>">
          </div>
        </div>
        <div class="row mb-3">
          <label for="passwd" class="col-sm-2 col-form-label">패스워드</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="passwd" name="passwd">
          </div>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <input type="submit" class="btn btn-danger" value="회원정보 삭제">
        </div>
      </form>
      
    </div>
  </div>
</div>
</body>
</html>