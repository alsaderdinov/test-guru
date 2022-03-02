document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.progress-bar')

  if (progressBar) progressBarStatus(progressBar) 
});

function progressBarStatus(progressBar) {
  const total = progressBar.dataset.total
  const current = progressBar.dataset.current
  const progress = 100 / total * current

  progressBar.style.width = `${progress}%`
  progressBar.setAttribute('aria-valuenow', progress)
}

