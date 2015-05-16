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
      @opts = _.extend @opts,opts
    
    logOpts: ()->
      console.log @opts