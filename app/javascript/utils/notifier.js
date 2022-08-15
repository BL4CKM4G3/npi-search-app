export const notifyUser = function (message, type) {
  let element = document.querySelector('#notification-portal')
  element.classList.add(type)
  element.innerText = message

  setTimeout(() => {
    element.classList.remove(type)
    element.innerText = ''
  }, 2000)
}
