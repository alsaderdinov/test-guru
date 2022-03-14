document.addEventListener('turbolinks:load', () => {
    let timer = document.querySelector('.timer')
    let leftedTime = timer?.dataset.leftedTime

    if (timer) setInterval(updateTimer, 1000)

    function updateTimer() {
        leftedTime--
        leftedTime <= 0 ? document.querySelector('form').submit() : 
        timer.innerHTML = `Lefted Time: ${leftedTime}`
    }
})

