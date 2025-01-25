extends Node

@onready var mainmenu = $MainMenu
@onready var nullscene = $NullScene
@onready var intro = $Intro
@onready var contexto = $Contexto
@onready var prepostcita = $Prepostcita
@onready var cena = $Cena
@onready var cine = $Cine
@onready var picnic = $Picnic
@onready var cama = $Cama
@onready var credits = $Credits
@onready var fade = $FadeScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.gms = self
	# Global.to_transition.connect(_on_totransition)
	Global.transitioned.connect(_on_fade_scene_transitioned)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event):
	if event.is_action_pressed("1"):
		print("INPUT 1")
		Global.change_scene(Global.Scenes.INTRO)
	if event.is_action_pressed("2"):
		print("INPUT 2")
		Global.change_scene(Global.Scenes.MAIN_MENU)
	if event.is_action_pressed("3"):
		print("INPUT 3")
		Global.change_scene(Global.Scenes.CONTEXTO)
	if event.is_action_pressed("4"):
		Global.change_scene(Global.Scenes.PREPOSTCITA)
	if event.is_action_pressed("5"):
		Global.change_scene(Global.Scenes.CENA)
	if event.is_action_pressed("6"):
		Global.change_scene(Global.Scenes.CINE)
	if event.is_action_pressed("7"):
		Global.change_scene(Global.Scenes.PICNIC)
	if event.is_action_pressed("8"):
		Global.change_scene(Global.Scenes.CAMA)
	if event.is_action_pressed("9"):
		Global.change_scene(Global.Scenes.CREDITS)
	if event.is_action_pressed("10"):
		Global.change_scene(Global.Scenes.NULL)
		

# func _change_to_scene(newScene: scenes):
# 	if current_scente != next_scene:
# 		current_scente = next_scene
	
# @onready var ambient_sound: AudioStreamPlayer2D = $AmbientSound
# @onready var ambient_sound_2: AudioStreamPlayer2D = $AmbientSound2
# @onready var sfx: AudioStreamPlayer2D = $SFX
# @onready var sfx_2: AudioStreamPlayer2D = $SFX2


func _on_transition() -> void: #fade in
	fade.transition()

func _on_fade_scene_transitioned() -> void: #justo antes del fadeout, la idea es que esto sea un switch
	#if Global.current_scene == Global.to_scene:
		 #pass
	match Global.current_scene:
		Global.Scenes.NULL:
			nullscene.visible = false
			nullscene.on_disable()
			nullscene.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.MAIN_MENU:
			mainmenu.visible = false
			mainmenu.on_disable()
			mainmenu.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.INTRO:
			intro.visible = false
			intro.on_disable();
			intro.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CONTEXTO:
			contexto.visible = false
			contexto.on_disable()
			contexto.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.PREPOSTCITA:
			prepostcita.visible = false
			prepostcita.on_disable()
			prepostcita.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CENA:
			cena.visible = false
			cena.on_disable()
			cena.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.PICNIC:
			picnic.visible = false
			picnic.on_disable()
			picnic.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CINE:
			cine.visible = false
			cine.on_disable()
			cine.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CAMA:
			cama.visible = false
			cama.on_disable()
			cama.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CREDITS:
			credits.visible = false
			credits.process_mode = Node.PROCESS_MODE_DISABLED
		_:
			print(">>> DEFAULT STATE")
	match Global.next_scene:
		Global.Scenes.NULL:
			nullscene.visible = true
			nullscene.on_enable()
			nullscene.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.MAIN_MENU:
			mainmenu.visible = true
			mainmenu.on_enable()
			mainmenu.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.INTRO:
			intro.visible = true
			intro.on_enable()
			intro.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CONTEXTO:
			contexto.visible = true
			contexto.on_enable()
			contexto.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.PREPOSTCITA:
			prepostcita.visible = true
			prepostcita.on_enable()
			prepostcita.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CENA:
			cena.visible = true
			cena.on_enable()
			cena.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.PICNIC:
			picnic.visible = true
			picnic.on_enable()
			picnic.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CINE:
			cine.visible = true
			cine.on_enable()
			cine.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CAMA:
			cama.visible = true
			cama.on_enable()
			cama.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CREDITS:
			credits.visible = true
			credits.process_mode = Node.PROCESS_MODE_INHERIT
		_:
			print(">>> DEFAULT STATE")
	Global.current_scene = Global.next_scene	
