<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <title>Admin Dashboard - Laptopshop</title>

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

            <!-- Simple-DataTables CSS -->
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@9.0.3/dist/style.css" rel="stylesheet" />

            <!-- Font Awesome -->
            <script src="https://use.fontawesome.com/releases/v6.5.2/js/all.js" crossorigin="anonymous"></script>

            <!-- Custom CSS -->
            <link href="../css/styles.css" rel="stylesheet" />
        </head>

        <body>
            <jsp:include page="../layout/header.jsp" />
            <jsp:include page="../layout/sidebar.jsp" />

            <!-- Page Content -->
            <main id="content" class="flex-grow-1">
                <div class="page-container">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0">Dashboard</h1>
                            <div>
                                <a href="/admin/settings" class="btn btn-outline-secondary btn-sm me-2">
                                    <i class="fas fa-gear me-1"></i> Settings
                                </a>
                                <a href="/admin/reports/export" class="btn btn-primary btn-sm">
                                    <i class="fas fa-download me-1"></i> Export
                                </a>
                            </div>
                        </div>

                        <!-- KPI Cards -->
                        <div class="row g-3 mb-4">
                            <div class="col-12 col-sm-6 col-xl-3">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="kpi-icon text-primary bg-primary-subtle me-3">
                                            <i class="fas fa-users"></i>
                                        </div>
                                        <div>
                                            <div class="text-secondary small">Total Users</div>
                                            <div class="fs-4 fw-semibold">
                                                <c:out value="${stats.userCount != null ? stats.userCount : 12450}" />
                                            </div>
                                            <div class="text-success small"><i class="fas fa-arrow-up me-1"></i> +3.2%
                                                MoM</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-xl-3">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="kpi-icon text-success bg-success-subtle me-3">
                                            <i class="fas fa-sack-dollar"></i>
                                        </div>
                                        <div>
                                            <div class="text-secondary small">Revenue</div>
                                            <div class="fs-4 fw-semibold">
                                                $
                                                <c:out value="${stats.revenue != null ? stats.revenue : 98210}" />
                                            </div>
                                            <div class="text-success small"><i class="fas fa-arrow-up me-1"></i> +5.1%
                                                MoM</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-xl-3">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="kpi-icon text-warning bg-warning-subtle me-3">
                                            <i class="fas fa-box-open"></i>
                                        </div>
                                        <div>
                                            <div class="text-secondary small">Products</div>
                                            <div class="fs-4 fw-semibold">
                                                <c:out
                                                    value="${stats.productCount != null ? stats.productCount : 356}" />
                                            </div>
                                            <div class="text-warning small"><i class="fas fa-circle me-1"></i> In stock
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-xl-3">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-body d-flex align-items-center">
                                        <div class="kpi-icon text-danger bg-danger-subtle me-3">
                                            <i class="fas fa-receipt"></i>
                                        </div>
                                        <div>
                                            <div class="text-secondary small">Orders</div>
                                            <div class="fs-4 fw-semibold">
                                                <c:out value="${stats.orderCount != null ? stats.orderCount : 842}" />
                                            </div>
                                            <div class="text-secondary small">Today:
                                                <c:out value="${stats.ordersToday != null ? stats.ordersToday : 28}" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Charts -->
                        <div class="row g-3 mb-4">
                            <div class="col-12 col-xl-6">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-header bg-transparent">
                                        <i class="fas fa-chart-area me-2 text-primary"></i> Sessions (Last 2 Weeks)
                                    </div>
                                    <div class="card-body">
                                        <canvas id="areaChart" height="140"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-6">
                                <div class="card border-0 shadow-sm h-100">
                                    <div class="card-header bg-transparent">
                                        <i class="fas fa-chart-column me-2 text-primary"></i> Monthly Revenue
                                    </div>
                                    <div class="card-body">
                                        <canvas id="barChart" height="140"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- DataTable -->
                        <div class="card border-0 shadow-sm mb-5">
                            <div class="card-header bg-transparent">
                                <i class="fas fa-table me-2 text-primary"></i> Latest Orders
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="datatablesSimple" class="table table-striped align-middle">
                                        <thead>
                                            <tr>
                                                <th>Order #</th>
                                                <th>Customer</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                <th>Total</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>INV-2025-00123</td>
                                                <td>Tiger Nixon</td>
                                                <td><span class="badge bg-success-subtle text-success">Paid</span></td>
                                                <td>2025-10-01</td>
                                                <td>$320.80</td>
                                                <td>
                                                    <a href="/admin/order/123" class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>INV-2025-00124</td>
                                                <td>Garrett Winters</td>
                                                <td><span class="badge bg-warning-subtle text-warning">Pending</span>
                                                </td>
                                                <td>2025-10-02</td>
                                                <td>$170.75</td>
                                                <td>
                                                    <a href="/admin/order/124" class="btn btn-sm btn-outline-primary">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <!-- Add dynamic rows here -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div> <!-- /container-fluid -->
                </div> <!-- /page-container -->
            </main>
            <jsp:include page="../layout/footer.jsp" />
            <!-- JS Libraries -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.5/dist/chart.umd.min.js"></script>
            <script
                src="https://cdn.jsdelivr.net/npm/simple-datatables@9.0.3/dist/umd/simple-datatables.min.js"></script>

            <!-- Custom JS -->
            <script src="/js/scripts.js"></script>
        </body>

        </html>