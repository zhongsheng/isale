import { Controller } from "stimulus"

console.log('customer')
export default class extends Controller {
    static targets = [ "output" ]

    connect() {
        this.outputTarget.textContent = 'Hello, Stimulus!'
    }
}
