extends Node

enum scenes {MAINMENU, TEXTO, CREDITOS, CENA, PICNIC, CINE, CAMA}

var scenaActual: scenes = scenes.MAINMENU

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _change_to_scene(newScene: scenes):
	if scenaActual != newScene:
		scenaActual = newScene
	
