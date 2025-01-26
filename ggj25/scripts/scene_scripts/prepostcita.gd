extends Node

var timer = 0
var frames_per_letter = 4
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
@export var first_font : FontFile = null
@export var second_font : FontFile = null
var theme

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	theme = label.theme
	pass # Replace with function body.


func _process(delta: float) -> void:
	if stop:
		label.visible_ratio =  1
		text_ended = true
	elif elapsedTime <= maxTime:
		if label.visible_ratio == 1:
			text_ended = true
		if textDisplay < 1:
			if timer >= frames_per_letter:
				timer = 0
				label.visible_ratio = textDisplay
				textDisplay += delta
			else:
				timer += 1
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
					#Global.change_scene(Global.Scenes.PREPOSTCITA)
					Global.next_stage()
					return
				1: # estas en la poscena y vas al precine
					Global.change_scene(Global.Scenes.PREPOSTCITA)
					Global.next_stage()
					return
				2: # estas en el precine y vas al cine
					Global.change_scene(Global.Scenes.CINE)
					Global.next_stage()
					return
					#Global.change_scene(Global.Scenes.PREPOSTCITA)
				3: # estas en el poscine y vas al prepicninc
					Global.change_scene(Global.Scenes.PREPOSTCITA)
					Global.next_stage()
					return
				4: # estas en el prepicnic y vas al picnic
					Global.change_scene(Global.Scenes.PICNIC)
					Global.next_stage()
					return
					#Global.change_scene(Global.Scenes.PREPOSTCITA)
				5: # estas en el pospicnic y vas a la precama
					Global.change_scene(Global.Scenes.PREPOSTCITA)
					Global.next_stage()
					return
				6: # estas en el precama y vas a la 2ª pre cama
					Global.change_scene(Global.Scenes.PREFOLLAR)
					Global.next_stage()
					return
				_:
					print("PROBLEMA EN PREPOSTCITA")



func on_enable():
		# movidas del jason
	var string = "Precita"
	match Global.stage:
		0: # precena
			string = "PRERESTAURANTE"
			label.set("theme_override_fonts/font", first_font)
			pass
		1: # poscena
			string = "POSTRESTAURANTE"
			label.set("theme_override_fonts/font", second_font)

			pass
		2: # precine
			string = "PRECINE"
			label.set("theme_override_fonts/font", first_font)

			pass
		3: # poscine
			string = "POSTCINE"
			label.set("theme_override_fonts/font", second_font)

			pass
		4: # prepicnic
			string = "PREPICNIC"
			label.set("theme_override_fonts/font", first_font)

			pass
		5: # pospicnic
			string = "POSTPICNIC"
			label.set("theme_override_fonts/font", second_font)

			pass
		6: # precama
			string = "PREFOLLARUNO"
			label.set("theme_override_fonts/font", first_font)
			pass
			
	label.text = tr(string)
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
