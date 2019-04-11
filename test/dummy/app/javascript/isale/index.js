require("@rails/ujs").start()
require("turbolinks").start()
// require("@rails/activestorage").start()

// frameworks
import $ from 'jquery';
window.jQuery = $;
window.$ = $;
require("like-ruby")

import 'bootstrap'
// icons
require("@fortawesome/fontawesome-free/css/all")

// rich_text trix && upload
require("trix")
import "./trix_upload_qiniu.js"

// main
import './main.scss'
import "./controllers"
