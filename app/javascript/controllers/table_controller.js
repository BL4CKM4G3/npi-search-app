import { Controller } from '@hotwired/stimulus'
import { helper, notifier, rows } from '../utils'
import services from '../services'

export default class TableController extends Controller {
  static targets = ['number-input', 'button', 'no-data-info']

  async search() {
    let input = this.targets.find('number-input')
    let button = this.targets.find('button')
    button.disabled = true
    button.classList.add('cursor-not-allowed')
    button.innerText = "Loading..."

    if (helper.checkRecord(input.value)) {
      rows.move(input.value)
      notifier.notify('Found provider. Moving row to top...', 'info')
    }

    if (!helper.checkRecord(input.value)) {
      let provider = await services.providers.fetch(input.value)

      if (provider) {
        rows.add(provider)
      }

      let noDataInfo = this.targets.find('no-data-info')
      if (noDataInfo) {
        noDataInfo.parentElement.removeChild(noDataInfo)
      }
    }

    button.disabled = false
    button.classList.remove('cursor-not-allowed')
    button.innerText = 'Search'
  }
}