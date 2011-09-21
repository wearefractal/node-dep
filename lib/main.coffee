fs = require 'fs'
path = require 'path'
get = require 'get'
npmls = require 'npm/lib/utils/read-installed'

depends = {}
left = 0

getDependencies = (deps, options, cb) ->
  if !deps or deps is {}
    return cb null
  if !options.recursive
    return cb(dep for dep of deps when dep?)
      
  if !Array.isArray deps    
    deps = (x for x of deps when !depends.hasOwnProperty(x))
    
  for x in deps
    depends[x] = 'in progress'
    if left is 0 then left = deps.length
    getInfo x, options, (info) ->
      cb info
      
getInfo = (package, options, cb) ->    
    info = new get uri: 'http://registry.npmjs.org/' + package
    info.asString (err, res) ->
      # throw err if err
      return if err
      pack = JSON.parse res
      throw new Error 'Error parsing NPM registry response!' unless pack
      latest = pack['dist-tags'].latest
      newDeps = pack.versions[latest].dependencies
      newDeps = (x for x of newDeps when !depends.hasOwnProperty(x)) # filter
      left--
      if options.verbose
        filtPack = {}
        filtPack.version = latest
        filtPack.download = pack.versions[latest].dist.tarball
        depends[pack.name] = filtPack
      else
        depends[pack.name] = latest
      #console.log left
      if newDeps.length > 0
        left += newDeps.length
        #console.log 'left: ' + newDeps
        getDependencies newDeps, options, cb
      else if left is 0
        if cb?
          #console.log 'Finished'
          cb depends
        
module.exports =
  analyze: (options, cb) ->
    options.recursive ?= true
    options.verbose ?= false
    
    throw new Error 'options.package is required for analysis.' unless options.package
        
    path.exists options.package, (exists) ->
      throw new Error options.page + ' does not exist.' unless exists
      fs.readFile options.package, (err, data) ->
        if err
          throw err
        else
          getDependencies JSON.parse(data).dependencies, options, cb
    
      
