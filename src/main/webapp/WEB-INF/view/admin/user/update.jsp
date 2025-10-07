<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Update User</title>

                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Font Awesome (for icons) -->
                    <script src="https://use.fontawesome.com/releases/v6.5.2/js/all.js"
                        crossorigin="anonymous"></script>

                    <!-- Custom CSS (layout offsets) -->
                    <link href="/css/styles.css" rel="stylesheet" />
                </head>

                <body>
                    <!-- Shared header (sidebar + top navbar) -->
                    <jsp:include page="../layout/header.jsp" />
                    <jsp:include page="../layout/sidebar.jsp" />

                    <main id="content" class="flex-grow-1">
                        <div class="page-container">
                            <div class="container-fluid">

                                <!-- Page header -->
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div>
                                        <h1 class="h3 mb-1">Cập nhật User</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="/admin/user/home">Users</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Update</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div>
                                        <a href="/admin/user/home" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                                        </a>
                                    </div>
                                </div>

                                <!-- Form card -->
                                <div class="card border-0 shadow-sm">
                                    <div class="card-body">
                                        <!-- Global errors -->
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />

                                        <form:form method="post" action="/admin/user/update" modelAttribute="user"
                                            cssClass="row g-3 needs-validation" htmlEscape="true">
                                            <!-- CSRF (if using Spring Security) -->
                                            <c:if test="${_csrf != null}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </c:if>

                                            <!-- Hidden ID -->
                                            <form:input path="id" type="hidden" />

                                            <spring:bind path="email">
                                                <div class="col-md-6">
                                                    <label for="email" class="form-label">Email</label>
                                                    <!-- readonly to submit value but prevent edits -->
                                                    <form:input path="email" id="email" type="email"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        readonly="true" />
                                                    <form:errors path="email" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="phone">
                                                <div class="col-md-6">
                                                    <label for="phone" class="form-label">Số điện thoại</label>
                                                    <form:input path="phone" id="phone" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Ví dụ: 0901234567"
                                                        pattern="^[0-9\\-\\+\\s]{8,15}$" />
                                                    <form:errors path="phone" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="fullName">
                                                <div class="col-md-6">
                                                    <label for="fullName" class="form-label">Họ và tên</label>
                                                    <form:input path="fullName" id="fullName" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        required="required" />
                                                    <form:errors path="fullName" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="address">
                                                <div class="col-md-6">
                                                    <label for="address" class="form-label">Địa chỉ</label>
                                                    <form:input path="address" id="address" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}" />
                                                    <form:errors path="address" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <div class="col-12 d-flex gap-2 mt-2">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-save me-1"></i> Lưu thay đổi
                                                </button>
                                                <a href="/admin/user/home" class="btn btn-secondary">
                                                    <i class="fas fa-xmark me-1"></i> Hủy
                                                </a>
                                            </div>
                                        </form:form>
                                    </div>
                                </div>
                            </div><!-- /container-fluid -->
                        </div><!-- /page-container -->
                    </main>
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- JS libs -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>