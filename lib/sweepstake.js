var _, errors;

_ = require('underscore');

errors = {
  no_server: 'Missing required options for sweepstake. Please ensure `server` is present.',
  no_name: 'Missing required options for sweepstake. Please ensure `name` is present.'
};

module.exports = function(opts) {
  var Sweepstake;
  if (!opts.server) {
    throw new Error(errors.no_server);
  }
  if (!opts.name) {
    throw new Error(errors.no_name);
  }
  return Sweepstake = (function() {
    function Sweepstake(opts) {
      var base;
      this.opts = _.extend(this.opts, opts);
      if ((base = this.opts).sweepstake_form == null) {
        base.sweepstake_form = '#sweepstakeForm';
      }
    }

    Sweepstake.prototype.logOpts = function() {
      return console.log(this.opts);
    };

    return Sweepstake;

  })();
};
