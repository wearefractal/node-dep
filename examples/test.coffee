analyzer = require '../lib/main'
path = require 'path'

options =
  package: path.join(__dirname, 'package.json')
  recursive: true
  
analyzer.analyze options, (deps) ->
  console.log deps
