<%@ page import ="java.sql.*"%>

<%
String uname=request.getParameter("uname");
String pwd=request.getParameter("pwd");
try 
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindetails","root","9705987275");
	PreparedStatement ps=conn.prepareStatement("insert into login values(?,?)");
	ps.setString(1,uname);
	ps.setString(2,pwd);
	ps.executeUpdate();
}
catch(Exception e) 
{
  	out.println(e);
}
%>