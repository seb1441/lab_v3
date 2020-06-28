import { Controller } from "stimulus"
import StimulusReflex from 'stimulus_reflex';
import { debounce } from 'lodash-es'
import serializeForm from 'form-serialize'

export default class extends Controller {
  static targets = [ "form", "boxDiv", "colorPicker" ]

  connect() {
    StimulusReflex.register(this)
    this.submit = debounce(this.submit, 500)
  }

  formData() {
    return serializeForm(
      this.formTarget,
      {
        hash: true,
        empty: true
      }
    )
  }

  submit() {
    this.stimulate('BoxesReflex#submit', this.formData())
  }

  updateColor() {
    this.boxDivTarget.style.backgroundColor = this.formData().box.color
    this.colorPickerTarget.style.backgroundColor = this.formData().box.color
  }
}
