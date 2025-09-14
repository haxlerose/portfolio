import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "element" ]

  toggle() {
    this.elementTargets.forEach((button) => {
      button.classList.toggle("hidden")
    })
    document.body.classList.toggle("overflow-hidden");
  }
}
