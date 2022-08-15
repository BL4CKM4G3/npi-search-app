import { findRow } from './rows'

export const focusElement = function (element) {
  element.classList.add('bg-gray-300', 'transition', 'duration-300', 'ease-in-out')

  setTimeout(() => {
    element.classList.remove('bg-gray-300', 'transition', 'duration-300', 'ease-in-out')
  }, 1500)
}

export const checkRecordExists = function (data) {
  let table = document.querySelector('#table-body')
  let rows = Array.from(table.rows)

  let isNpiPresent = findRow(rows, data)

  if (isNpiPresent) return true
  return false
}
