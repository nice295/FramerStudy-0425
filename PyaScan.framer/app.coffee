# Import file "PayScan" (sizes and positions are scaled 1:4)
sketch = Framer.Importer.load("imported/PayScan@4x")
	
Utils.globalLayers(sketch)

Canvas.image = "images/1.jpg"

# Show kayer
shot = new Layer
	width: Screen.width
	height: Screen.height
	backgroundColor: "white"
	visible: false
	
# States
shottoscan.states.add
	on:
		opacity: 0.0
		
item.states.add
	on:
		opacity: 1.0
		scale: 1.0
		scaledFrame: 2
	off:
		opacity: 0.0
		scale: 0.7
item.states.switchInstant "off"
item.states.animationOptions =
    curve: "spring(100, 10, 0)"
    
tag.states.add
	on:
		opacity: 1.0
	off:
		opacity: 0.0
tag.states.switchInstant "off"	

camera.states.add 
	on:
		opacity: 0.0
	off:
		opacity: 1.0
		
# Animation
aniShot = new Animation
	layer: shot
	properties: 
		opacity: 0.0
	time: 0.3
	
# Events
camera.on Events.Click, ->
	shottoscan.states.switchInstant "on"
	camera.states.switchInstant "on"
	aniShot.start()
	tag.states.switch "on", delay: 0.5

tag.on Events.Click, ->
	item.states.switch "on"
	Canvas.image = "images/2.png"

