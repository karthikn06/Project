<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
</head>
<body>
    <h1>Order Details</h1>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/FoodDB";
            String username = "root";
            String password = "Karthik";

            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Prepare statement to retrieve order details
            String sql = "SELECT * FROM Orders WHERE order_id = ?";
            pstmt = conn.prepareStatement(sql);
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            pstmt.setInt(1, orderId);

            // Execute the query
            rs = pstmt.executeQuery();

            // Display order details
            if (rs.next()) {
                out.println("<h2>Order Details</h2>");
                out.println("<p><strong>Order ID:</strong> " + rs.getInt("order_id") + "</p>");
                out.println("<p><strong>Customer Name:</strong> " + rs.getString("customer_name") + "</p>");
                out.println("<p><strong>Order Date:</strong> " + rs.getDate("order_date") + "</p>");
                out.println("<p><strong>Order Total:</strong> $" + rs.getDouble("order_total") + "</p>");
                // You can add more details as needed
            } else {
                out.println("<p>No order found with ID: " + orderId + "</p>");
            }

        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            // Finally block to close resources
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                out.println("<p>Error: " + se.getMessage() + "</p>");
            }
        }
    %>

</body>
</html>
