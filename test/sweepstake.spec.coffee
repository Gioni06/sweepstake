should = require 'should'

Sweepstake = require '../lib/sweepstake.js'

describe "Sweepstake", ()->
	before ()->
		opts=
			server: '//localhost:9000/api/'
			name: 'theName'
			
		sw = new Sweepstake opts	
	it "should load", ()->
		number = 10
		number.should.equal 10