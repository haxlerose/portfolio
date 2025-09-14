import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "element" ]

  toggle() {
    this.elementTargets.forEach((element) => {
      element.classList.toggle("hidden")
    })
    document.body.classList.toggle("overflow-hidden");
  }
}
