extends Node
# SEÑALES
signal to_transition
signal transitioned
signal on_enable(scene)
signal on_disable(scene)

enum Scenes { MAIN_MENU, INTRO, CONTEXTO, PREPOSTCITA, CENA, PICNIC, CINE, CAMA, CREDITS, NULL}

var gms
var current_scene = Scenes.NULL 
var next_scene = Scenes.INTRO
var size_bubble_percent = 0
var is_dragging

func change_scene(next : Global.Scenes, force = true):
	if (current_scene != next || force):
		Global.next_scene = next
		Global.to_transition.emit()
