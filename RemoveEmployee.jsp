<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Remove Employee</title>
</head>
<body>
    <h1>Remove Employee</h1>

    <form action="RemoveEmployee.jsp" method="post">
        <label>Employee ID:</label>
        <input type="text" name="employeeId"><br><br>
        
        <input type="submit" value="Remove Employee">
    </form>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            String employeeId = request.getParameter("employeeId");

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/FoodDB";
            String username = "root";
            String password = "Karthik";

            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Prepare statement to remove employee
            String sql = "DELETE FROM Employees WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, employeeId);

            // Execute the query
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>Employee with ID " + employeeId + " removed successfully!</p>");
            } else {
                out.println("<p>No employee found with ID " + employeeId + ".</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block to close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                out.println("<p>Error: " + se.getMessage() + "</p>");
            }
        }
    %>

</body>
</html>
