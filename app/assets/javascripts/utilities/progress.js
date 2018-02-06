document.addEventListener('turbolinks:load', function() {
  var buttonNext = document.getElementById('btn-progress');
  if (buttonNext) {
    buttonNext.addEventListener('click', progressHandler);
  }
});
function progressHandler() {
  var progress = document.querySelector('.progress-bar');
  var progressStep = 100 / progress.dataset.count;
  var progressNow = Number(progress.getAttribute('aria-valuenow'));
  if (progressStep) {
    progressNow += Math.floor(progressStep);
    progress.style.width = progressNow + '%';
    progress.textContent = progressNow + '%';
    progress.setAttribute('aria-valuenow', progressNow);
  }
}
