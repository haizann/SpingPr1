<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>User Home</title>

                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

                <!-- Simple-DataTables CSS -->
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@9.0.3/dist/style.css" rel="stylesheet" />

                <!-- Font Awesome -->
                <script src="https://use.fontawesome.com/releases/v6.5.2/js/all.js" crossorigin="anonymous"></script>

                <!-- Custom CSS (chứa .page-container, .content-offset, sidebar, v.v.) -->
                <link href="/css/styles.css" rel="stylesheet" />
            </head>

            <body>
                <!-- Kế thừa Header (Sidebar + Navbar) -->
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <!-- Nội dung chính -->
                <main id="content" class="flex-grow-1">
                    <div class="page-container">
                        <div class="container-fluid">

                            <!-- Tiêu đề + Breadcrumb + Nút tạo mới -->
                            <div class="d-flex flex-wrap align-items-center justify-content-between mb-4">
                                <div>
                                    <h1 class="h3 mb-1">Danh sách User</h1>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb mb-0">
                                            <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Users</li>
                                        </ol>
                                    </nav>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="text-secondary me-2">Tổng:
                                        <strong>${fn:length(allUsers)}</strong></span>
                                    <a href="/admin/user/create" class="btn btn-primary">
                                        <i class="fas fa-user-plus me-1"></i> Tạo mới
                                    </a>
                                </div>
                            </div>

                            <!-- Bảng Users -->
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-transparent">
                                    <i class="fas fa-users me-2 text-primary"></i> Tất cả người dùng
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="usersTable"
                                            class="table table-hover table-striped align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th style="min-width: 80px;">ID</th>
                                                    <th style="min-width: 220px;">Email</th>

                                                    <th style="min-width: 140px;">Phone</th>
                                                    <th style="min-width: 200px;">Full Name</th>
                                                    <th>Address</th>
                                                    <th style="min-width: 160px;" class="text-center">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="u" items="${allUsers}">
                                                    <tr>
                                                        <td><span class="text-muted">#${u.id}</span></td>
                                                        <td class="fw-semibold">${u.email}</td>



                                                        <td>${u.phone}</td>
                                                        <td>${u.fullName}</td>
                                                        <td>${u.address}</td>
                                                        <td class="text-center">
                                                            <div class="btn-group" role="group" aria-label="Actions">
                                                                <a href="/admin/user/view/${u.id}"
                                                                    class="btn btn-outline-primary btn-sm" title="Xem">
                                                                    <i class="fas fa-eye"></i>
                                                                </a>
                                                                <a href="/admin/user/update/${u.id}"
                                                                    class="btn btn-outline-warning btn-sm" title="Sửa">
                                                                    <i class="fas fa-pen"></i>
                                                                </a>
                                                                <form method="post" action="/admin/user/delete"
                                                                    class="d-inline">
                                                                    <input type="hidden" name="userId"
                                                                        value="${u.id}" />
                                                                    <button type="submit"
                                                                        class="btn btn-outline-danger btn-sm"
                                                                        title="Xóa"
                                                                        onclick="return confirm('Bạn có chắc chắn muốn xóa user #${u.id}?');">
                                                                        <i class="fas fa-trash"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div><!-- /container-fluid -->
                    </div><!-- /page-container -->
                </main>
                <jsp:include page="../layout/footer.jsp" />
                <!-- JS Libraries -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script
                    src="https://cdn.jsdelivr.net/npm/simple-datatables@9.0.3/dist/umd/simple-datatables.min.js"></script>

                <!-- Page JS -->
                <script src="/js/users-home.js"></script>
            </body>

            </html>