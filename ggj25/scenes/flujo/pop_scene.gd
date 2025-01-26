extends Control

var timer = 0
var interval = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(timer)
	if timer <= interval:
		timer += 1
	else:
		timer = 0
		Global.on_end.emit()
	pass



func on_enable():
	pass

func on_disable():
	pass
