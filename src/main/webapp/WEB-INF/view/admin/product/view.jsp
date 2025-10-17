<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Product Detail</title>

                    <!-- Bootstrap CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet" />

                    <!-- Font Awesome -->
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
                                        <h1 class="h3 mb-1">Chi tiết sản phẩm</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb mb-0">
                                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                                <li class="breadcrumb-item"><a href="/admin/product">Products</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Detail</li>
                                            </ol>
                                        </nav>
                                    </div>
                                    <div class="d-flex gap-2">
                                        <a href="/admin/product/update/${product.id}" class="btn btn-warning">
                                            <i class="fas fa-pen me-1"></i> Sửa
                                        </a>
                                        <a href="/admin/product" class="btn btn-outline-secondary">
                                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                                        </a>
                                    </div>
                                </div>

                                <!-- Detail card -->
                                <div class="card border-0 shadow-sm">
                                    <div class="card-body">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">ID</div>
                                                <div class="fw-semibold">#
                                                    <c:out value="${product.id}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Tên sản phẩm</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.name}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Giá</div>
                                                <div class="fw-semibold">
                                                    <fmt:formatNumber value="${product.price}" type="number" />
                                                    VND
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Mô tả ngắn</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.shortDesc}" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="mb-2 text-secondary small">Mô tả chi tiết</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.detailDesc}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Số lượng</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.quantity}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Đã bán</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.sold}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Nhà sản xuất</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.factory}" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Mục tiêu</div>
                                                <div class="fw-semibold">
                                                    <c:out value="${product.target}" />
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="mb-2 text-secondary small">Ảnh sản phẩm</div>
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${not empty product.image}">
                                                            <img src="${pageContext.request.contextPath}/images/product/${product.image}"
                                                                alt="Avatar" class="rounded" width="120" height="120"
                                                                style="object-fit: cover; border: 1px solid rgba(0,0,0,.1)" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="https://via.placeholder.com/120x120.png?text=No+Avatar"
                                                                alt="Avatar" class="rounded" width="120" height="120"
                                                                style="object-fit: cover; border: 1px solid rgba(0,0,0,.1)" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
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