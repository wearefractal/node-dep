log = require 'node-log'
log.setName 'node-dep'
  
fs = require 'fs'
path = require 'path'
get = require 'get'
npmls = require 'npm/lib/utils/read-installed'

deps = {}

getDependencies = (deps, options, cb) ->
  if !deps or deps is {}
    return cb null
  if !options.recursive
    return cb(dep for dep of deps when dep?)
      
  for x of deps
    getInfo x, options, (info) ->
      console.log info
      
getInfo = (package, options, cb) ->
    # TODO: Accept versions and use semver to find proper dependencies
    info = new get uri: 'http://registry.npmjs.org/' + package
    info.asString (err, res) ->
      console.log 'http://registry.npmjs.org/' + package
      # throw err if err
      return if err
      pack = JSON.parse res
      throw new Error 'Error parsing NPM registry response!' unless pack
      filtPack = {}
      filtPack.name = pack.name
      filtPack.latest = pack['dist-tags'].latest
      filtPack.dependencies = pack.versions[filtPack.latest].dependencies
      filtPack.download = pack.versions[filtPack.latest].tarball
      
      deps[filtPack.name] = filtPack.latest
      filtPack.dependencies = (x for x of filtPack.dependencies when !deps.hasOwnProperty(x)) # filter
      if filtPack.dependencies? and filtPack.dependencies isnt {} and filtPack.dependencies isnt []
        getDependencies filtPack.dependencies, options, cb
        
module.exports =
  analyze: (options, cb) ->
    options.recursive ?= true
    throw new Error 'options.package is required for analysis.' unless options.package
        
    path.exists options.package, (exists) ->
      throw new Error options.page + ' does not exist.' unless exists
      fs.readFile options.package, (err, data) ->
        if err
          throw err
        else
          getDependencies JSON.parse(data).dependencies, options, cb
    
      
