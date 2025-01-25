extends Node2D

@onready var burbuja_mesh: MeshInstance3D = $"3D/SubViewport/DeformableMeshInstance3D"
@onready var burbuja_collider: CollisionShape2D = $"3D/Area2D/CollisionShape2D"
@export var base_size_buble: float = 1
@export var base_size_collider: float = 2

@export var shake_factor = 0.1
@onready var rng = RandomNumberGenerator.new()
@onready var noise = FastNoiseLite.new()
var shake_speed = 10;
@onready var ini_pos = self.position

var actual_limit

func _ready() -> void: 
	noise = FastNoiseLite.new()
	print("INIPOS: ", ini_pos)
	_on_active()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	burbuja_mesh.scale = Vector3(1,1,1) * Global.size_bubble_percent + Vector3(1,1,1) * base_size_buble
	burbuja_collider.scale =  Vector2(1,1) * Global.size_bubble_percent + Vector2(1,1) * base_size_collider
	
	#var xOffset = Mathf.PerlinNoise(delta * shakeSpeed, 0);
	#var yOffset = Mathf.PerlinNoise(0, delta * shakeSpeed);

	# var x_offset = noise.get_noise_2d(delta * shake_speed, 0)
	# var y_offset = noise.get_noise_2d(0, delta * shake_speed) 
	# # var xr_offset = rng.randf();
	# # var yr_offset = rng.randf();
	# # self.position = ini_pos + Vector2(xr_offset,yr_offset) 
	# self.position = ini_pos + Vector2(x_offset,y_offset) 

	print("POSITION: ", self.position)


func _on_active():
	actual_limit = Global.size_bubble_percent + 0.25

func _area_enter(area: Area2D) -> void:
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
		pass
	# Cambio de tamanyo.
	if Global.size_bubble_percent < actual_limit:
		Global.size_bubble_percent += 0.01;	
