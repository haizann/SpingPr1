// client/js/footer.js
// Handles newsletter submit (client-side UX), back-to-top button, and simple accessibility helpers.

document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('newsletterForm');
    const emailInput = document.getElementById('newsletterEmail');
    const msgEl = document.getElementById('newsletterMsg');
    const backToTop = document.getElementById('backToTop');

    // Newsletter: prevent default submit and show a friendly message.
    if (form) {
        form.addEventListener('submit', function (e) {
            // If you want actual server submit, remove e.preventDefault()
            e.preventDefault();
            const email = emailInput.value.trim();
            if (!email) {
                msgEl.textContent = 'Please enter a valid email.';
                msgEl.style.color = '#b91c1c';
                emailInput.focus();
                return;
            }

            // Simulate async request (replace with fetch/ajax to your backend)
            msgEl.textContent = 'Subscribing...';
            msgEl.style.color = '#065f46';
            setTimeout(function () {
                msgEl.textContent = 'Thank you — you are subscribed!';
                msgEl.style.color = '#065f46';
                form.reset();
                // Optionally send analytics event
                try { window.dataLayer && window.dataLayer.push({ event: 'newsletter_subscribed' }); } catch (err) { /* ignore */ }
            }, 700);
        });
    }

    // Back to top button
    function toggleBackToTop() {
        if (!backToTop) return;
        if (window.scrollY > 300) {
            backToTop.style.opacity = '1';
            backToTop.style.pointerEvents = 'auto';
        } else {
            backToTop.style.opacity = '0';
            backToTop.style.pointerEvents = 'none';
        }
    }
    if (backToTop) {
        backToTop.style.transition = 'opacity .18s ease, transform .18s ease';
        backToTop.style.opacity = '0';
        backToTop.style.pointerEvents = 'none';
        backToTop.addEventListener('click', function () {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
        window.addEventListener('scroll', toggleBackToTop);
        toggleBackToTop();
    }

    // Accessibility: allow pressing Enter on cart badge to go to cart
    const cartLink = document.querySelector('.cart-link');
    if (cartLink) {
        cartLink.addEventListener('keyup', function (e) {
            if (e.key === 'Enter') cartLink.click();
        });
    }
});