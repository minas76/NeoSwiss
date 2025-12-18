// Main JavaScript — Animations, interactions, utilities

// Scroll-triggered animations
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

// Observe elements with scroll animations
document.querySelectorAll('.scroll-fade, .scroll-up').forEach(el => {
  observer.observe(el);
});

// Smooth scroll links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function (e) {
    const href = this.getAttribute('href');
    if (href !== '#' && document.querySelector(href)) {
      e.preventDefault();
      document.querySelector(href).scrollIntoView({ behavior: 'smooth' });
    }
  });
});

// Theme toggle (if needed)
const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
const theme = localStorage.getItem('theme') || (prefersDark ? 'dark' : 'light');
document.documentElement.setAttribute('data-theme', theme);

// Form validation
document.querySelectorAll('form').forEach(form => {
  form.addEventListener('submit', function(e) {
    const inputs = this.querySelectorAll('input[required], textarea[required]');
    let isValid = true;

    inputs.forEach(input => {
      if (!input.value.trim()) {
        isValid = false;
        input.classList.add('error');
      } else {
        input.classList.remove('error');
      }
    });

    if (!isValid) {
      e.preventDefault();
    }
  });

  form.querySelectorAll('input, textarea').forEach(input => {
    input.addEventListener('input', function() {
      if (this.value.trim()) {
        this.classList.remove('error');
      }
    });
  });
});

// Mobile menu toggle (if needed)
const menuButton = document.querySelector('[data-menu-toggle]');
const menu = document.querySelector('[data-menu]');

if (menuButton && menu) {
  menuButton.addEventListener('click', () => {
    menu.classList.toggle('open');
    menuButton.setAttribute('aria-expanded', 
      menuButton.getAttribute('aria-expanded') === 'true' ? 'false' : 'true');
  });

  // Close menu when link is clicked
  menu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      menu.classList.remove('open');
      menuButton.setAttribute('aria-expanded', 'false');
    });
  });
}

console.log('Neo-Swiss site initialized');
