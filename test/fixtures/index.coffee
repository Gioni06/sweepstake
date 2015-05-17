Sweepstake = require './../../src/sweepstake.coffee'

opts=
	server: 'test'
	name: 'nameTest'

sw = new Sweepstake opts

myExtension=
	name: 'My Extension'
	setup: () ->
		console.log 'Extension One'
	onBeforeSend: ()->
		console.log 'Hello Extension One'
		
myOtherExtension=
	name: 'My Other Extension'
	setup: () ->
		console.log 'Extensions Two'
	onBeforeSend: ()->
		console.log 'Hello Extension Two'		

console.log '____ list extensions ____'		
sw.register_extension myExtension
sw.register_extension myOtherExtension

console.log '____ onBeforeSend ____'

sw.send ()->
	console.log '____ done ____'