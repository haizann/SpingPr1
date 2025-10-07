<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Fixed Top Navbar (offset by sidebar) -->
        <nav class="navbar navbar-expand bg-body-tertiary fixed-top shadow-sm content-offset">
            <div class="container-fluid">
                <button class="btn btn-outline-secondary d-lg-none" id="toggleSidebar" type="button"
                    aria-label="Toggle sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="ms-auto d-flex align-items-center gap-3">
                    <span class="text-secondary">
                        Welcome, <b>
                            <c:out value="${sessionScope.userName != null ? sessionScope.userName : 'Admin'}" />
                        </b>
                    </span>
                    <a href="/logout" class="btn btn-sm btn-outline-danger">Logout</a>
                </div>
            </div>
        </nav>