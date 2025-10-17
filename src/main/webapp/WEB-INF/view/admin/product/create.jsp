<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Create Product</title>

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
                                                <li class="breadcrumb-item"><a href="/admin/product">Products</a>
                                                </li>
                                                <li class="breadcrumb-item active" aria-current="page">Create</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div>
                                        <a href="/admin/product" class="btn btn-outline-secondary">
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
                                        <form:form method="post" action="/admin/product/create"
                                            modelAttribute="newProduct" enctype="multipart/form-data"
                                            cssClass="row g-3 needs-validation" htmlEscape="true">

                                            <!-- CSRF (nếu dùng Spring Security) -->
                                            <c:if test="${_csrf != null}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                            </c:if>

                                            <!-- Tên sản phẩm -->
                                            <spring:bind path="name">
                                                <div class="col-md-6">
                                                    <label for="name" class="form-label">Tên sản phẩm</label>
                                                    <form:input path="name" id="name" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập tên sản phẩm" required="required" />
                                                    <form:errors path="name" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Giá -->
                                            <spring:bind path="price">
                                                <div class="col-md-6">
                                                    <label for="price" class="form-label">Giá (VNĐ)</label>
                                                    <form:input path="price" id="price" type="number" step="0.01"
                                                        min="0" class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập giá sản phẩm" required="required" />
                                                    <form:errors path="price" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>



                                            <!-- Mô tả ngắn -->
                                            <spring:bind path="shortDesc">
                                                <div class="col-12">
                                                    <label for="shortDesc" class="form-label">Mô tả ngắn</label>
                                                    <form:input path="shortDesc" id="shortDesc" type="text"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập mô tả ngắn" />
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Mô tả chi tiết -->
                                            <spring:bind path="detailDesc">
                                                <div class="col-12">
                                                    <label for="detailDesc" class="form-label">Mô tả chi tiết</label>
                                                    <form:textarea path="detailDesc" id="detailDesc" rows="5"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập mô tả chi tiết" />
                                                    <form:errors path="detailDesc"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Số lượng -->
                                            <spring:bind path="quantity">
                                                <div class="col-md-6">
                                                    <label for="quantity" class="form-label">Số lượng</label>
                                                    <form:input path="quantity" id="quantity" type="number" min="0"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập số lượng" />
                                                    <form:errors path="quantity" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Đã bán -->
                                            <spring:bind path="sold">
                                                <div class="col-md-6">
                                                    <label for="sold" class="form-label">Đã bán</label>
                                                    <form:input path="sold" id="sold" type="number" min="0"
                                                        class="form-control ${status.error ? 'is-invalid' : ''}"
                                                        placeholder="Nhập số lượng đã bán" />
                                                    <form:errors path="sold" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Nhà sản xuất -->
                                            <spring:bind path="factory">
                                                <div class="col-md-6">
                                                    <label for="factory" class="form-label">Nhà sản xuất</label>
                                                    <form:select path="factory"
                                                        class="form-select ${status.error ? 'is-invalid' : ''}">
                                                        <form:option value="" label="-- Chọn nhà sản xuất --" />
                                                        <form:option value="ASUS" label="ASUS" />
                                                        <form:option value="DELL" label="DELL" />
                                                        <form:option value="VICTUS" label="VICTUS" />
                                                    </form:select>
                                                    <form:errors path="factory" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Đối tượng sử dụng -->
                                            <spring:bind path="target">
                                                <div class="col-md-6">
                                                    <label for="target" class="form-label">Nhà sản xuất</label>
                                                    <form:select path="target"
                                                        class="form-select ${status.error ? 'is-invalid' : ''}">
                                                        <form:option value="" label="-- Chọn mục tiêu --" />
                                                        <form:option value="GAMING" label="Gaming" />
                                                        <form:option value="SINHVIEN-VANPHONG"
                                                            label="Sinh viên - Văn phòng" />
                                                        <form:option value="THIET-KE-DO-HOA" label="Thiết kế đồ hoạ" />
                                                        <form:option value="MONG-NHE" label="Mỏng nhẹ" />
                                                        <form:option value="DOANH-NHAN" label="Doanh nhân" />
                                                    </form:select>
                                                    <form:errors path="target" cssClass="invalid-feedback d-block" />
                                                </div>
                                            </spring:bind>

                                            <!-- Ảnh upload -->
                                            <div class="col-md-6">
                                                <label for="imageFile" class="form-label">Ảnh sản phẩm</label>
                                                <input type="file" id="imageFile" name="imageFile" accept="image/*"
                                                    class="form-control" />
                                                <div class="form-text">Hỗ trợ JPG, PNG, GIF. Tối đa ~2MB.</div>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label d-block">Xem trước ảnh</label>
                                                <img id="imagePreview"
                                                    src="https://via.placeholder.com/120x120.png?text=Product"
                                                    alt="Preview" class="rounded" width="120" height="120"
                                                    style="object-fit: cover; border: 1px solid rgba(0,0,0,.1)" />
                                                <button type="button" class="btn btn-outline-secondary btn-sm ms-3"
                                                    id="clearImage">
                                                    Xóa ảnh
                                                </button>
                                            </div>

                                            <!-- Nút submit -->
                                            <div class="col-12 d-flex gap-2 mt-2">
                                                <button type="submit" class="btn btn-primary">
                                                    <i class="fas fa-save me-1"></i> Lưu sản phẩm
                                                </button>
                                                <a href="/admin/product" class="btn btn-secondary">
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
                        document.addEventListener('DOMContentLoaded', function () {
                            const fileInput = document.getElementById('imageFile');
                            const preview = document.getElementById('imagePreview');
                            const clearBtn = document.getElementById('clearImage');

                            // Preview khi chọn file
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

                            // Clear ảnh
                            if (clearBtn && preview && fileInput) {
                                clearBtn.addEventListener('click', () => {
                                    preview.src = "https://via.placeholder.com/120x120.png?text=Product";
                                    fileInput.value = "";
                                });
                            }
                        });

                    </script>
                </body>

                </html>