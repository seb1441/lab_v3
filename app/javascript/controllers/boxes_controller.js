import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex';
import { debounce, throttle } from 'lodash-es'

export default class extends Controller {
  static targets = [ "boxName", "noteContent", "boxColor" ]

  connect() {
    StimulusReflex.register(this)
    this.updateBoxName = debounce(this.updateBoxName, 500)
    this.updateNoteContent = debounce(this.updateNoteContent, 500)
    this.createBox = throttle(this.createBox, 500)
    this.updateBoxColor = debounce(this.updateBoxColor, 500)
  }

  updateBoxName() {
    this.stimulate('BoxesReflex#update_box_name', this.boxNameTarget.getAttribute("data-id"), this.boxNameTarget.textContent)
  }

  updateNoteContent() {
    this.stimulate('BoxesReflex#update_note_content', this.noteContentTarget.getAttribute("data-id"), this.noteContentTarget.textContent)
  }

  createBox() {
    event.preventDefault()
    if (this.boxNameTarget.textContent) {
      this.stimulate('BoxesReflex#create_box', this.boxNameTarget.textContent, this.noteContentTarget.textContent, this.boxColorTarget.value)
    }
  }

  updateBoxColor() {
    this.stimulate('BoxesReflex#update_box_color', this.boxNameTarget.getAttribute("data-id"), this.boxColorTarget.value)
  }
}
