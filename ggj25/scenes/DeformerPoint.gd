extends Node

@export var offset: Vector2
var mousePos: Vector2

@onready var spherical_deformer: MeshInstance3D = $SubViewport/SphericalDeformer
@onready var deformable_mesh_instance_3d: MeshInstance3D = $SubViewport/DeformableMeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mousePos.x = 0
	mousePos.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var ola = get_grab_position() + offset
	var newpos = Vector3(ola.x, ola.y, 0)
	spherical_deformer.position = newpos

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mousePos = event.position

func get_grab_position() -> Vector2:
	var posEnMundo = $SubViewport.get_camera_3d().project_position(mousePos,10)
	return Vector2(posEnMundo.x, posEnMundo.y)
