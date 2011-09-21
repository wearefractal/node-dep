**node-dep is a dependency analyzer for NodeJS**


## Installation
    
To install node-dep, use [npm](http://github.com/isaacs/npm):

        $ npm install node-dep

## Usage

```
var analyzer = require('node-dep');
var options = {
  package: __dirname + '/package.json',
  recursive: true
};
analyzer.analyze(options, function(deps) {
  return console.log(deps);
});

```

will return something like

```
{
   'coffee-script':'1.1.2',
   'node-log':'0.0.2',
   protege:'0.0.8',
   npm:'1.0.30',
   colors:'0.5.0',
   semver:'1.0.9',
   ini:'1.0.1',
   slide:'1.1.3',
   abbrev:'1.0.3',
   'graceful-fs':'1.0.0',
   minimatch:'0.0.4',
   nopt:'1.0.8',
   'node-uuid':'1.2.0',
   'proto-list':'1.0.0',
   rimraf:'1.0.6',
   request:'2.1.1',
   which:'1.0.2',
   'lru-cache':'1.0.4'
}

```

setting verbose to true in options will give you something like this

```
{
   'coffee-script':{
      version:'1.1.2',
      download:'http://registry.npmjs.org/coffee-script/-/coffee-script-1.1.2.tgz'
   },
   'node-log':{
      version:'0.0.2',
      download:'http://registry.npmjs.org/node-log/-/node-log-0.0.2.tgz'
   },
   protege:{
      version:'0.0.8',
      download:'http://registry.npmjs.org/protege/-/protege-0.0.8.tgz'
   },
   npm:{
      version:'1.0.30',
      download:'http://registry.npmjs.org/npm/-/npm-1.0.30.tgz'
   },
   colors:{
      version:'0.5.0',
      download:'http://registry.npmjs.org/colors/-/colors-0.5.0.tgz'
   },
   semver:{
      version:'1.0.9',
      download:'http://registry.npmjs.org/semver/-/semver-1.0.9.tgz'
   },
   ini:{
      version:'1.0.1',
      download:'http://registry.npmjs.org/ini/-/ini-1.0.1.tgz'
   },
   slide:{
      version:'1.1.3',
      download:'http://registry.npmjs.org/slide/-/slide-1.1.3.tgz'
   },
   abbrev:{
      version:'1.0.3',
      download:'http://registry.npmjs.org/abbrev/-/abbrev-1.0.3.tgz'
   },
   'graceful-fs':{
      version:'1.0.0',
      download:'http://registry.npmjs.org/graceful-fs/-/graceful-fs-1.0.0.tgz'
   },
   minimatch:{
      version:'0.0.4',
      download:'http://registry.npmjs.org/minimatch/-/minimatch-0.0.4.tgz'
   },
   nopt:{
      version:'1.0.8',
      download:'http://registry.npmjs.org/nopt/-/nopt-1.0.8.tgz'
   },
   'node-uuid':{
      version:'1.2.0',
      download:'http://registry.npmjs.org/node-uuid/-/node-uuid-1.2.0.tgz'
   },
   'proto-list':{
      version:'1.0.0',
      download:'http://registry.npmjs.org/proto-list/-/proto-list-1.0.0.tgz'
   },
   rimraf:{
      version:'1.0.6',
      download:'http://registry.npmjs.org/rimraf/-/rimraf-1.0.6.tgz'
   },
   request:{
      version:'2.1.1',
      download:'http://registry.npmjs.org/request/-/request-2.1.1.tgz'
   },
   which:{
      version:'1.0.2',
      download:'http://registry.npmjs.org/which/-/which-1.0.2.tgz'
   },
   'lru-cache':{
      version:'1.0.4',
      download:'http://registry.npmjs.org/lru-cache/-/lru-cache-1.0.4.tgz'
   }
}
```
## Examples

You can view further examples in the [example folder.](https://github.com/wearefractal/node-dep/tree/master/examples)

## LICENSE

(MIT License)

Copyright (c) 2011 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
