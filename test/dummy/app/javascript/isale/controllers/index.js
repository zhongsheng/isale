// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

console.log(123)

const application = Application.start()
const context = require.context(".", true, /_controller\.js$/)
console.log(context)
console.log(definitionsFromContext(context))
application.load(definitionsFromContext(context))
