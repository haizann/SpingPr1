<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Product</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            <link href="../css/styles.css" rel="stylesheet" />
        </head>

        <body>
            <!-- include header -->
            <jsp:include page="../layout/header.jsp" />
            <jsp:include page="../layout/sidebar.jsp" />

            <!-- Nội dung chính -->
            <main class="page-container container-fluid">
                <h1>Order</h1>
            </main>

            <jsp:include page="../layout/footer.jsp" />


        </body>

        </html>