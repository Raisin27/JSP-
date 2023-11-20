<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8"); %>

<% 
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   String name = request.getParameter("name");
   String birth = request.getParameter("birth");
   String gender = request.getParameter("gender");
   String postcode = request.getParameter("postcode"); 
   String addr1 = request.getParameter("addr1"); 
   String addr2 = request.getParameter("addr2"); 
   Timestamp register = new Timestamp(System.currentTimeMillis());

   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";

   try{
    String jdbcUrl = "jdbc:mysql://localhost:3306/aban";
    String dbId = "aban";
    String dbPass = "1234";
    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

    String sql = "insert into member values (?,?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    pstmt.setString(2,passwd);
    pstmt.setString(3,name);
    pstmt.setString(4,birth);
    pstmt.setString(5,gender);
    pstmt.setString(6,postcode);
    pstmt.setString(7,addr1);
    pstmt.setString(8,addr2);
    pstmt.setTimestamp(9,register);
	
    pstmt.executeUpdate();
 	
 	str = "member 테이블에 새로운 레코드를 추가했습니다.";
	response.sendRedirect("selectTest.jsp");

 	}catch(Exception e){ 
 		e.printStackTrace();
 		str = "member 테이블에 새로운 레코드를 추가에 실패했습니다";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-8">
				<div class="alert alert-secondary" role="alert">
					<i class="bi bi-patch-exclamation"></i> <%=str %> <a href="signup.jsp" class="btn btn-warning">다시입력하기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>