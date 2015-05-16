_ = require 'underscore'

errors =
  no_server: 'Missing required options for sweepstake. Please ensure `server` is present.'
  no_name: 'Missing required options for sweepstake. Please ensure `name` is present.'
  
module.exports = class Sweepstake
    constructor: (opts) ->
      if not (opts.server)
        throw new Error errors.no_server
      if not (opts.name)
        throw new Error errors.no_name
      @extensions = []
      @opts = {}
      _.extend @opts,opts
    
    getOptions:() ->
      @opts
 
    setOptions: (obj)->
      _.extend @opts,obj
    
    register_extension: (obj)->
      @extensions.push obj
      setup = _.pick obj, 'setup' or _.noop()
      setup.setup()
      
    
    list_extensions: () ->
      listExtensions = @extensions
      list = _.map listExtensions, (ext) ->
         _.pick ext,'name'
         ext.name   
         
    onBeforeSend: (  )->
        fireFunction = _.pluck @extionsions, 'onBeforeSend'
        console.log fireFunction 
        _.map fireFunction, (func) ->
          func()
          
        