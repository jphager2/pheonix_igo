console.log('loaded')
document.addEventListener("click", e => {
  console.log(e.target.dataset)
  if (e.target.dataset.hasOwnProperty('submit')) {
    e.target.closest('form').submit();
  }
});
