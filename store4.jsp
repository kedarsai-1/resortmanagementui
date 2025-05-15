<%@ page import="java.sql.*" %>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String bookingdat = request.getParameter("bookingdate"); 
String tabletype = request.getParameter("tableType");     
String timeslot = request.getParameter("timeSlot");      
String noofguests = request.getParameter("guests");

try {
    if (phone == null || noofguests == null || bookingdat == null ||
        phone.isEmpty() || noofguests.isEmpty() || bookingdat.isEmpty()) {
        out.println("Error: One or more required fields are missing.");
        return;
    }

    long phonenumber = Long.parseLong(phone);
    int numberofguests = Integer.parseInt(noofguests);
    java.sql.Date bookingdate = java.sql.Date.valueOf(bookingdat);

    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/postgres", "postgres", "7463");

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO tables(name, email, phonenumber, bookingdate, tabletype, timeslot, numberofguests) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?)");
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setLong(3, phonenumber);
    ps.setDate(4, bookingdate);
    ps.setString(5, tabletype);
    ps.setString(6, timeslot);
    ps.setInt(7, numberofguests);

    ps.executeUpdate();
    response.sendRedirect("success.html");

} catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e);
}
%>