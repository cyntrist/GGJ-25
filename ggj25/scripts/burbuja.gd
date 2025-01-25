extends Node2D

@onready var burbuja_mesh: MeshInstance3D = $"3D/SubViewport/DeformableMeshInstance3D"
@onready var burbuja_collider: CollisionShape2D = $"3D/Area2D/CollisionShape2D"
@export var base_size_buble: float = 1
@export var base_size_collider: float = 2

var ini_scale1 = Vector3(1,1,1) * base_size_buble
var ini_scale2 = Vector2(1,1) * base_size_collider
var next_scale1 = ini_scale1
var next_scale2 = ini_scale2

const SCALE_STEP = 3;
var actual_limit

func _ready() -> void: 
	burbuja_mesh.scale = ini_scale1
	burbuja_collider.scale = ini_scale2
	_on_active()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scale1 = burbuja_mesh.scale
	var scale2 = burbuja_collider.scale

	burbuja_mesh.scale = burbuja_mesh.scale.lerp(next_scale1, delta * SCALE_STEP)
	burbuja_collider.scale = burbuja_collider.scale.lerp(next_scale2, delta * SCALE_STEP)
	pass

func _on_active():
	actual_limit = Global.size_bubble_percent + 0.25

func _area_enter(area: Area2D) -> void:
	print("COLISION")
	if area.name == "DragAr":
		match area.get_parent().dragType:
			0:
				print("Deformable")
			1:
				print("Pintable")
				if Global.r_change > 0.36:
					Global.r_change -= 0.01
				if Global.g_change > 0.30:
					Global.g_change -= 0.01
				if Global.b_change > 0.10:
					Global.b_change -= 0.05
				$rendering/Pompa.modulate = Color(Global.r_change, Global.g_change, Global.b_change, 1)
			2: # 2 es cuando se pone cosas la burbuja.
				print("Ponible")
			3: # 3 es cuando se quedan dentro los objetos
				area.get_parent()._onEnter()
		pass
	# Cambio de tamanyo.
	if Global.size_bubble_percent < actual_limit:
		Global.size_bubble_percent += 0.02;	
		var scale1 = burbuja_mesh.scale
		var scale2 = burbuja_collider.scale
		next_scale1 = scale1 + Vector3(1,1,1) * Global.size_bubble_percent
		next_scale2 = scale2 + Vector2(1,1) * Global.size_bubble_percent
