var self = require("self");
var pageMod = require("page-mod");

pageMod.PageMod({
  include: [
    "http://www.buzzerbeater.com/*",
  ],
  contentScriptFile: [
    self.data.url('jquery.min.js'),
    self.data.url('salarycalc.js')
  ]
});