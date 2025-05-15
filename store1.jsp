<%@ page import ="java.sql.*" %>

<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try 
{
	Class.forName("org.postgresql.Driver");
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","7463");
	PreparedStatement ps=conn.prepareStatement("insert into login values(?,?)");
	ps.setString(1,uname);
	ps.setString(2,pwd);
	ps.executeUpdate();
}
catch(Exception e) 
{
  	out.println(e);
}

response.sendRedirect("bookingpage.html");
%>