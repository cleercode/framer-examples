sweepScript = Utils.domLoadDataSync 'plugins/sweep.min.js'
eval sweepScript

Layer::animateColor = (options) ->
	options.properties ?= {}
	for k, v of options.properties
		sweep @, k, @[k] || '#fff', v,
			callback: => @[k] = v
			duration: (options.time || Framer.Defaults.Animation.time) * 1000

layer = new Layer
layer.center()
Utils.labelLayer layer, 'Click me'

layer.on Events.Click, ->
	layer.animateColor properties:
		backgroundColor: Utils.randomColor()
		color: Utils.randomColor()