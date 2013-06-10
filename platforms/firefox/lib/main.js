var self = require("self");
var pageMod = require("page-mod");

pageMod.PageMod({
  include: [
    /http:\/\/[^/]*buzzerbeater\.com\/player\/\d+\/overview\.aspx/,
    /http:\/\/[^/]*buzzerbeater\.com\/.*\/players\.aspx/,
    /http:\/\/[^/]*buzzerbeater\.com\/manage\/transferlist\.aspx/
  ],
  contentScriptFile: [
    self.data.url('jquery.min.js'),
    self.data.url('salarycalc.js')
  ]
});
