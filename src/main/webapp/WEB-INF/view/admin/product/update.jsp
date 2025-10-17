<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                        <!DOCTYPE html>
                        <html lang="vi">

                        <head>
                            <meta charset="UTF-8" />
                            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                            <title>Update product</title>

                            <!-- Bootstrap CSS -->
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                                rel="stylesheet" />

                            <!-- Font Awesome (for icons) -->
                            <script src="https://use.fontawesome.com/releases/v6.5.2/js/all.js"
                                crossorigin="anonymous"></script>

                            <!-- Custom CSS (layout offsets) -->
                            <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
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
                                                <h1 class="h3 mb-1">Cập nhật sản phẩm</h1>
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb mb-0">
                                                        <li class="breadcrumb-item"><a
                                                                href="${pageContext.request.contextPath}/admin">Dashboard</a>
                                                        </li>
                                                        <li class="breadcrumb-item"><a
                                                                href="${pageContext.request.contextPath}/admin/product">Products</a>
                                                        </li>
                                                        <li class="breadcrumb-item active" aria-current="page">Update
                                                        </li>
                                                    </ol>
                                                </nav>
                                            </div>
                                            <div>
                                                <a href="${pageContext.request.contextPath}/admin/product"
                                                    class="btn btn-outline-secondary">
                                                    <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                </a>
                                            </div>
                                        </div>

                                        <!-- Form card -->
                                        <div class="card border-0 shadow-sm">
                                            <div class="card-body">
                                                <!-- Global errors -->
                                                <form:errors path="*" element="div" cssClass="alert alert-danger" />

                                                <form:form method="post"
                                                    action="${pageContext.request.contextPath}/admin/product/update"
                                                    enctype="multipart/form-data" modelAttribute="product"
                                                    cssClass="row g-3 needs-validation" htmlEscape="true">
                                                    <!-- CSRF (if using Spring Security) -->
                                                    <c:if test="${_csrf != null}">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                    </c:if>

                                                    <!-- Hidden ID -->
                                                    <form:input path="id" type="hidden" />

                                                    <spring:bind path="name">
                                                        <div class="col-md-6">
                                                            <label for="name" class="form-label">Tên sản phẩm</label>
                                                            <!-- readonly to submit value but prevent edits -->
                                                            <form:input path="name" id="name" type="text"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                readonly="true" />
                                                            <form:errors path="name"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="price">
                                                        <div class="col-md-6">
                                                            <label for="price" class="form-label">Giá sản phẩm</label>
                                                            <fmt:formatNumber value="${status.value}"
                                                                var="formattedPrice" type="number" pattern="#" />
                                                            <input type="number" step="0.01" name="price" id="price"
                                                                value="${formattedPrice}"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}" />
                                                            <form:errors path="price"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>


                                                    <spring:bind path="shortDesc">
                                                        <div class="col-md-6">
                                                            <label for="shortDesc" class="form-label">Mô tả ngắn</label>
                                                            <form:input path="shortDesc" id="shortDesc" type="text"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}"
                                                                required="required" />
                                                            <form:errors path="shortDesc"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="detailDesc">
                                                        <div class="col-md-12">
                                                            <label for="detailDesc" class="form-label">Mô tả chi
                                                                tiết</label>
                                                            <form:input path="detailDesc" id="detailDesc" type="text"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}" />
                                                            <form:errors path="detailDesc"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="quantity">
                                                        <div class="col-md-6">
                                                            <label for="quantity" class="form-label">Số lượng</label>
                                                            <form:input path="quantity" id="quantity" type="number"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}" />
                                                            <form:errors path="quantity"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="sold">
                                                        <div class="col-md-6">
                                                            <label for="sold" class="form-label">Đã bán</label>
                                                            <form:input path="sold" id="sold" type="number"
                                                                class="form-control ${status.error ? 'is-invalid' : ''}" />
                                                            <form:errors path="sold"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <spring:bind path="factory">
                                                        <div class="col-md-6">
                                                            <label for="factory" class="form-label">Nhà sản xuất</label>
                                                            <form:select path="factory"
                                                                class="form-select ${status.error ? 'is-invalid' : ''}">
                                                                <!-- Option mặc định -->
                                                                <form:option value="" label="-- Chọn nhà sản xuất --" />

                                                                <!-- Các option cố định -->
                                                                <form:option value="ASUS" label="ASUS" />
                                                                <form:option value="DELL" label="DELL" />
                                                                <form:option value="VICTUS" label="VICTUS" />
                                                            </form:select>
                                                            <form:errors path="factory"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>


                                                    <spring:bind path="target">
                                                        <div class="col-md-6">
                                                            <label for="target" class="form-label">Mục tiêu</label>
                                                            <form:select path="target"
                                                                class="form-select ${status.error ? 'is-invalid' : ''}">
                                                                <!-- Option mặc định -->
                                                                <form:option value="" label="-- Chọn mục tiêu --" />

                                                                <!-- Các option cố định -->
                                                                <form:option value="GAMING" label="Gaming" />
                                                                <form:option value="SINHVIEN-VANPHONG"
                                                                    label="Sinh viên - Văn phòng" />
                                                                <form:option value="THIET-KE-DO-HOA"
                                                                    label="Thiết kế đồ hoạ" />
                                                                <form:option value="MONG-NHE" label="Mỏng nhẹ" />
                                                                <form:option value="DOANH-NHAN" label="Doanh nhân" />
                                                            </form:select>
                                                            <form:errors path="target"
                                                                cssClass="invalid-feedback d-block" />
                                                        </div>
                                                    </spring:bind>

                                                    <div class="col-md-6">
                                                        <label for="image" class="form-label">Ảnh sản phẩm</label>
                                                        <input type="file" id="image" name="imageFile" accept="image/*"
                                                            class="form-control" />
                                                        <div class="form-text">Hỗ trợ JPG, PNG, GIF. Tối đa ~2MB.</div>
                                                    </div>

                                                    <!-- hidden flag to request image removal -->
                                                    <input type="hidden" name="removeImage" id="removeImage"
                                                        value="false" />

                                                    <!-- preview + clear button (dbImageUrl logic unchanged) -->
                                                    <c:choose>
                                                        <c:when test="${not empty product.image}">
                                                            <c:set var="dbImageUrl"
                                                                value="${pageContext.request.contextPath}/images/product/${fn:escapeXml(product.image)}" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="dbImageUrl"
                                                                value="https://via.placeholder.com/120x120.png?text=Product" />
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <div class="col-md-6">
                                                        <label class="form-label d-block">Xem trước ảnh</label>
                                                        <img id="imagePreview" src="${dbImageUrl}" alt="Preview"
                                                            class="rounded" width="120" height="120"
                                                            style="object-fit: cover; border: 1px solid rgba(0,0,0,.1)" />
                                                        <button type="button"
                                                            class="btn btn-outline-secondary btn-sm ms-3"
                                                            id="clearImage" data-db-src="${dbImageUrl}">Xóa ảnh</button>
                                                    </div>


                                                    <div class="col-12 d-flex gap-2 mt-2">
                                                        <button type="submit" class="btn btn-primary">
                                                            <i class="fas fa-save me-1"></i> Lưu thay đổi
                                                        </button>
                                                        <a href="${pageContext.request.contextPath}/admin/user/home"
                                                            class="btn btn-secondary">
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
                            <script>
                                (function () {
                                    const fileInput = document.getElementById('image'); // id unchanged
                                    const preview = document.getElementById('imagePreview');
                                    const clearBtn = document.getElementById('clearImage');
                                    const dbSrc = clearBtn ? clearBtn.getAttribute('data-db-src') : '';
                                    const removeInput = document.getElementById('removeImage');

                                    if (fileInput) {
                                        fileInput.addEventListener('change', function (e) {
                                            if (removeInput) removeInput.value = 'false';
                                            const file = e.target.files && e.target.files[0];
                                            if (!file) { if (dbSrc) preview.src = dbSrc; return; }
                                            const reader = new FileReader();
                                            reader.onload = function (ev) { preview.src = ev.target.result; };
                                            reader.readAsDataURL(file);
                                        });
                                    }

                                    if (clearBtn) {
                                        clearBtn.addEventListener('click', function () {
                                            if (removeInput) removeInput.value = 'true';
                                            if (fileInput) {
                                                try { fileInput.value = ''; } catch (err) { fileInput.type = 'text'; fileInput.type = 'file'; }
                                            }
                                            preview.src = 'https://via.placeholder.com/120x120.png?text=Product';
                                        });
                                    }
                                })();
                            </script>
                        </body>

                        </html>