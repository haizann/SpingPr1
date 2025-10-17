<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>${product.name} — Chi tiết sản phẩm</title>

                <!-- Bootstrap CSS & Icons -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
                    rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <style>
                    /* Simple, clean product detail styles */
                    .product-wrap {
                        padding-top: 2.5rem;
                        padding-bottom: 2.5rem;
                    }

                    .product-card {
                        border-radius: 12px;
                        box-shadow: 0 8px 30px rgba(18, 38, 63, 0.06);
                        overflow: hidden;
                        background: #fff;
                    }

                    .product-image {
                        background: linear-gradient(180deg, #f7fbff, #ffffff);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        min-height: 360px;
                    }

                    .product-image img {
                        max-width: 100%;
                        max-height: 460px;
                        object-fit: contain;
                        display: block;
                    }

                    .img-fallback {
                        width: 100%;
                        height: 360px;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        background: linear-gradient(90deg, #eef3ff, #ffffff);
                        color: #9aa7c0;
                    }

                    .product-meta .title {
                        font-size: 1.35rem;
                        font-weight: 700;
                        color: #07203a;
                        margin-bottom: 0.2rem;
                    }

                    .product-meta .subtitle {
                        color: #6c757d;
                        margin-bottom: 0.8rem;
                    }

                    .price {
                        font-size: 1.25rem;
                        color: #d63384;
                        font-weight: 800;
                    }

                    .stock {
                        font-weight: 600;
                    }

                    .btn-lg-custom {
                        height: 44px;
                        border-radius: 8px;
                        display: inline-flex;
                        align-items: center;
                        gap: .6rem;
                        padding: 0 .9rem;
                    }

                    .btn-buy {
                        background: linear-gradient(180deg, #2dbb63, #2aa85a);
                        border: none;
                        color: white;
                    }

                    .btn-cart {
                        background: linear-gradient(180deg, #0b5ed7, #0a58ca);
                        border: none;
                        color: white;
                    }

                    .specs dt {
                        font-weight: 600;
                    }

                    .specs dd {
                        margin-bottom: .6rem;
                        color: #495057;
                    }

                    @media (max-width: 767.98px) {
                        .product-image {
                            min-height: 260px;
                        }

                        .product-image img {
                            max-height: 320px;
                        }
                    }
                </style>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />

                <div class="container product-wrap">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-10">
                            <div class="product-card row g-0">
                                <!-- Left: image -->
                                <div class="col-12 col-md-6 product-image">
                                    <c:choose>
                                        <c:when test="${not empty product.image}">
                                            <img src="/images/product/${product.image}" class="card-img-top"
                                                alt="${product.name}" loading="lazy">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="img-fallback">Hình ảnh không có</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <!-- Right: meta & actions -->
                                <div class="col-12 col-md-6 p-4">
                                    <div class="product-meta mb-3">
                                        <div class="title" title="${product.name}">${product.name}</div>
                                        <div class="subtitle">${product.shortDesc}</div>

                                        <div class="d-flex align-items-center mb-3">
                                            <div class="price me-3">
                                                <fmt:formatNumber value="${product.price}" type="number"
                                                    groupingUsed="true" /> VND
                                            </div>
                                            <div class="text-muted">|</div>
                                            <div class="ms-3 text-muted small">Đã bán <strong>${product.sold}</strong>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <span class="badge bg-light text-dark me-2">Nhà sản xuất:
                                                ${product.factory}</span>

                                        </div>

                                        <div class="mb-3">
                                            <div>Trạng thái:
                                                <c:choose>
                                                    <c:when test="${product.quantity <= 0}">
                                                        <span class="text-danger stock">Hết hàng</span>
                                                    </c:when>
                                                    <c:when test="${product.quantity le 5}">
                                                        <span class="text-warning stock">Sắp hết (còn
                                                            ${product.quantity})</span>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <span class="text-success stock">Còn ${product.quantity} </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Actions -->
                                    <div class="mb-3 d-flex gap-2">
                                        <a href="/client/product/buy/${product.id}"
                                            class="btn btn-buy btn-lg-custom btn-buy w-100">
                                            <i class="bi bi-bag-check-fill" aria-hidden="true"></i>
                                            Mua ngay
                                        </a>

                                        <a href="/client/cart/add/${product.id}"
                                            class="btn btn-cart btn-lg-custom w-100">
                                            <i class="bi bi-cart-plus-fill" aria-hidden="true"></i>
                                            Thêm vào giỏ hàng
                                        </a>
                                    </div>

                                    <!-- Additional details -->
                                    <div class="mt-4">
                                        <h6 class="mb-2">Mô tả chi tiết</h6>
                                        <p class="text-muted small" style="white-space: pre-line;">
                                            <c:out value="${product.detailDesc}" default="Không có mô tả chi tiết" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="../layout/footer.jsp" />

                <script>
                    // Fade-in image when loaded and fallback handling
                    document.addEventListener('DOMContentLoaded', function () {
                        const img = document.getElementById('mainProductImage');
                        if (!img) return;
                        if (img.complete && img.naturalWidth !== 0) {
                            img.style.opacity = 1;
                        } else {
                            img.addEventListener('load', () => { img.style.opacity = 1; }, { once: true });
                            img.addEventListener('error', () => {
                                const fallback = document.createElement('div');
                                fallback.className = 'img-fallback';
                                fallback.textContent = 'Hình ảnh không tải được';
                                img.replaceWith(fallback);
                            }, { once: true });
                        }
                    });
                </script>
            </body>

            </html>