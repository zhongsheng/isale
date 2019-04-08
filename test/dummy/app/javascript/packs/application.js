require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()

import $ from 'jquery';
window.jQuery = $;
window.$ = $;
require("like-ruby")

import 'bootstrap'

require("trix")

import './isale/main.scss'
import "./isale/controllers"

import "./trix_upload_qiniu.js"
