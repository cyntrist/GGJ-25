extends Node

@onready var mainmenu = $MainMenu
@onready var intro = $Intro
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
		Global.change_scene(Global.Scenes.MAIN_MENU)
	if event.is_action_pressed("2"):
		print("INPUT 2")
		Global.change_scene(Global.Scenes.INTRO)
	if event.is_action_pressed("3"):
		print("INPUT 3")
		Global.change_scene(Global.Scenes.CREDITS)
		

# func _change_to_scene(newScene: scenes):
# 	if current_scente != next_scene:
# 		current_scente = next_scene
	
# @onready var ambient_sound: AudioStreamPlayer2D = $AmbientSound
# @onready var ambient_sound_2: AudioStreamPlayer2D = $AmbientSound2
# @onready var sfx: AudioStreamPlayer2D = $SFX
# @onready var sfx_2: AudioStreamPlayer2D = $SFX2


func _on_transition() -> void: #fade in
	print("on transitioned")
	fade.transition()

func _on_fade_scene_transitioned() -> void: #justo antes del fadeout, la idea es que esto sea un switch
	#if Global.current_scene == Global.to_scene:
		 #pass
	match Global.current_scene:
		Global.Scenes.NULL:
			mainmenu.visible = false
			mainmenu.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.MAIN_MENU:
			mainmenu.visible = false
			mainmenu.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.CREDITS:
			credits.visible = false
			credits.process_mode = Node.PROCESS_MODE_DISABLED
		Global.Scenes.INTRO:
			intro.visible = false
			intro.process_mode = Node.PROCESS_MODE_DISABLED
		_:
			print(">>> DEFAULT STATE")
	match Global.next_scene:
		Global.Scenes.NULL:
			mainmenu.visible = true
			mainmenu.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.MAIN_MENU:
			mainmenu.visible = true
			mainmenu.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.CREDITS:
			credits.visible = true
			credits.process_mode = Node.PROCESS_MODE_INHERIT
		Global.Scenes.INTRO:
			intro.visible = true
			intro.process_mode = Node.PROCESS_MODE_INHERIT	
		_:
			print(">>> DEFAULT STATE")
	Global.current_scene = Global.next_scene	

