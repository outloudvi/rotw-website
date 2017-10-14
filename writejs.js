var proc = require("process");

var mod = {};

var bcount = fs.readFileSync('bcount','utf8');
bcount = Number(bcount);

mod.build_time = new Date();
mod.built_by = proc.env.TRAVIS ? "Travis CI" : "others";
mod.branch = proc.env.TRAVIS_BRANCH;
mod.commit = proc.env.TRAVIS_COMMIT;
mod.build_id = proc.env.TRAVIS_BUILD_NUMBER;
mod.triggered_by = proc.env.TRAVIS_EVENT_TYPE;

mod.count = bcount;

let pmod = JSON.stringify(mod);
fs.writeFileSync(front + "build.json", pmod, 'utf8');

console.log("build.json done!");