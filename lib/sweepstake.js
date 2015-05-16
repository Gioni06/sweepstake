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
    this.extensions = [];
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
    var setup;
    this.extensions.push(obj);
    setup = _.pick(obj, 'setup' || _.noop());
    return setup.setup();
  };

  Sweepstake.prototype.list_extensions = function() {
    var list, listExtensions;
    listExtensions = this.extensions;
    return list = _.map(listExtensions, function(ext) {
      _.pick(ext, 'name');
      return ext.name;
    });
  };

  Sweepstake.prototype.onBeforeSend = function() {
    var fireFunction;
    fireFunction = _.pluck(this.extionsions, 'onBeforeSend');
    console.log(fireFunction);
    return _.map(fireFunction, function(func) {
      return func();
    });
  };

  return Sweepstake;

})();
