<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>User Home</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-4">
                <h1>Danh sách User</h1>
                <table class="table table-bordered table-striped mt-3">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Phone</th>
                            <th>Full Name</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${allUsers}">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.email}</td>
                                <td>${u.password}</td>
                                <td>${u.phone}</td>
                                <td>${u.fullName}</td>
                                <td>${u.address}</td>
                                <td>
                                    <!-- Nút View -->
                                    <a href="/admin/user/view/${u.id}" class="btn btn-info btn-sm">View</a>

                                    <!-- Nút Update -->
                                    <a href="/admin/user/update/${u.id}" class="btn btn-warning btn-sm">Update</a>

                                    <!-- Nút Delete (dùng form POST để an toàn) -->
                                    <form method="post" action="/admin/user/delete" style="display:inline;">
                                        <input type="hidden" name="userId" value="${u.id}" />
                                        <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc chắn muốn xóa user này?');">
                                            Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="/admin/user/create" class="btn btn-primary m-3">Create New User</a>
        </body>

        </html>