import ApplicationController from './application_controller'

export default class extends ApplicationController {
  static targets = [ "notif", "userMenu", "userMenuBg", "menu" ]

  closeNotif() {
    this.notifTarget.classList.add("hidden")
  }

  toggleUserMenu() {
    this.userMenuTarget.classList.toggle("hidden")
    this.userMenuTarget.classList.toggle("block")

    this.userMenuBgTarget.classList.toggle("hidden")
    this.userMenuBgTarget.classList.toggle("block")
  }

  toggleMenu() {
    this.menuTarget.classList.toggle("hidden")
    this.menuTarget.classList.toggle("block")
  }
}
