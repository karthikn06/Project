<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <script>
        function showMessage(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <h1>Add Employee</h1>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Retrieve form data
            String name = request.getParameter("name");
            long phone = Long.parseLong(request.getParameter("phone"));
            String address = request.getParameter("address");
            String department = request.getParameter("department");

            // Parse date inputs
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = sdf.parse(request.getParameter("dob"));
            Date joiningDate = sdf.parse(request.getParameter("joiningDate"));

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/FoodDB";
            String username = "root";
            String password = "Karthik";

            // Register JDBC driver and open connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Prepare statement to insert data
            String sql = "INSERT INTO Employees (name, phone, address, department, dob, joiningDate) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setLong(2, phone);
            pstmt.setString(3, address);
            pstmt.setString(4, department);
            pstmt.setDate(5, new java.sql.Date(dob.getTime()));
            pstmt.setDate(6, new java.sql.Date(joiningDate.getTime()));

            // Execute the statement
            pstmt.executeUpdate();

            // Show success message
            out.println("<script>showMessage('Employee added successfully!');</script>");

        } catch (NumberFormatException nfe) {
            // Show error message for invalid phone number format
            out.println("<script>showMessage('Phone number must be numeric');</script>");
        } catch (Exception e) {
            // Show error message for other exceptions
            out.println("<script>showMessage('Error: " + e.getMessage() + "');</script>");
        } finally {
            // Finally block to close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                // Show error message for SQL exception
                out.println("<script>showMessage('Error: " + se.getMessage() + "');</script>");
            }
        }
    %>

    <!-- Add form for entering employee details -->
    <form action="AddEmployee.jsp" method="post">
        <label>Name:</label>
        <input type="text" name="name"><br><br>
        
        <label>Phone:</label>
        <input type="text" name="phone"><br><br>
        
        <label>Address:</label>
        <input type="text" name="address"><br><br>
        
        <label>Department:</label>
        <input type="text" name="department"><br><br>
        
        <label>Date of Birth:</label>
        <input type="date" name="dob"><br><br>
        
        <label>Joining Date:</label>
        <input type="date" name="joiningDate"><br><br>
        
        <input type="submit" value="Add Employee">
    </form>

</body>
</html>
