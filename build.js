var marked = require('marked');
var must = require('mustache');
marked.setOptions({
  renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: true,
  smartLists: true,
  smartypants: false
});

var tit = "123"
var pick = marked('ContentXYZ');

console.log();
var view = {
  title: tit,
  body: pick
};

var content = "<!DOCTYPE HTML><meta charset=utf-8><title>{{{title}}}</title><body><h1>{{{title}}}</h1>{{{body}}}</body>";
 
var output = must.render(content, view);

console.log(output);
