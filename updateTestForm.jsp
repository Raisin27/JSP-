<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); 
    String id = request.getParameter("id");
    if(id == null){
      id="";
    }
    //입력 필요없이 수정 페이지로 이동함녀 아이디 겂을 그대로 copy해주
%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
  .alert{
    text-align: center;
  }
</style>
</head>
<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-8">
      <div class="alert alert-info" role="alert">
        <h2>
          <i class="bi bi-pencil-square"></i>
          member테이블의 레코드 수정
        </h2>
      </div>
      <form method="post" action="updateTestPro.jsp">
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
        <div class="row mb-3">
          <label for="name" class="col-sm-2 col-form-label">변경할 이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name">
          </div>
        </div>
        <div class="row mb-3">
          <label for="name" class="col-sm-2 col-form-label">변경할 생년월일</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="birth" name="birth"placeholder="8자리만 입력">
          </div>
        </div>
        <div class="row mb-3">
          <label for="name" class="col-sm-2 col-form-label">성별</label>
          <div class="col-sm-10">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="gender" value="male">
              <label class="form-check-label" for="gender">남성</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="gender" value="female">
              <label class="form-check-label" for="gender">여성</label>
          </div>
        </div>
        <div class="input-group my-3">
            <input type="text" class="form-control" placeholder="우편번호 버튼 클릭" name="postcode" readonly>
            <button class="btn btn-outline-secondary" type="button" id="postcode">변경할 우편번호</button>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="도로명 주소" name="addr1" readonly>
            <input type="text" class="form-control" placeholder="상세주소" name="addr2">
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <input type="submit" class="btn btn-info" value="회원정보 수정">
        </div>
      </form>
      </div>
      </div>
      </div>


    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
document.querySelector('#postcode').onclick = function(){
    new daum.Postcode({
        oncomplete: function(data) {
            document.querySelector('input[name="postcode"]').value = data.zonecode;
            document.querySelector('input[name="addr1"]').value = data.roadAddress;
        }
    }).open();
}
</script>
</body>
</html>