extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.

const text1 = preload("res://icon.svg")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover el objeto.
	if is_selected:
		global_position = get_global_mouse_position()

# Para cuando se pulsa.
func _onDown():
	is_selected = true
	Global.is_dragging = true
	#print("Pulsado")


# Para cuando se deja de pulsar.
func _onUp():
	is_selected = false
	Global.is_dragging = false
	
	
	#print("Despulsado")
