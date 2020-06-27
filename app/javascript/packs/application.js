// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers"
require('css/application.scss')
import "@fortawesome/fontawesome-free/js/all"

var Trix  = require("trix")
require("@rails/actiontext")
console.log("Config", Trix.config);

const {lang} = Trix.config;

{/* <div class="trix-button-row">
</div> */}
console.log(Trix.config)
Trix.config.toolbar = {
  getDefaultHTML() { return `\
<div class="flex flex-wrap">
  <button type="button" class="mb-2" data-trix-attribute="bold" data-trix-key="b" title="${lang.bold}" tabindex="-1">${lang.bold}</button>
  <button type="button" class="mb-2" data-trix-attribute="italic" data-trix-key="i" title="#{lang.italic}" tabindex="-1">#{lang.italic}</button>
</div>\
`; }
};
Trix.config.toolbar = {
  getDefaultHTML() { return `\
<div class="flex flex-wrap justify-between text-xs w-full">
  <div class="">
    <button type="button" class="p-1 rounded" data-trix-attribute="bold" data-trix-key="b" title="${lang.bold}" tabindex="-1"><i class="fas fa-bold"></i></button>
    <button type="button" class="p-1 rounded" data-trix-attribute="italic" data-trix-key="i" title="${lang.italic}" tabindex="-1"><i class="fas fa-italic"></i></button>
    <button type="button" class="p-1 rounded" data-trix-attribute="strike" title="${lang.strike}" tabindex="-1"><i class="fas fa-strikethrough"></i></button>
  </div>
  <div class="">
    <button type="button" class="p-1 rounded" data-trix-action="undo" data-trix-key="z" title="${lang.undo}" tabindex="-1"><i class="fas fa-undo"></i></button>
    <button type="button" class="p-1 rounded" data-trix-action="redo" data-trix-key="shift+z" title="${lang.redo}" tabindex="-1"><i class="fas fa-redo"></i></button>
  </div>
</div>\
`; }
};
  // <button type="button" class="bg-black text-white mx-2 p-1 rounded" data-trix-action="attachFiles" title="${lang.attachFiles}" tabindex="-1">${lang.attachFiles}</button>