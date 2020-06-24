import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex';
import { debounce } from 'lodash-es'

export default class extends Controller {
  static targets = [ "boxName", "noteContent" ]

  connect() {
    StimulusReflex.register(this)
    this.updateBoxName = debounce(this.updateBoxName, 500)
    this.updateNoteContent = debounce(this.updateNoteContent, 500)
    this.createBox = debounce(this.createBox, 500)
  }

  updateBoxName() {
    this.stimulate('BoxesReflex#update_box_name', this.boxNameTarget.getAttribute("data-id"), this.boxNameTarget.textContent)
  }

  updateNoteContent() {
    console.log('GG')
    this.stimulate('BoxesReflex#update_note_content', this.noteContentTarget.getAttribute("data-id"), this.noteContentTarget.textContent)
  }

  createBox() {
    this.stimulate('BoxesReflex#create_box', this.boxNameTarget.textContent, this.noteContentTarget.textContent)
  }
}
