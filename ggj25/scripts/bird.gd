extends "res://scripts/draggableobject.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("bird")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Parar la animacion.
func _stopAnim():
	$AnimationPlayer.stop()
