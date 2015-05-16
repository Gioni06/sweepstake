var Sweepstake, _, errors;

_ = require('underscore');

errors = {
  no_server: 'Missing required options for sweepstake. Please ensure `server` is present.',
  no_name: 'Missing required options for sweepstake. Please ensure `name` is present.'
};

module.exports = Sweepstake = (function() {
  function Sweepstake(opts) {
    if (!opts.server) {
      throw new Error(errors.no_server);
    }
    if (!opts.name) {
      throw new Error(errors.no_name);
    }
    this.opts = _.extend(this.opts, opts);
  }

  Sweepstake.prototype.logOpts = function() {
    return console.log(this.opts);
  };

  return Sweepstake;

})();
