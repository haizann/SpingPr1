<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Create User</title>

                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Custom CSS (layout: sidebar + navbar offsets) -->
                    <link href="/css/styles.css" rel="stylesheet" />
                </head>

                <body>
                    <!-- Sidebar + Navbar -->
                    <jsp:include page="../layout/header.jsp" />
                    <jsp:include page="../layout/sidebar.jsp" />

                    <main id="content" class="flex-grow-1">
                        <div class="page-container">
                            <div class="container-fluid">

                                <!-- Page header -->
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <div>
                                        <h1 class="h3 mb-1">Create User</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="/admin/user/home">Users</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Create</li>
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

                                        <!-- IMPORTANT: enctype for file upload -->
                                        <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                            enctype="multipart/form-data" cssClass="row g-3 needs-validation"
                                            htmlEscape="true">

                                            <!-- CSRF (nếu dùng Spring Security) -->
                                            <c:if test="${_csrf != null}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </c:if>

                                            <spring:bind path="email">
                                                <div class="col-md-6">
                                                    <label for="email" class="form-label">Email</label>
                                                    <form:input path="email" id="email" type="email"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="name@example.com" required="required" />
                                                    <form:errors path="email" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="password">
                                                <div class="col-md-6">
                                                    <label for="password" class="form-label">Password</label>
                                                    <div class="input-group">
                                                        <form:input path="password" id="password" type="password"
                                                            class="form-control ${status.error ? 'is-invalid' : ''}"
                                                            minlength="6" placeholder="Tối thiểu 6 ký tự"
                                                            required="required" />
                                                        <button class="btn btn-outline-secondary" type="button"
                                                            id="togglePwd" tabindex="-1">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                    </div>
                                                    <form:errors path="password" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="phone">
                                                <div class="col-md-6">
                                                    <label for="phone" class="form-label">Phone number</label>
                                                    <form:input path="phone" id="phone" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Ví dụ: 0901234567"
                                                        pattern="^[0-9\\-\\+\\s]{8,15}$" />
                                                    <form:errors path="phone" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="fullName">
                                                <div class="col-md-6">
                                                    <label for="fullName" class="form-label">Full name</label>
                                                    <form:input path="fullName" id="fullName" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Họ và tên" required="required" />
                                                    <form:errors path="fullName" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <spring:bind path="address">
                                                <div class="col-12">
                                                    <label for="address" class="form-label">Address</label>
                                                    <form:input path="address" id="address" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Địa chỉ" />
                                                    <form:errors path="address" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Role select -->
                                            <spring:bind path="role">
                                                <div class="col-md-6">
                                                    <label for="role" class="form-label">Role</label>
                                                    <form:select path="role.name"
                                                        class="form-select ${status.error ? 'is-invalid' : ''}">
                                                        <form:option value="" label="-- Chọn role --" />
                                                        <form:option value="ADMIN" label="Admin" />
                                                        <form:option value="USER" label="User" />
                                                    </form:select>
                                                    <form:errors path="role" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Avatar upload + preview -->
                                            <div class="col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar (chọn ảnh)</label>
                                                <input type="file" id="avatarFile" name="avatarFile" accept="image/*"
                                                    class="form-control" />
                                                <div class="form-text">Hỗ trợ JPG, PNG, GIF. Tối đa ~2MB (phụ thuộc cấu
                                                    hình server).</div>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label d-block">Xem trước Avatar</label>
                                                <img id="avatarPreview"
                                                    src="https://via.placeholder.com/96x96.png?text=Avatar"
                                                    alt="Preview" class="rounded" width="96" height="96"
                                                    style="object-fit: cover; border: 1px solid rgba(0,0,0,.1)" />
                                                <button type="button" class="btn btn-outline-secondary btn-sm ms-3"
                                                    id="clearAvatar">
                                                    Xóa ảnh
                                                </button>
                                            </div>

                                            <div class="col-12 d-flex gap-2 mt-2">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-save me-1"></i> Submit
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

                    <!-- JS -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                    <script>
                        // Toggle password visibility
                        document.addEventListener('DOMContentLoaded', function () {
                            const btn = document.getElementById('togglePwd');
                            const pwd = document.getElementById('password');
                            if (btn && pwd) {
                                btn.addEventListener('click', () => {
                                    const isPwd = pwd.getAttribute('type') === 'password';
                                    pwd.setAttribute('type', isPwd ? 'text' : 'password');
                                    btn.querySelector('i')?.classList.toggle('fa-eye');
                                    btn.querySelector('i')?.classList.toggle('fa-eye-slash');
                                });
                            }

                            const fileInput = document.getElementById('avatarFile');
                            const urlInput = document.getElementById('avatarUrl');
                            const preview = document.getElementById('avatarPreview');
                            const clearBtn = document.getElementById('clearAvatar');

                            // Preview when picking a file
                            if (fileInput && preview) {
                                fileInput.addEventListener('change', (e) => {
                                    const file = e.target.files && e.target.files[0];
                                    if (file) {
                                        const reader = new FileReader();
                                        reader.onload = (ev) => preview.src = ev.target.result;
                                        reader.readAsDataURL(file);
                                    }
                                });
                            }


                            // Clear avatar
                            if (clearBtn) {
                                clearBtn.addEventListener('click', () => {
                                    preview.src = "https://via.placeholder.com/96x96.png?text=Avatar";
                                    if (fileInput) fileInput.value = "";
                                    if (urlInput) urlInput.value = "";
                                });
                            }
                        });
                    </script>
                </body>

                </html>