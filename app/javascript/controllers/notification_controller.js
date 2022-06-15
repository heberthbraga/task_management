import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ['countdown']

  connect() {
    const timeoutSeconds = parseInt(this.data.get("timeout"))

    this.element.classList.remove('hidden')
    this.element.classList.add('display-notification', 'display-notification-from')

    this.element.classList.add('display-notification-to')

      // Trigger countdown
      // if (this.hasCountdownTarget) {
      //   this.countdownTarget.style.animation = 'notification-countdown 5s linear'
      // }
    
    this.timeoutId = setTimeout(() => {
      this.close();
    }, timeoutSeconds * 1000 + 500);
  }

  stop() {
    clearTimeout(this.timeoutId)
    this.timeoutId = null
  }

  close() {
    this.element.classList.remove('display-notification', 'display-notification-from', 'display-notification-to')
    this.element.classList.add('display-notification-leave', 'display-notification-from')

    this.element.classList.add('display-notification-to')

    // Remove element after transition
    setTimeout(() => {
      this.element.remove()
    }, 300)
  }
}