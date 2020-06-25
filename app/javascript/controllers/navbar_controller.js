import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "notif" ]

  closeNotif() {
    this.notifTarget.classList.add("hidden")
  }
}
