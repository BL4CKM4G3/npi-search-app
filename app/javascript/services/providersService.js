import { notifier } from '../utils'

export const fetchNpi = function(number) {
  return new Promise((resolve, reject) => {
    fetch(`/providers/search?search_number=${number}`)
      .then((response) => {
        if (response.ok && response.status === 201 ) {
          return response.json()
        } else {
          response.json().then(data => {
            notifier.notify(data.error, 'error')
          })
        }
      })
      .then((data) => {
        resolve(data?.record)
      })
      .catch((e) => {
        reject(e)
      })
  })
}