// app/javascript/controllers/stagger_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]
  static values = {
    interval: { type: Number, default: 120 },     // ms between items
    threshold: { type: Number, default: 0.2 },    // how much must be visible
    once: { type: Boolean, default: true },       // animate only once
    rootMargin: { type: String, default: "0px 0px -10% 0px" } // trigger a bit early
  }

  connect() {
    // Respect reduced motion: show everything immediately.
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) {
      this.itemTargets.forEach(el => {
        el.classList.remove("opacity-0", "translate-y-2")
        el.classList.add("opacity-100", "translate-y-0")
      })
      return
    }

    this.observer = new IntersectionObserver(
      entries => entries.forEach(entry => {
        if (entry.isIntersecting) this.reveal()
        if (this.onceValue && entry.isIntersecting) this.observer.unobserve(this.element)
      }),
      { threshold: this.thresholdValue, rootMargin: this.rootMarginValue }
    )

    this.observer.observe(this.element)
  }

  disconnect() {
    this.observer && this.observer.disconnect()
  }

  reveal() {
    this.itemTargets.forEach((el, i) => {
      setTimeout(() => {
        el.classList.add("transition", "duration-700", "ease-out", "will-change-transform")
        el.classList.remove("opacity-0", "translate-y-2")
        el.classList.add("opacity-100", "translate-y-0")
      }, i * this.intervalValue)
    })
  }
}
