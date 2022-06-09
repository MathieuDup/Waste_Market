import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    console.log('Hello, Stimulus!')
  }

  select(e) {
    this.inputTargets.forEach((input) => {
      if (input === e.target) {
        input.classList.add('selected')
      } else {
        input.classList.remove('selected')
      }
    })
  }
}
