require('coffee-script');
fs = require 'fs'
path = require 'path'
get = require 'get'
npmls = require 'npm/lib/utils/read-installed'
async = require 'async'

depends = {}

getDependencies = (deps, options, cb) ->
  if !deps or deps is {}
    return cb null
  if !options.recursive
    return cb(dep for dep of deps when dep?)

  if !Array.isArray deps
    deps = (x for x of deps when !depends.hasOwnProperty(x))
  async.forEach deps, ((item, call) -> getInfo(item, options, call)), -> cb depends

getInfo = (package, options, call) ->
    info = new get uri: 'http://registry.npmjs.org/' + package
    info.asString (err, res) ->
      if err
        depends[package] = 'Failed-to-resolve'
        return call()
      pack = JSON.parse res
      throw new Error 'Error parsing NPM registry response!' unless pack
      latest = pack['dist-tags'].latest
      newDeps = pack.versions[latest].dependencies
      newDeps = (x for x of newDeps when !depends.hasOwnProperty(x)) # filter
      if options.verbose
        filtPack = {}
        filtPack.version = latest
        filtPack.download = pack.versions[latest].dist.tarball
        depends[pack.name] = filtPack
      else
        depends[pack.name] = latest
      if newDeps.length > 0
        getDependencies newDeps, options, call
      else
        call()

module.exports =
  analyze: (options, cb) ->
    options.recursive ?= true
    options.verbose ?= false

    throw new Error 'options.package is required for analysis.' unless options.package

    path.exists options.package, (exists) ->
      throw new Error options.package + ' does not exist.' unless exists
      fs.readFile options.package, (err, data) ->
        throw err if err
        getDependencies JSON.parse(data).dependencies, options, cb

