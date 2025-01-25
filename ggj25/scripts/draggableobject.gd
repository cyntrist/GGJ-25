extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.

const text1 = preload("res://icon.svg")
signal picked
@onready var rigid_body_2d: RigidBody2D = $RigidBody2D
@onready var spherical_deformer: MeshInstance3D = $SphericalDeformer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover el objeto.
	if is_selected:
		$RigidBody2D.global_position = get_global_mouse_position()

# Para cuando se pulsa.
func _onDown():
	is_selected = true
	Global.is_dragging = true
	picked.emit()
	#print("Pulsado")

# Para cuando se deja de pulsar.
func _onUp():
	$RigidBody2D.linear_velocity = Vector2(0,0)
	is_selected = false
	Global.is_dragging = false
	#print("Despulsado")
