import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex';
import { debounce, throttle } from 'lodash-es'

export default class extends Controller {
  static targets = [ "noteContent", "boxColor" ]

  connect() {
    StimulusReflex.register(this)
    this.updateBoxName = debounce(this.updateBoxName, 500)
    this.updateNoteContent = debounce(this.updateNoteContent, 500)
    this.createBox = throttle(this.createBox, 500)
    this.updateBoxColor = debounce(this.updateBoxColor, 500)

    // document.getElementsByClassName('trix-button--icon-strike')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-heading-1')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-quote')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-code')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-bullet-list')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-number-list')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-decrease-nesting-level')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button--icon-increase-nesting-level')[0].classList.add('hidden')
    // document.getElementsByClassName('trix-button-group--block-tools')[0].classList.add('hidden')
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
    this.stimulate('BoxesReflex#update_box_color', this.boxColorTarget.getAttribute("data-id"), this.boxColorTarget.value)
  }

  // this.notifTarget.classList.add("hidden")
}
