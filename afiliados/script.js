document.addEventListener('DOMContentLoaded', () => {
  const yearEl = document.getElementById('year');
  if (yearEl) yearEl.textContent = String(new Date().getFullYear());

  // Simple outbound tracking example (console only)
  document.querySelectorAll('a[rel~="sponsored"]').forEach((anchor) => {
    anchor.addEventListener('click', () => {
      console.log('[affiliates] click', anchor.href);
    });
  });
});

