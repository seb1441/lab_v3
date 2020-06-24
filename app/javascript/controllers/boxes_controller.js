import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex';

let throttle = require('lodash/throttle');

export default class extends Controller {
  static targets = [ "boxName", "noteContent" ]

  connect() {
    StimulusReflex.register(this)
    this.updateBoxName = throttle(this.updateBoxName, 500)
    this.updateNoteContent = throttle(this.updateNoteContent, 500)
  }

  updateBoxName() {
    this.stimulate('BoxesReflex#update_box_name', this.boxNameTarget.getAttribute("data-id"), this.boxNameTarget.textContent)
  }

  updateNoteContent() {
    this.stimulate('BoxesReflex#update_note_content', this.noteContentTarget.getAttribute("data-id"), this.noteContentTarget.textContent)
  }

  createBox() {
    this.stimulate('BoxesReflex#create_box', this.boxNameTarget.textContent, this.noteContentTarget.textContent)
  }
}
