<%@ page import ="java.sql.*"%>

<html>

<head>
<title>Data View</title>

</head>

<body>
<h1>Retrieved Data</h1>
<%
String Name=request.getParameter("name");
String Email=request.getParameter("email");
String phonenumber = request.getParameter("phone");
String RoomType=request.getParameter("room-type");
String NumberofGuests=request.getParameter("guests");
String checkindate=request.getParameter("checkIn");
%>

<%= Name %>
<%= Email %>
<%= phonenumber  %>
<%= RoomType %>
<%= NumberofGuests %>
<%= checkindate %>

<%
try 
{
}
catch(Exception e) 
{
  	out.println(e);
}
%>
</body>
</html>

