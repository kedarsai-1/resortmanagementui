<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>

<%
out.println("Form reached store2.jsp");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String roomtype = request.getParameter("roomtype");
String noofguests = request.getParameter("guests");
String checkindat = request.getParameter("checkin");
String checkoutdat = request.getParameter("checkout");



   try {
        long phonenumber = Long.parseLong(phone);
    int numberofguests = Integer.parseInt(noofguests);   
out.println("Check-in raw: " + checkindat);
out.println("Check-out raw: " + checkoutdat);

    java.sql.Date checkindate = null;
    java.sql.Date checkoutdate = null;

    if (checkindat != null && !checkindat.isEmpty() && checkoutdat != null && !checkoutdat.isEmpty()) {
        checkindate = java.sql.Date.valueOf(checkindat); // expects yyyy-MM-dd
        checkoutdate = java.sql.Date.valueOf(checkoutdat);
    } else {
        out.println("Error: Check-in or Check-out date is missing.");
        return;
    }
   

    
    Class.forName("org.postgresql.Driver");
    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "7463");
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO rooms (name, email, phonenumber, roomtype, numberofguests, checkindate,checkoutdate) VALUES (?, ?, ?, ?, ?, ?,?)"
    );
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setLong(3, phonenumber);
    ps.setString(4, roomtype);
    ps.setInt(5, numberofguests);
    ps.setDate(6, checkindate);
    ps.setDate(7,checkoutdate);
    ps.executeUpdate();
    ps.close();
    conn.close();
    response.sendRedirect("success.html");
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}

%>
