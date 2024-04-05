<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System</title>
</head>
<body>
    <h1>Employee Management System</h1>

    <div>
        <h2>Add Employee</h2>
        <form action="AddEmployee.jsp" method="get">
            <input type="submit" value="Add Employee">
        </form>
    </div>

    <div>
        <h2>View Employee</h2>
        <form action="ViewEmployee.jsp" method="get">
            <input type="submit" value="View Employee">
        </form>
    </div>

    <div>
        <h2>Search Employee</h2>
        <form action="SearchEmployee.jsp" method="get">
            <input type="submit" value="Search Employee">
        </form>
    </div>

    <div>
        <h2>Remove Employee</h2>
        <form action="RemoveEmployee.jsp" method="get">
            <input type="submit" value="Remove Employee">
        </form>
    </div>

    <div>
        <h2>Order</h2>
        <form action="Order.jsp" method="get">
            <input type="submit" value="Order">
        </form>
    </div>

</body>
</html>
