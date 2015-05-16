Sweepstake = require './../../src/sweepstake.coffee'

opts=
	server: 'test'
	name: 'nameTest'

sw = new Sweepstake opts

myExtension=
	name: 'My Extension'
	setup: () ->
		console.log 'wooohoo'
	onBeforeSend: ()->
		'hello'
		
myOtherExtension=
	name: 'My Other Extension'
	setup: () ->
		console.log 'asdsadasd'
	onBeforeSend: ()->
		'hello'		
		
sw.register_extension myExtension
sw.register_extension myOtherExtension

console.log sw.list_extensions()