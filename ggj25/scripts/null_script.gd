extends Node

var changed = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!changed):
		Global.change_scene(Global.Scenes.INTRO)
	pass

func on_enable():
	pass

func on_disable():
	pass