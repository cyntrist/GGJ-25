extends Node

var timer = 0
var frames_per_letter = 1
var elapsedTime: float = 0
var maxTime: float = 8
var textDisplay: float = 0
var aumentado: bool = false
@onready var label: Label = $Label
var text_ended = false
var clicked = false
var clicks = 0;
var stop = false
var transitioned = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if stop:
		label.visible_ratio =  1
		text_ended = true
	elif elapsedTime <= maxTime:
		if label.visible_ratio == 1:
			text_ended = true
		if textDisplay < 1:
			#if timer >= frames_per_letter:
			timer = 0
			label.visible_ratio = textDisplay
			textDisplay += delta
			#else:
				#timer += 1
		else:
			label.visible_ratio =  1
		elapsedTime += delta
	pass

func _input(event):
	if event.is_action_pressed("click"):
		if !text_ended:
			label.visible_ratio = 1
			stop = true;
			text_ended = true;
		else:
			match Global.stage:
				0: # estas en la precena y vas a la cena
					Global.change_scene(Global.Scenes.CENA)
				1: # estas en la poscena y vas al precine
					Global.change_scene(Global.Scenes.PREPOSTCITA)
				2: # estas en el precine y vas al cine
					Global.change_scene(Global.Scenes.CINE)
				3: # estas en el poscine y vas al prepicninc
					Global.change_scene(Global.Scenes.PREPOSTCITA)
				4: # estas en el prepicnic y vas al picnic
					Global.change_scene(Global.Scenes.PICNIC)
				5: # estas en el pospicnic y vas a la precama
					Global.change_scene(Global.Scenes.PREPOSTCITA)
				6: # estas en el precama y vas a la cama
					Global.change_scene(Global.Scenes.CAMA)
				_:
					print("PROBLEMA EN PREPOSTCITA")
			Global.next_stage()



func on_enable():
		# movidas del jason
	var string = "PRECITA"
	match Global.stage:
		0: # precena
			string = "PRECENA"
			pass
		1: # poscena
			string = "POSCENA"

			pass
		2: # precine
			string = "PRECINE"

			pass
		3: # poscine
			string = "POSCINE"

			pass
		4: # prepicnic
			string = "PREPICNIC"

			pass
		5: # pospicnic
			string = "POSPICNIC"

			pass
		6: # precama
			string = "PRECAMA"
			pass
	label.text = string
	pass

func on_disable():
	_reset()
	pass

func _reset():
	timer = 0
	frames_per_letter = 4
	elapsedTime = 0
	maxTime = 8
	textDisplay = 0
	aumentado = false
	text_ended = false
	clicked = false
	clicks = 0;
	stop = false
	transitioned = false