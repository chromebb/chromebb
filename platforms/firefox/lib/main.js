var self = require("self");
var pageMod = require("page-mod");

pageMod.PageMod({
  include: [
    /http:\/\/www2?\.buzzerbeater\.(com|org)\/player\/.*\/overview\.aspx/,
    /http:\/\/www2?\.buzzerbeater\.(com|org)\/.*\/players\.aspx/,
    /http:\/\/www2?\.buzzerbeater\.(com|org)\/manage\/transferlist\.aspx/
  ],
  contentScriptFile: [
    self.data.url('jquery.min.js'),
    self.data.url('salarycalc.js')
  ]
});
