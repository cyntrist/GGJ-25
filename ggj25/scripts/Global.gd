extends Node
# SEÑALES
signal to_transition
signal transitioned
signal on_enable(scene)
signal on_disable(scene)

enum Scenes { MAIN_MENU, INTRO, CONTEXTO, PREPOSTCITA, CENA, PICNIC, CINE, CAMA, CREDITS, NULL}
enum ObjsTypes { DEFORMABLE, COLOCABLE, PINTABLE}

var gms
var current_scene = Scenes.NULL 
var next_scene = Scenes.INTRO
var size_bubble_percent = 0
var is_dragging
var r_change = 1
var g_change = 1
var b_change = 1

func change_scene(next : Global.Scenes, force = true):
	if (current_scene != next || force):
		Global.next_scene = next
		Global.to_transition.emit()
