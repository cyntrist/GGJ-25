extends Node
# SEÑALES
signal to_transition
signal transitioned

enum Scenes { MAIN_MENU, INTRO, CREDITS, CENA, PICNIC, CINE, CAMA, NULL}

var gms
var current_scene = Scenes.NULL 
var next_scene = Scenes.MAIN_MENU

func change_scene(next : Global.Scenes):
	print("change scene")
	Global.next_scene = next
	Global.to_transition.emit()