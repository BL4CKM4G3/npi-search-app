import { focusElement } from './helper'

export const moveRow = function (data) {
  let table = document.querySelector('#table-body')
  let rows = Array.from(table.rows)

  let selectedRow = findRow(rows, data)

  selectedRow.parentElement.removeChild(selectedRow)

  table.insertAdjacentElement('afterbegin', selectedRow)
  focusElement(selectedRow);
}

export const findRow = function(rows, data) {
  return rows.find((row) => row.children[0].innerText === data)
}

export const addRow = function(data) {
  // Table HTML Element
  let element = document.querySelector('#table-body')
  let recordFields = new Map(Object.entries(data))
  
  let row = document.createElement('tr')
  row.className = 'table-row'

  recordFields.forEach((el) => {
    let text, code, desc;
    let cell = document.createElement('td')
    cell.scope = 'col'
    cell.className = 'table-cell'

    if (typeof el === 'object') {
      code = document.createTextNode(el.code)
      desc = document.createTextNode(el.desc)
      let spacer = document.createElement('hr')
      cell.appendChild(code)
      cell.appendChild(spacer)
      cell.appendChild(desc)
    } else {
      text = document.createTextNode(el)
      cell.appendChild(text)
    }

    row.appendChild(cell)
  })

  element.insertAdjacentElement('afterbegin', row)

  focusElement(row)
}
