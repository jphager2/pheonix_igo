function init() {
  const movesInput = document.querySelector('.review .moves');
  const currentMove = document.querySelector('.review .current-move');

  if (!movesInput) { return; }

  movesInput.addEventListener('input', e => {
    const move = e.target.value;

    currentMove.value = move;
  });
  
  movesInput.addEventListener('change', e => {
    const url = window.location.pathname;
    const move = e.target.value;

    window.location.replace(`${url}?move=${move}`);
  });
}

if (document.readyState !== 'loading') {
  init();
} else {
  document.addEventListener('DOMContentLoaded', init);
}
