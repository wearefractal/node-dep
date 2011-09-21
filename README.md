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

will return

```
{ 'coffee-script': '1.1.2',
  'node-log': '0.0.2',
  protege: '0.0.8',
  npm: '1.0.30',
  colors: '0.5.0',
  semver: '1.0.9',
  ini: '1.0.1',
  slide: '1.1.3',
  abbrev: '1.0.3',
  'graceful-fs': '1.0.0',
  minimatch: '0.0.4',
  nopt: '1.0.8',
  'node-uuid': '1.2.0',
  'proto-list': '1.0.0',
  rimraf: '1.0.6',
  request: '2.1.1',
  which: '1.0.2',
  'lru-cache': '1.0.4' }

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
