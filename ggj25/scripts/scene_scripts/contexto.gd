extends Node

var timer = 0
var frames_per_letter = 4
var elapsedTime: float = 0
var maxTime: float = 8
var textDisplay: float = 0
var aumentado: bool = false
@onready var label: Label = $Label
@onready var background: ColorRect = $ColorRect

var clicks = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto Contexto contexto "


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if elapsedTime <= maxTime:
		if timer >= frames_per_letter and textDisplay < 1:
			timer = 0
			label.visible_ratio =  textDisplay
			textDisplay += delta
		else:
			timer += 1
			# label.visible_ratio =  1
		elapsedTime += delta
	pass

func _input(event):
	if event.is_action_pressed("click"):
		$AnimationPlayer.play("fadeout")
		print("click")



func on_enable():
	pass

func on_disable():
	pass