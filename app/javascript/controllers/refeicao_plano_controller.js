import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fieldsContainer", "template", "fields"]

  addField(event) {
    event.preventDefault()
    
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    
    this.fieldsContainerTarget.insertAdjacentHTML('beforeend', content)
  }

  removeField(event) {
    event.preventDefault()
    
    const fieldContainer = event.target.closest('[data-refeicao-plano-target="fields"]')
    
    const destroyField = fieldContainer.querySelector("input[name*='_destroy']")
    
    if (destroyField) {
      destroyField.value = "1"
    }
    
    fieldContainer.style.opacity = 0
    fieldContainer.style.height = 0
    fieldContainer.style.marginBottom = 0

    setTimeout(() => {
      fieldContainer.remove()
    }, 300)
  }
}
