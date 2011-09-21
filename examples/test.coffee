analyzer = require '../lib/main'
path = require 'path'

options =
  package: path.join(__dirname, 'package.json')
  recursive: true
  
console.info options
analyzer.analyze options, (deps) ->
  console.log deps
