document.addEventListener("click", e => {
  if (e.target.dataset.hasOwnProperty('submit')) {
    e.target.closest('form').submit();
  }
});

document.addEventListener("keydown", e => {
  const clickable = document.querySelector(`[data-click-key="${e.which}"]`);

  if (clickable && clickable.href) {
    window.location.replace(clickable.href);
  }
});
