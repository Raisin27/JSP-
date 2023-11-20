<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>레코드 표시</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
	.alert{
	  text-align: center;
	}
  </style>
</head>
<body>

<div class="container">
	<div class="row justify-content-md-center">
		<div class="col-12">
			<div class="alert alert-secondary" role="alert">
				<h2><i class="bi bi-card-list"></i> 	member 테이블의 레코드 
					<a href="signup.jsp" class="btn btn-dark">회원가입</a>
				</h2>
			</div>
			<table class="table  table-hover table-bordered">
				<thead>
					<tr class="table-secondary">
						<th scope="col">아이디</th>
						<th scope="col">패스워드</th>
						<th scope="col">이름</th>
						<th scope="col">생년월일</th>
                        <th scope="col">성별</th>
                        <th scope="col">우편번호</th>
                        <th scope="col">도로명</th>
                        <th scope="col">상세주소</th>
                        <th scope="col">가입일자</th>
						<th scope="col">수정/삭제</th>
					</tr>
				</thead>
				<tbody>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/aban";
		String dbId = "aban";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
		String sql = "select * from member";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
            String birth = rs.getString("birth");
            String gender = rs.getString("gender");
            String postcode = rs.getString("postcode");
            String addr1 = rs.getString("addr1");
            String addr2 = rs.getString("addr2");
			Timestamp register = rs.getTimestamp("reg_date");
	
	%>
			<tr>
				<td><%=id%></td>
				<td><%=passwd%></td>
				<td><%=name%></td>
                <td><%=birth%></td>
				<td><%=gender%></td>
				<td><%=postcode%></td>
				<td><%=addr1%></td>
				<td><%=addr2%></td>
				<td><%=register.toString()%></td>
				<td>
					<a href="updateTestForm.jsp?id=<%=id%>" class="btn btn-info btn-sm">수정</a><!--get 방식으로 링크 주소에 표시, 예 kang->http://localhost:8080/book/ch11/updateTestForm.jsp?id=kang-->
					<a href="deleteTestForm.jsp?id=<%=id%>" class="btn btn-danger btn-sm">삭제</a>
				</td>
			</tr>
	<%  } 
	}catch(Exception e){ 
		e.printStackTrace();
	}finally{
		if(rs != null) 
			try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) 
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
			try{conn.close();}catch(SQLException sqle){}
	}
%>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>