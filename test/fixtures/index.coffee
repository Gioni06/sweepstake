Sweepstake = require './../../src/sweepstake.coffee'

opts=
	server: 'test'
	name: 'nameTest'

sw = new Sweepstake opts

console.log sw

console.log typeof sw.getOptions