extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.
var maxPercent = 1000
var elapsedPercent = 0
var dentro = false

@export var dragType : int = 0
@export var bubble: Node2D
@export var draggersNode: Node2D

var rb: RigidBody2D
const PATH_PREFAB = preload("res://prefabs/path_prefab.tscn")

# esto es para la esfera de influencia de la malla
@export var offset: Vector2
var mousePos: Vector2
#var sphericalDeformer
#const SPHERICAL_DEFORMER = preload("res://prefabs/spherical_deformer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	#sphericalDeformer = SPHERICAL_DEFORMER.instantiate()
	#bubble.get_node("3D/SubViewport").add_child(sphericalDeformer)
	#print(sphericalDeformer.get_path())
	
	mousePos.x = 0
	mousePos.y = 0
	
	rb = get_node(".")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#definicion de la posicion del deformador
	var ola = get_grab_position() + offset
	var newpos = Vector3(ola.x, ola.y, 0)
	
	# Mover el objeto.
	if is_selected:
		rb.linear_velocity = (get_global_mouse_position() - global_position) * 10
		#sphericalDeformer.position = newpos
		#print(sphericalDeformer.position)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mousePos = event.position

func get_grab_position() -> Vector2:
	var posEnMundo = bubble.get_node("3D/SubViewport").get_camera_3d().project_position(position,10)
	return Vector2(posEnMundo.x, posEnMundo.y)

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
		bubble.add_child(newpath)
		newpath.get_node("Path2D/PathFollow2D").add_child(rb)
		position = Vector2(0,0)
		print(self.get_path())
		rotation = 90
		print("HOLE HOLE")
