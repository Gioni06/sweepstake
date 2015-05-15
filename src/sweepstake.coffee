_ = require 'underscore'

errors =
  no_server: 'Missing required options for sweepstake. Please ensure `server` is present.'
  no_name: 'Missing required options for sweepstake. Please ensure `name` is present.'
  

module.exports = (opts) ->
  # throw error if missing required config
  if not (opts.server)
    throw new Error errors.no_server
  if not (opts.name)
    throw new Error errors.no_name 

  class Sweepstake
    constructor: (opts) ->
      @opts = _.extend @opts,opts
      @opts.sweepstake_form ?= '#sweepstakeForm'
    
    logOpts: ()->
      console.log @opts
      
    #setup: ->
      #configure_content(opts.content_types).with(@)
        #.then(get_all_content)
       # .tap(set_urls)
        #.tap(set_locals)
        #.tap(compile_entries)