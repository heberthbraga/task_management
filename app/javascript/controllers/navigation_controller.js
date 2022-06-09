import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ['link']

  connect() {
    console.log("Navigation controller conected.")
  }

  push(event) {
    let value = event.detail.url

    console.log('Value', value)
  }
}