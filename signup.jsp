
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
  .alert{
    text-align: center;
  }
  .col-8 .logo{
    text-align: center;
  }
</style>
</head>
<body>

<div class="container">
  <div class="row justify-content-md-center">
    <div class="col-8">
      <div class="logo"><i class="bi bi-exclude" style="font-size: 100px;"></i></div>
      <br>
      <div class="alert alert-secondary" role="alert">
        <h2>
          <i class="bi bi-person-add"></i> 회원가입
        </h2>
      </div>
      <form method="post" action="signupPro.jsp">
        <div class="row mb-3">
          <label for="id" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="id" name="id">
          </div>
        </div>
        <div class="row mb-3">
          <label for="passwd" class="col-sm-2 col-form-label">패스워드</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="passwd" name="passwd">
          </div>
        </div>
        <div class="row mb-3">
          <label for="name" class="col-sm-2 col-form-label">이름</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="name" name="name">
          </div>
        </div>
        <div class="row mb-3">
          <label for="name" class="col-sm-2 col-form-label">생년월일</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="birth" name="birth" placeholder="8자리만 입력">
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
            <button class="btn btn-outline-secondary" type="button" id="postcode">우편번호</button>
        </div>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="도로명 주소" name="addr1" readonly>
            <input type="text" class="form-control" placeholder="상세주소" name="addr2">
        </div>
        
        <div class="d-grid gap-2 col-6 mx-auto">
          <input type="submit" class="btn btn-dark" value="회원가입 완료">
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-light"  class="col-6" data-bs-toggle="modal" data-bs-target="#modalSignin">
            계정 있으면 클릭하여 로그인 <i class="bi bi-hand-index-thumb"></i>
          </button>
        </div>
      </form>    
      </div>
    </div>
  </div>

</div>  


<!-- Modal -->
<div class="modal" tabindex="-1"  id="modalSignin"data-bs-backdrop="static" data-bs-keyboard="false">
  <div class="modal-dialog" >
    <div class="modal-content rounded-4 shadow">
      <div class="modal-header p-5 pb-4 border-bottom-0">
        <h1 class="fw-bold mb-0 fs-2"> <i class="bi bi-exclude"style="font-size:60px"></i> 로그인하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body p-5 pt-0">
    <%
    String id = "";
    try{
        id = (String)session.getAttribute("id");

        if(id == null || id.equals("")){
    %>
        <form method="post" action="loginPro.jsp">
          <div class="form-floating mb-3">
            <input type="text" name="id" id="id" class="form-control rounded-3" id=" floatingInput" placeholder="예: hong1">
            <label for="floatingInput">아이디</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" name="passwd" id="passwd" class="form-control rounded-3" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">비밀번호</label>
          </div>
          <button class="w-100 mb-2 btn btn-lg rounded-3 btn-dark" type="submit">로그인</button>
          <small class="text-body-secondary" style="margin: 0 140px;">신용카드 필요 없음</small>
          <hr class="my-4">
          <h2 class="fs-5 fw-bold mb-3" style="text-align: center;">또한</h2>
          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="button">
            <svg class="bi me-1" width="16" height="16"><use xlink:href="#twitter"/></svg>
            로그인 with Twitter
          </button>
          <button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-3" type="button">
            <svg class="bi me-1" width="16" height="16"><use xlink:href="#facebook"/></svg>
            로그인 with Facebook
          </button>
          <button class="w-100 py-2 mb-2 btn btn-outline-secondary rounded-3" type="button">
            <svg class="bi me-1" width="16" height="16"><use xlink:href="#github"/></svg>
            로그인 with GitHub
          </button>
        </form>
      <%
        } else {
        
          //response.sendRedirect("mainPage.jsp");
        }
        }catch(Exception e){
          e.printStackTrace();
        }
  %>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
