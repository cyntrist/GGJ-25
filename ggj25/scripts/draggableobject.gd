extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.
var maxPercent = 1000
var elapsedPercent = 0
var dentro = false

@export var dragType : int = 0
@export var Ylimit : float = 200
@export var draggersNodeBubble: Node2D
@export var draggersNode: Node2D

var rb: RigidBody2D
const PATH_PREFAB = preload("res://prefabs/path_prefab.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	rb = get_node(".")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover el objeto.
	if is_selected:
		rb.linear_velocity = (get_global_mouse_position() - global_position) * 10

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
	if dragType == 3:
		dentro = false
		rb.sleeping = false
		get_parent().remove_child(rb)
		draggersNode.add_child(rb)
		global_position = get_global_mouse_position()
		print(get_parent().name)
	#print("Despulsado")

func _onEnter():
	#0 = deformable, 1 = pintable, 2 = sombrero, 3 meterse dentro
	if dragType == 2:
		print("HOLA HOLA CARACOLA")
	elif dragType == 3 && not dentro:
		dentro = true
		rb.sleeping = true
		get_parent().remove_child(rb)
		var newpath = PATH_PREFAB.instantiate()
		draggersNodeBubble.add_child(newpath)
		newpath.get_node("Path2D/PathFollow2D").add_child(rb)
		position = Vector2(0,0)
		print(self.get_path())
		rotation = 90
		print("HOLE HOLE")

func _onExit():
	#0 = deformable, 1 = pintable, 2 = sombrero, 3 meterse dentro
	pass
