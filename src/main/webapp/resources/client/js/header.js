// client/js/header.js
// Controls mobile menu toggle, dropdowns on mobile, and search overlay.
// Also exposes small API to update cart badge.

document.addEventListener('DOMContentLoaded', function () {
    const header = document.querySelector('.site-header');
    const hamburger = document.getElementById('hamburger');
    const mainNav = document.getElementById('mainNav');
    const searchToggleBtns = document.querySelectorAll('.search-toggle');
    const searchOverlay = document.getElementById('searchOverlay');
    const searchClose = document.querySelectorAll('.search-close');
    const cartBadge = document.getElementById('cartBadge');

    // Mobile menu toggle
    if (hamburger) {
        hamburger.addEventListener('click', function () {
            const expanded = this.getAttribute('aria-expanded') === 'true';
            this.setAttribute('aria-expanded', String(!expanded));
            header.classList.toggle('mobile-open');
        });
    }

    // Mobile: toggle dropdown items when clicking parent
    document.querySelectorAll('.has-dropdown > .nav-link').forEach(link => {
        link.addEventListener('click', function (e) {
            // only run on small screens
            if (window.innerWidth <= 900) {
                e.preventDefault();
                const parent = this.parentElement;
                parent.classList.toggle('open');
            }
        });
    });

    // Small API to update cart badge count anywhere on the page
    window.updateCartCount = function (count) {
        if (!cartBadge) return;
        const n = parseInt(count, 10) || 0;
        cartBadge.textContent = n;
        // simple bounce animation
        cartBadge.animate([{ transform: 'scale(1)' }, { transform: 'scale(1.16)' }, { transform: 'scale(1)' }], { duration: 320 });
    };

    // Example: listen for custom event to increment cart
    document.addEventListener('cart:add', function (e) {
        const current = parseInt(cartBadge.textContent || '0', 10) || 0;
        const add = (e.detail && e.detail.qty) ? parseInt(e.detail.qty, 10) : 1;
        window.updateCartCount(current + add);
    });

    // Profile dropdown toggle on mobile
    const profileBtn = document.getElementById('profileBtn');
    if (profileBtn) {
        profileBtn.addEventListener('click', function (e) {
            if (window.innerWidth <= 900) {
                e.preventDefault();
                const parent = this.closest('.profile-menu');
                parent.classList.toggle('open');
            }
        });
    }

});