import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static values = {
    expanded: Boolean
  }
  static targets = ['button', 'collapseIcon', 'container',  'anchorName', 'collapsedLogo', 'expandedLogo']

  connect() {
    const currentExpandedValue = JSON.parse(localStorage.getItem('currentExpandedValue'))
    
    if (currentExpandedValue) {
      this.collapse()
    } else {
      this.expand()
    }
  }

  toggle() {
    localStorage.setItem('currentExpandedValue', this.expandedValue)
    
    if (this.expandedValue) {
      this.collapse()
    } else {
      this.expand()
    }
  }

  collapse() {
    this.expandedValue = false
    this.collapseIconTarget.classList.remove('half_rotation')
    this.collapseIconTarget.classList.add('full_rotation', 'mr-4')
    this.containerTarget.classList.remove('w-64')
    this.anchorNameTargets.forEach(anchorName => {
      anchorName.classList.add('hidden')
    });
    this.collapsedLogoTarget.classList.remove('hidden')
    this.collapsedLogoTarget.classList.add('logo-icon')
    this.expandedLogoTarget.classList.remove('logo-icon')
    this.expandedLogoTarget.classList.add('hidden')
  }

  expand() {
    this.expandedValue = true
    this.collapseIconTarget.classList.remove('full_rotation', 'mr-4')
    this.collapseIconTarget.classList.add('half_rotation')
    this.containerTarget.classList.add('w-64')
    this.anchorNameTargets.forEach(anchorName => {
      anchorName.classList.remove('hidden')
    });
    this.collapsedLogoTarget.classList.remove('logo-icon')
    this.collapsedLogoTarget.classList.add('hidden')
    this.expandedLogoTarget.classList.remove('hidden')
    this.expandedLogoTarget.classList.add('logo-icon')
  }
}
