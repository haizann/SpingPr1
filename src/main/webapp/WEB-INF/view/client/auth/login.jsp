<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Login</title>
            <style>
                :root {
                    --bg: #f4f7fb;
                    --card: #ffffff;
                    --primary: #2563eb;
                    --muted: #6b7280;
                    --danger: #ef4444;
                    --radius: 12px;
                    --shadow: 0 8px 24px rgba(16, 24, 40, 0.06);
                }

                * {
                    box-sizing: border-box
                }

                body {
                    margin: 0;
                    font-family: Inter, ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
                    background: linear-gradient(180deg, #eef2ff 0%, var(--bg) 100%);
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    padding: 24px;
                    color: #0f172a;
                }

                .container {
                    width: 100%;
                    max-width: 420px;
                }

                .card {
                    background: var(--card);
                    border-radius: var(--radius);
                    box-shadow: var(--shadow);
                    padding: 28px;
                    overflow: hidden;
                    position: relative;
                    transition: transform .18s ease;
                }

                .card:hover {
                    transform: translateY(-4px);
                }

                .brand {
                    display: flex;
                    align-items: center;
                    gap: 12px;
                    margin-bottom: 12px;
                }

                .logo {
                    width: 48px;
                    height: 48px;
                    border-radius: 10px;
                    background: linear-gradient(135deg, var(--primary), #7c3aed);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: #fff;
                    font-weight: 700;
                    font-size: 18px;
                    box-shadow: 0 6px 18px rgba(37, 99, 235, 0.18);
                }

                h2 {
                    margin: 0;
                    font-size: 20px;
                }

                p.lead {
                    margin: 6px 0 18px 0;
                    color: var(--muted);
                    font-size: 14px
                }

                form .grid {
                    display: grid;
                    grid-template-columns: 1fr 1fr;
                    gap: 12px;
                }

                .field {
                    margin-bottom: 12px;
                    position: relative;
                }

                label {
                    display: block;
                    font-size: 13px;
                    margin-bottom: 6px;
                    color: #0f172a;
                }

                input[type="text"],
                input[type="email"],
                input[type="password"] {
                    width: 100%;
                    padding: 10px 12px;
                    border-radius: 8px;
                    border: 1px solid #e6edf3;
                    background: #fbfeff;
                    font-size: 14px;
                    outline: none;
                    transition: box-shadow .12s, border-color .12s;
                }

                input:focus {
                    border-color: rgba(37, 99, 235, 0.8);
                    box-shadow: 0 6px 18px rgba(37, 99, 235, 0.06);
                }

                .note {
                    font-size: 12px;
                    color: var(--muted);
                    margin-top: 6px;
                }

                .error {
                    color: var(--danger);
                    font-size: 13px;
                    margin-bottom: 12px;
                    display: none;
                }

                .actions {
                    margin-top: 8px;
                    display: flex;
                    gap: 12px;
                    align-items: center;
                    flex-direction: column;
                }

                .invalid-feedback {
                    color: var(--danger);
                    font-size: 13px;
                    margin-top: 4px;
                    display: block;
                }

                button[type="submit"] {
                    width: 100%;
                    padding: 12px 14px;
                    border-radius: 10px;
                    border: none;
                    background: linear-gradient(90deg, var(--primary), #7c3aed);
                    color: #fff;
                    font-weight: 600;
                    cursor: pointer;
                    box-shadow: 0 10px 30px rgba(37, 99, 235, 0.12);
                    font-size: 15px;
                }

                button[type="submit"]:disabled {
                    opacity: 0.6;
                    cursor: not-allowed;
                }

                .small {
                    font-size: 13px;
                    color: var(--muted);
                }

                .footer-row {
                    margin-top: 12px;
                    text-align: center;
                    font-size: 14px;
                }

                .footer-row a {
                    color: var(--primary);
                    text-decoration: none;
                    font-weight: 600;
                    margin-left: 6px;
                }

                .footer-row a:hover {
                    text-decoration: underline;
                }

                .pwd-toggle {
                    position: absolute;
                    right: 10px;
                    top: 36px;
                    background: transparent;
                    border: none;
                    cursor: pointer;
                    color: var(--muted);
                    font-size: 13px;
                    padding: 6px;
                }

                @media (max-width:420px) {
                    .grid {
                        grid-template-columns: 1fr;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="card" role="region" aria-labelledby="reg-title">
                    <div class="brand">
                        <div class="logo">R</div>
                        <div>
                            <h2 id="reg-title">Đăng nhập</h2>
                            <p class="lead">Nhập email password để đăng nhập</p>
                        </div>
                    </div>




                    <form method="post" action="/login">

                        <div class="field">
                            <label for="email">Email</label>
                            <input type="email" name="username" />
                        </div>

                        <div class="field">
                            <label for="password">Password</label>
                            <input type="password" name="password" />
                        </div>

                        <div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </div>

                        <button type="submit">Đăng nhập</button>

                        <div class="footer-row">
                            <span class="small">Đã chưa có tài khoản?</span>
                            <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                        </div>

                    </form>

                </div>
            </div>


        </body>

        </html>