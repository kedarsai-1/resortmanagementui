<%@ page import ="java.sql.*"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String halltype=request.getParameter("halltype");
String eventtype=request.getParameter("eventtype");
String eventdat=request.getParameter("eventdate");
String timeslot=request.getParameter("timeslot");
String  noofguests=request.getParameter("guests");
try 
{
Long phonenumber=Long.parseLong(phone);
int numberofguests = Integer.parseInt(noofguests);
java.sql.Date eventdate =java.sql.Date.valueOf(eventdat);
Class.forName("org.postgresql.Driver");
Connection conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","7463");
PreparedStatement ps =conn.prepareStatement("insert into hall(name,email,phonenumber,halltype,eventtype,eventdate,timeslot,numberofguets) values (?,?,?,?,?,?,?,?) ");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setLong(3, phonenumber);
    ps.setString(4, halltype);
    ps.setString(5, eventtype);
    ps.setDate(6, eventdate);
    ps.setString(7,timeslot);
	ps.setInt(8,numberofguests);
    ps.executeUpdate();
  response.sendRedirect("success.html");
}
catch(Exception e) 
{
  	out.println("Error :"+e.getMessage());
}
%>


