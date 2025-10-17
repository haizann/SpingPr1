<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/footer.css" />
        <script src="${pageContext.request.contextPath}/client/js/footer.js" defer></script>

        <footer class="site-footer" role="contentinfo">
            <div class="footer-top">
                <div class="footer-container">

                    <!-- About / Logo -->
                    <div class="footer-col about">
                        <a class="footer-logo" href="${pageContext.request.contextPath}/" aria-label="Fruitables home">
                            <span class="logo-mark">Fruit</span><span class="logo-name">ables</span>
                        </a>
                        <p class="footer-desc">Fresh, organic fruits delivered to your door. We source directly from
                            local farms — quality you can trust.</p>
                        <div class="footer-contact">
                            <div><strong>Address:</strong> 123 Orchard St, City</div>
                            <div><strong>Email:</strong> <a
                                    href="mailto:info@fruitables.example">info@fruitables.example</a></div>
                        </div>
                    </div>

                    <!-- Quick Links -->
                    <div class="footer-col links">
                        <h4>Quick Links</h4>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/shop">Shop</a></li>
                            <li><a href="${pageContext.request.contextPath}/cart">Cart</a></li>
                            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                        </ul>
                    </div>

                    <!-- Categories -->
                    <div class="footer-col categories">
                        <h4>Categories</h4>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/shop?cat=fruits">Fruits</a></li>
                            <li><a href="${pageContext.request.contextPath}/shop?cat=vegetables">Vegetables</a></li>
                            <li><a href="${pageContext.request.contextPath}/shop?cat=organic">Organic</a></li>
                            <li><a href="${pageContext.request.contextPath}/shop?cat=offers">Offers</a></li>
                        </ul>
                    </div>

                    <!-- Newsletter -->
                    <div class="footer-col newsletter">
                        <h4>Newsletter</h4>
                        <p>Get weekly deals and fresh arrivals. No spam — unsubscribe anytime.</p>
                        <form id="newsletterForm" class="newsletter-form" method="post"
                            action="${pageContext.request.contextPath}/newsletter/subscribe">
                            <label for="newsletterEmail" class="visually-hidden">Email address</label>
                            <input id="newsletterEmail" name="email" type="email" placeholder="Your email address"
                                required />
                            <button type="submit" class="btn-submit">Subscribe</button>
                            <div id="newsletterMsg" class="newsletter-msg" aria-live="polite"></div>
                        </form>
                    </div>

                </div>
            </div>

            <div class="footer-bottom">
                <div class="footer-container bottom-row">
                    <div class="copyright">
                        &copy; <%= java.time.Year.now().getValue() %> Fruitables. All rights reserved.
                    </div>

                    <div class="social-and-utility">
                        <div class="social">
                            <a href="#" aria-label="Facebook" title="Facebook" class="social-link">Facebook</a>
                            <a href="#" aria-label="Instagram" title="Instagram" class="social-link">Instagram</a>
                            <a href="#" aria-label="Twitter" title="Twitter" class="social-link">Twitter</a>
                        </div>
                        <button id="backToTop" class="back-to-top" aria-label="Back to top"
                            title="Back to top">↑</button>
                    </div>
                </div>
            </div>
        </footer>