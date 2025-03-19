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
String phonenumber= request.getParameter("phone");
String TableType=request.getParameter("table-type");
String TimeSlot=request.getParameter("time-slot");
String  NumberofGuests=request.getParameter("guests");

%>

<%= Name %>
<%= Email %>
<%= phonenumber  %>
<%=  TableType %>
<%= TimeSlot %>
<%= NumberofGuests %>

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

