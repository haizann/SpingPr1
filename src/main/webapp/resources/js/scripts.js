document.addEventListener("DOMContentLoaded", () => {
    // Sidebar toggle for mobile
    const sidebar = document.getElementById("sidebar");
    const toggle = document.getElementById("toggleSidebar");
    if (toggle) {
        toggle.addEventListener("click", () => {
            sidebar.classList.toggle("show");
        });
    }

    // Charts (Chart.js v4)
    const areaCtx = document.getElementById("areaChart");
    if (areaCtx && window.Chart) {
        const areaChart = new Chart(areaCtx, {
            type: "line",
            data: {
                labels: ["Mar 1", "Mar 3", "Mar 5", "Mar 7", "Mar 9", "Mar 11", "Mar 13"],
                datasets: [{
                    label: "Sessions",
                    data: [10000, 30162, 18394, 31274, 26182, 25437, 40245],
                    borderColor: "#2563eb",
                    backgroundColor: "rgba(37, 99, 235, 0.15)",
                    fill: true,
                    tension: 0.35,
                    pointRadius: 3,
                    pointBackgroundColor: "#2563eb",
                    pointBorderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { grid: { color: "rgba(0,0,0,0.05)" } },
                    x: { grid: { display: false } }
                },
                plugins: {
                    legend: { display: false },
                    tooltip: { mode: "index", intersect: false }
                }
            }
        });
    }

    const barCtx = document.getElementById("barChart");
    if (barCtx && window.Chart) {
        const barChart = new Chart(barCtx, {
            type: "bar",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
                datasets: [{
                    label: "Revenue",
                    data: [4215, 5312, 6251, 7841, 9821, 14984],
                    backgroundColor: "rgba(37, 99, 235, 0.8)",
                    borderRadius: 6,
                    maxBarThickness: 36
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: { grid: { color: "rgba(0,0,0,0.05)" } },
                    x: { grid: { display: false } }
                },
                plugins: {
                    legend: { display: false },
                    tooltip: { mode: "index", intersect: false }
                }
            }
        });
    }

    // Simple-DataTables
    const table = document.querySelector("#datatablesSimple");
    if (table && window.simpleDatatables) {
        new simpleDatatables.DataTable(table, {
            searchable: true,
            fixedHeight: false,
            perPage: 10,
            labels: {
                placeholder: "Search...",
                perPage: "{select} per page",
                noRows: "No entries found",
                info: "Showing {start} to {end} of {rows} entries"
            }
        });
    }
});