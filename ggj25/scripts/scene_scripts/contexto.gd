extends Node

@onready var label: Label = $Label
@onready var background: ColorRect = $ColorRect
var timer = 0
var frames_per_letter = 4
var elapsedTime: float = 0
var maxTime: float = 8
var textDisplay: float = 0
var aumentado: bool = false
var text_ended = false
var clicked = false
var clicks = 0;
var stop = false
var transitioned = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stop:
		label.visible_ratio =  1
		text_ended = true
	elif elapsedTime <= maxTime:
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
		if label.visible_ratio == 1:
			text_ended = true
		if transitioned:
			print(transitioned)
			Global.change_scene(Global.Scenes.PREPOSTCITA)
		if !text_ended:
			label.visible_ratio = 1
			stop = true;
			text_ended = true;
		else:
			if !clicked:
				$AnimationPlayer.play("fadeout")
				clicked = true
			



func on_enable():
	pass

func on_disable():
	_reset()
	pass

func _on_animation_player_animation_finished(anim_name:StringName) -> void:
	transitioned = true

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
