extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.
var can_be_draggable = false # Para saber si se puede mover.
var offset : Vector2 # Offset 

@export var init_pos : Vector2 # Posicion inicial para volver cuando se suelte.



const text1 = preload("res://icon.svg")


# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = init_pos
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("Hola")
	# Mover el objeto.
	if is_selected:
		global_position = get_global_mouse_position()

# Para cuando se pulsa
func on_down():
	is_selected = true
	#print("Pulsado")


# Para cuando se deja de pulsar.
func on_up():
	is_selected = false
	global_position = init_pos # Resetear la posicion
	#print("Despulsado")
