extends Node
# SEÑALES
signal to_transition
signal transitioned

enum Scenes { MAIN_MENU, INTRO, CREDITS, CENA, PICNIC, CINE, CAMA, NULL}

var gms
var current_scene = Scenes.NULL 
var next_scene = Scenes.MAIN_MENU

var size_bubble_percent: float = 0

var is_dragging = false # Para saber si se esta moviendo un objeto.

func change_scene(next : Global.Scenes):
	print("change scene")
	Global.next_scene = next
	Global.to_transition.emit()
