<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Danh sách sản phẩm</title>

                <!-- Bootstrap -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Bootstrap Icons (for the button icons you asked) -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
                    rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <link href="../client/css/homepage.css" rel="stylesheet" />

            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="container my-4">
                    <h2 class="mb-4">Danh sách sản phẩm</h2>

                    <div class="row products-grid">
                        <c:forEach var="product" items="${allProducts}">
                            <div class="product-col">
                                <a href="/product/${product.id}" class="text-decoration-none text-dark">
                                    <div class="card h-100 shadow-sm position-relative">

                                        <!-- Ảnh sản phẩm -->
                                        <c:choose>
                                            <c:when test="${not empty product.image}">
                                                <img src="/images/product/${product.image}" class="card-img-top"
                                                    alt="${product.name}" loading="lazy">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="img-fallback">Hình ảnh không có</div>
                                            </c:otherwise>
                                        </c:choose>


                                        <div class="card-body d-flex flex-column">
                                            <!-- Tên -->
                                            <h5 class="card-title" title="${product.name}">${product.name}</h5>

                                            <!-- Mô tả ngắn -->
                                            <p class="card-text short-desc">${product.shortDesc}</p>

                                            <!-- Giá -->
                                            <p class="card-text price">
                                                <fmt:formatNumber value="${product.price}" type="number"
                                                    groupingUsed="true" /> VND
                                            </p>

                                            <!-- Button group -->
                                            <div class="mt-auto d-grid gap-2">
                                                <a href="/client/product/buy/${product.id}"
                                                    class="product-btn btn-buy product-btn w-100 text-start">
                                                    <i class="bi bi-bag-check-fill"></i>
                                                    <span style="flex:1;">Mua ngay</span>
                                                </a>

                                                <a href="/client/cart/add/${product.id}"
                                                    class="product-btn btn-cart product-btn w-100 text-start">
                                                    <i class="bi bi-cart-plus-fill"></i>
                                                    <span style="flex:1;">Thêm vào giỏ hàng</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <!-- Custom JS (only JS changes as requested) -->
                <script>
                    (function () {
                        // Fade-in images and fallback
                        document.addEventListener('DOMContentLoaded', function () {
                            const imgs = document.querySelectorAll('.card-img-top');

                            imgs.forEach(img => {
                                if (img.complete && img.naturalWidth !== 0) {
                                    img.classList.add('loaded');
                                } else {
                                    img.addEventListener('load', () => img.classList.add('loaded'), { once: true });
                                    img.addEventListener('error', () => {
                                        const fallback = document.createElement('div');
                                        fallback.className = 'img-fallback';
                                        fallback.textContent = 'Hình ảnh không tải được';
                                        img.replaceWith(fallback);
                                    }, { once: true });
                                }
                            });
                        });
                    })();
                </script>
            </body>

            </html>