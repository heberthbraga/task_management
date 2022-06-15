import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ['link']

  connect() {
    console.log("Navigation controller conected.")

    const lastFrameVisit = localStorage.getItem('lastFrameVisit')
    
    if (lastFrameVisit) {
      const [frameId, frameSrc] = lastFrameVisit.split('::')

      const turboFrame = document.getElementById(frameId)
      turboFrame.src = frameSrc
    }
  }

  push(event) {
    const frameId = event.currentTarget.getAttribute('data-turbo-frame')
    
    const turboFrameElem = document.getElementById(frameId)

    const turboSrc = turboFrameElem.src

    if (turboSrc) {
      localStorage.setItem('lastFrameVisit', `${frameId}::${turboSrc}`)
    }
  }

  disconnect() {
    localStorage.removeItem('lastFrameVisit')
  }
}