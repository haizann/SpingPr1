document.addEventListener("DOMContentLoaded", () => {
    // Toggle sidebar (mobile)
    const sidebar = document.getElementById("sidebar");
    const toggle = document.getElementById("toggleSidebar");
    if (toggle && sidebar) {
        toggle.addEventListener("click", () => sidebar.classList.toggle("show"));
    }

    // Simple-DataTables init
    const tableEl = document.getElementById("usersTable");
    if (tableEl && window.simpleDatatables) {
        new simpleDatatables.DataTable(tableEl, {
            searchable: true,
            perPage: 10,
            fixedHeight: false,
            labels: {
                placeholder: "Tìm kiếm...",
                perPage: "{select} dòng/trang",
                noRows: "Không có dữ liệu",
                info: "Hiển thị {start}–{end} trong tổng {rows} dòng"
            },
            columns: [
                { select: 6, sortable: false } // tắt sắp xếp cột Actions
            ]
        });
    }
});