import { Controller } from "hotwired/stimulus"

export default class extends Controller {
    static targets = [ "container", "template", "fields" ]

    addField(event){
        event.preventDefault()

        const template = this.templateTarget.innerHTML

        const newIndex = new Date().getTime()

        const newFields = template.replace(/NEW_RECORD/g, newIndex)

        this.containerTarget.insertAdjacentHTML('beforeend', newFields)

        const newFieldElement = this.containerTarget.lastElementChild;
        if(newFieldElement){
            newFieldElement.scrollIntoView({ behavior: 'smooth', block: 'end'});
        }
    }

    removeField(event) {
        event.preventDefault()

        const fieldsWrapper = event.target.closest('[data-exercicio-plano-target="fields"]')

        if (fieldsWrapper.dataset.exercicioPlanoId){
            fieldsWrapper.querySelector('input[name*="_destroy"]').value = '1'
            fieldsWrapper.style.display = 'none'
        } else {
            fieldsWrapper.remove()
        }
    }
}