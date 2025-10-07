<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <jsp:useBean id="now" class="java.util.Date" />
            <fmt:formatDate value="${now}" pattern="yyyy" var="currentYear" />

            <footer class="site-footer content-offset">
                <div class="container-fluid d-flex flex-wrap align-items-center justify-content-between gap-2">
                    <div class="text-secondary small">
                        © ${currentYear} Laptopshop. All rights reserved.
                    </div>
                    <ul class="nav small">
                        <li class="nav-item">
                            <a class="nav-link px-2 text-secondary" href="/privacy">Privacy</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-2 text-secondary" href="/terms">Terms</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link px-2 text-secondary" href="/support">Support</a>
                        </li>
                    </ul>
                </div>
            </footer>