<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Header CSS + JS (paths use contextPath so they work under any app context) -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/header.css" />
        <script src="${pageContext.request.contextPath}/client/js/header.js" defer></script>

        <header class="site-header" role="banner">
            <div class="header-inner">

                <!-- Left: Logo -->
                <div class="header-left">
                    <a class="logo" href="${pageContext.request.contextPath}/" aria-label="Fruitables home">
                        <span class="logo-mark">Laptop</span><span class="logo-name">Shop</span>
                    </a>
                </div>

                <!-- Center: Navigation (collapsible on small screens) -->
                <nav class="main-nav" id="mainNav" role="navigation" aria-label="Main navigation">
                    <ul class="nav-list">
                        <li><a href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/shop" class="nav-link">Shop</a></li>
                        <li><a href="#" class="nav-link">Shop Detail</a></li>
                        <li class="has-dropdown">
                            <a href="#" class="nav-link">Pages <span class="caret">▾</span></a>
                            <ul class="dropdown">
                                <li><a href="#">About</a></li>
                                <li><a href="#">FAQ</a></li>
                            </ul>
                        </li>
                        <li><a href="#" class="nav-link">Contact</a></li>
                    </ul>
                </nav>

                <!-- Right: Actions -->
                <div class="header-right">
                    <c:if test="${not empty pageContext.request.userPrincipal}">
                        <!-- cart link with badge (value from session or 0) -->
                        <a class="btn-icon cart-link" href="${pageContext.request.contextPath}/cart"
                            aria-label="View cart" title="Cart">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                <path d="M6 7l1-3h10l1 3" stroke="#37b24d" stroke-width="1.5" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path d="M6 7h12v11a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2V7z" stroke="#37b24d"
                                    stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                <path d="M9 10a3 3 0 0 1 6 0" stroke="#37b24d" stroke-width="1.5" stroke-linecap="round"
                                    stroke-linejoin="round" />
                            </svg>
                            <span class="cart-badge" id="cartBadge">
                                <c:out value="${sessionScope.cartCount}" default="0" />
                            </span>
                        </a>

                        <!-- Profile dropdown -->
                        <div class="profile-menu has-dropdown">
                            <button class="profile-btn" aria-label="Profile" id="profileBtn">
                                <svg width="34" height="34" viewBox="0 0 24 24" aria-hidden="true">
                                    <circle cx="12" cy="8" r="3.2" fill="#f0f8f3" stroke="#37b24d" stroke-width="1" />
                                    <path d="M4 20c1.6-4 6-6 8-6s6.4 2 8 6" fill="#f0f8f3" stroke="#37b24d"
                                        stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                            </button>
                            <ul class="dropdown profile-dropdown">
                                <li><a href="${pageContext.request.contextPath}/profile">Quản lý tài khoản</a></li>
                                <li><a href="${pageContext.request.contextPath}/orders">Quản lý mua hàng</a></li>
                                <li>
                                    <form method="post" action="/logout">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <button class="btn btn-sm btn-outline-danger">Đăng xuất</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                        <c:out value="${pageContext.request.userPrincipal.name}" />

                        <!-- mobile hamburger (visible on small screens) -->
                        <button class="hamburger" id="hamburger" aria-label="Open menu" aria-expanded="false"
                            aria-controls="mainNav">
                            <span class="bar"></span><span class="bar"></span><span class="bar"></span>
                        </button>
                    </c:if>
                    <c:if test="${empty pageContext.request.userPrincipal}">
                        <a href="${pageContext.request.contextPath}/login" class="nav-link"
                            style="color: red;">Login</a>
                    </c:if>
                </div>
            </div>

            <!-- Search overlay (hidden by default) -->
            <div class="search-overlay" id="searchOverlay" aria-hidden="true">
                <div class="search-panel" role="search">
                    <form action="${pageContext.request.contextPath}/search" method="get" class="search-form"
                        onsubmit="document.getElementById('searchOverlay').classList.remove('show');">
                        <input name="q" type="search" class="search-input"
                            placeholder="Search products, e.g. apples, bananas..." aria-label="Search" />
                        <button type="submit" class="search-go">Search</button>
                        <button type="button" class="search-close" aria-label="Close search">✕</button>
                    </form>
                </div>
            </div>
        </header>