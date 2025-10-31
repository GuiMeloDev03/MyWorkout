import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["content", "button", "icon"]

    toggle(event) {
        const clickedIndex = event.currentTarget.dataset.index

        this.contentTargets.forEach(content => {
            const contentIndex = content.dataset.index
            const button = this.buttonTargets.find((b => b.dataset.index === contentIndex))
            const icon = this.iconTargets.find(i => i.closets('button').dataset.index === contentIndex)

            if (contentIndex === clickedIndex){
                const isHidden = content.classList.toggle('hidden')
                button.setAttribute('aria-expanded', isHidden ? 'false' : 'true')

                icon.classList.toggle('rotate-18-0', !isHidden)
            } else {
                content.classList.add('hidden')
                button.setAttribute('aria-expanded', 'false')
                icon.classList.remove('rotate-180')
            }
        })
    }
}