var _AUTHOR_ = "Outvi V";
var ma = require('marked');
var mu = require('mustache');
var fs = require('fs');

var front = "reviewotw/";
var dir = [ 'ma', 'ch', 'en', 'phy', 'che', 'bio', 'wen/his' ];
var tpl = "<!DOCTYPE HTML><meta charset=utf-8><title>{{{title}}}</title><body><a href='..'>回到上级目录</a><br />{{&body}}</body>";
var indextpl = "<!DOCTYPE HTML><meta charset=utf-8><title>索引</title><body><a href='..'>回到上级目录</a><br />{{&body}}</body>";
var bcount = 0;

function gen_index(path){
	let ml = fs.readdirSync(path);
	let str = "<ol>";
	for(i in ml) {
		let fn = ml[i].replace('.html','');
		str += "<li><a href='" + ml[i] + "'>" + fn + "</a></li>";
	}
	str += "</ol>";
	let p = {};
	p.body = str;
	let mmdata = mu.render(indextpl, p);
	let res = fs.writeFileSync(path + 'index.html', mmdata, 'utf8');
	console.log("Index of " + path + " has been processed.")
}

function enumdir(path,file){
//      console.log(file);
	if ( !file.match('.md') ) {
		console.log(path + file + " is not a HTML. Ignored.");
		return;
	}
	let data = fs.readFileSync(path + file,'utf8');
	let mdata = ma(data);
	let p = {};
	p.title = file.split('.',2)[0];
	p.body = mdata;
	let mmdata = mu.render(tpl, p);
//	console.log(mmdata);
	let filex = file.replace('.md','.html');
	let res = fs.writeFileSync(path + filex, mmdata, 'utf8');
	res = fs.unlinkSync(path + file);
	console.log("File " + file + " has been processed.");
    bcount += 1;
}

console.log("Generating...");
for (x in dir) {
	console.log("Working at " + dir[x]);
	var k = fs.readdirSync( front + dir[x] );
	for (y in k) {
		enumdir(front + dir[x] + '/' , k[y]);
	}
	gen_index(front + dir[x] + '/');
}

var mod = {};
mod.build_time = new Date();
mod.build_by = "Travis CI";
mod.count = bcount;
let pmod = JSON.stringify(mod);
console.log(pmod);
fs.writeFileSync(front + "build.json", pmod, 'utf8');

console.log("Everything is done!");
