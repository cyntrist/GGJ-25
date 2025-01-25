extends Node2D

@onready var burbuja_mesh: MeshInstance3D = $"3D/SubViewport/DeformableMeshInstance3D"
@onready var burbuja_collider: CollisionShape2D = $"3D/Area2D/CollisionShape2D"
@export var base_size_buble: float = 1
@export var base_size_collider: float = 2


var actual_limit

func _ready() -> void: 
	_on_active()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	burbuja_mesh.scale = Vector3(1,1,1) * Global.size_bubble_percent + Vector3(1,1,1) * base_size_buble
	burbuja_collider.scale =  Vector2(1,1) * Global.size_bubble_percent + Vector2(1,1) * base_size_collider


func _on_active():
	actual_limit = Global.size_bubble_percent + 0.25

func _area_enter(area: Area2D) -> void:
	if Global.size_bubble_percent < actual_limit:
		Global.size_bubble_percent += 0.01;
