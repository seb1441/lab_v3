import ApplicationController from './application_controller'

export default class extends ApplicationController {
  // dragstart(event) {
  // }
  dragover(event) {
    event.preventDefault()
  }
  dragenter(event) {
    event.target.style.border = '2px solid rgba(22, 189, 202)'
    event.target.id = 'selectedBoxCategory'
  }
  dragleave(event) {
    event.target.style.border = ''
  }
  dragend(event) {
    const selectedBoxCategory = document.getElementById('selectedBoxCategory')
    if (selectedBoxCategory) {
      const boxId = event.target.dataset.id
      const boxCategoryId = selectedBoxCategory.dataset.id
      this.stimulate('BoxesReflex#update_box_category', boxId, boxCategoryId)
      selectedBoxCategory.id = null
    }
  }
}
