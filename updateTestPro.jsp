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


  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/aban";
    String dbId = "aban";
    String dbPass = "1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	String sql = "select id, passwd from member where id= ?";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
	rs = pstmt.executeQuery();
    
	if(rs.next()){ 
		String rId = rs.getString("id");
		String rPasswd = rs.getString("passwd");

		if(id.equals(rId) && passwd.equals(rPasswd)){
			sql = "update member set name=?, birth=?, gender=?, postcode=?, addr1=?, addr2=?  where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setString(2,birth);
			pstmt.setString(3,gender);
			pstmt.setString(4,postcode);
			pstmt.setString(5,addr1);
			pstmt.setString(6,addr2);
			pstmt.setString(7,id);

			pstmt.executeUpdate();	   

			response.sendRedirect("selectTest.jsp");
      	}else{
			out.println("패스워드가 틀렸습니다.");
	  	}
	}else{
		out.println("아이디가 틀렸습니다.");
	}
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