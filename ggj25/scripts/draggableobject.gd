extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.
var maxPercent = 10
var elapsedPercent = 0

@export var dragType : int 
@export var Ylimit : float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover el objeto.
	if is_selected:
		global_position = get_global_mouse_position()
	elif global_position.y < Ylimit:
		if elapsedPercent <maxPercent:
			elapsedPercent += 0.1
		global_position.y += elapsedPercent

# Para cuando se pulsa.
func _onDown():
	is_selected = true
	Global.is_dragging = true
	#print("Pulsado")

# Para cuando se deja de pulsar.
func _onUp():
	is_selected = false
	Global.is_dragging = false
	elapsedPercent = 0
	#print("Despulsado")
