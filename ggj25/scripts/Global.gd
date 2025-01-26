extends Node
# SEÑALES
signal to_transition
signal transitioned
signal on_enable(scene)
signal on_disable(scene)
signal on_end()

enum Scenes { MAIN_MENU, INTRO, CONTEXTO, PREPOSTCITA, CENA, PICNIC, CINE, CAMA, POP, CREDITS, NULL, PREFOLLAR}
enum ObjsTypes { DEFORMABLE, COLOCABLE, PINTABLE}

var gms
var current_scene = Scenes.NULL 
var next_scene = Scenes.INTRO
var max_bubble_size = 1.5
var actual_size = 0.1
var nivel_actual = 1
var is_dragging
var r_change = 1
var g_change = 1
var b_change = 1
var stage = 0
# 0 precena 1 postcena 2 precine 3 postcine 4 prepicnic 5 pospicnic 6 precama

func next_stage():
	Global.stage += 1
	Global.stage = clamp(Global.stage, 0, 6)

func change_scene(next : Global.Scenes, force = true):
	if (current_scene != next || force):
		Global.next_scene = next
		Global.to_transition.emit()
