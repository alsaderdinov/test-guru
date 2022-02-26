document.addEventListener('turbolinks:load', function () {
  let control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  let tableBody = document.querySelector('tbody')

  let rows = tableBody.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  let sortedTableBody = document.createElement('tbody')

  sortedTableBody.classList.add('tbody')
  sortedTableBody.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTableBody.appendChild(sortedRows[i])
  }

  tableBody.parentNode.replaceChild(sortedTableBody, tableBody)
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
