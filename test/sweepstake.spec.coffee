chai = require('chai')
should = chai.should()

Sweepstake = require '../src/sweepstake.coffee'

describe "Sweepstake base module", ()->
		
	it "should intitialize with options", ()->
		opts=
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
		sw = new Sweepstake opts
		
		sw.opts.server.should.equal '//localhost:9000/api/'
		sw.opts.name.should.equal 'My Sweepstake Name'
	
	it "should return the current options", ()->
		opts=
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
			someKey: "some val"
		sw = new Sweepstake opts
		
		sw.getOptions().should.deep.equal
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
			someKey: "some val"
			
	it "should set additional options", ()->
		opts=
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
			someKey: "some val"
		sw = new Sweepstake opts
		
		sw.setOptions {anotherKey : 'string'}
		
		sw.getOptions().should.deep.equal
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
			someKey: "some val"
			anotherKey : 'string'
			
	it "should register an extension", ()->
		opts=
			server: '//localhost:9000/api/'
			name: 'My Sweepstake Name'
			someKey: "some val"
			
		myExtension=
			name: 'My Extension'
			onBeforeSend: ()->
				'hello'
				
		sw = new Sweepstake opts
		
		sw.register_extension myExtension

		sw.list_extensions().should.deep.equal ['hello']
							