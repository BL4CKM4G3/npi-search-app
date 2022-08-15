import {
  focusElement,
  checkRecordExists
} from './helper'

import {
  notifyUser
} from './notifier'

import {
  addRow,
  findRow,
  moveRow
} from './rows'

export const helper = {
  focusElement: focusElement,
  checkRecord: checkRecordExists
}

export const notifier = {
  notify: notifyUser
}

export const rows = {
  add: addRow,
  find: findRow,
  move: moveRow
}