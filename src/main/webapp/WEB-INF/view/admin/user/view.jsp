<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html>

        <head>
            <meta charset="UTF-8">
            <title>User Detail</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-4">
                <h1>Chi tiết User</h1>
                <table class="table table-bordered">
                    <tr>
                        <th>ID</th>
                        <td>${user.id}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${user.email}</td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>${user.phone}</td>
                    </tr>
                    <tr>
                        <th>Full Name</th>
                        <td>${user.fullName}</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>${user.address}</td>
                    </tr>
                </table>
                <a href="/admin/user/home" class="btn btn-secondary">Quay lại</a>
            </div>
        </body>

        </html>