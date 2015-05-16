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
    this.extensions = {};
    this.opts = {};
    _.extend(this.opts, opts);
  }

  Sweepstake.prototype.getOptions = function() {
    return this.opts;
  };

  Sweepstake.prototype.setOptions = function(obj) {
    return _.extend(this.opts, obj);
  };

  Sweepstake.prototype.register_extension = function(obj) {
    return _.extend(this.extensions, obj);
  };

  Sweepstake.prototype.list_extensions = function(extensions) {
    var fireFunction;
    this.extensions = extensions;
    return fireFunction = _.pluck(this.extionsions, 'name');
  };

  Sweepstake.prototype.onBeforeSend = function(extensions) {
    var fireFunction;
    this.extensions = extensions;
    fireFunction = _.pluck(this.extionsions, 'onBeforeSend');
    return _.map(fireFunction, function(func) {
      return func();
    });
  };

  return Sweepstake;

})();
