import ApplicationController from './application_controller'
import Rails from '@rails/ujs'

export default class extends ApplicationController {
  static targets = [ "editButton", "saveButton", "tabLink", "textField", "form" ]

  edit(event) {
    event.preventDefault()
    this.editButtonTarget.classList.toggle("hidden")
    this.saveButtonTarget.classList.toggle("hidden")
    this.tabLinkTarget.classList.toggle("hidden")
    this.formTarget.classList.toggle("hidden")
  }

  save(event) {
    event.preventDefault()
    Rails.fire(this.formTarget, "submit")
    this.tabLinkTarget.innerHTML = this.textFieldTarget.value

    this.editButtonTarget.classList.toggle("hidden")
    this.saveButtonTarget.classList.toggle("hidden")
    this.tabLinkTarget.classList.toggle("hidden")
    this.formTarget.classList.toggle("hidden")
  }
}