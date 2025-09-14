import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["element"]

  toggle() {
    this.elementTargets.forEach((element) => {
      if (element.classList.contains("opacity-0")) {
        // Show
        element.classList.remove("opacity-0", "pointer-events-none")
        element.classList.add("opacity-100")
      } else {
        // Hide
        element.classList.remove("opacity-100")
        element.classList.add("opacity-0", "pointer-events-none")
      }
    })

    document.body.classList.toggle("overflow-hidden")
  }
}
