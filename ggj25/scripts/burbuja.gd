extends Node2D
#public
@onready var sub_viewport: SubViewport = $"3D/SubViewport"

@onready var burbuja_mesh: MeshInstance3D = $"3D/SubViewport/DeformableMeshInstance3D"
@onready var burbuja_collider: CollisionShape2D = $"3D/Area2D/CollisionShape2D"
@onready var burbuja_collider2: CollisionShape2D = $"3D/RigidBody2D/CollisionShape2D"
@export var base_size_buble: float = 1
@export var base_size_collider: float = 0.25
@export var nextScene: int

@export var color_r = 94 # Color que tiene que llegar en R.
@export var color_g = 91 # Color que tiene que llegar en G.
@export var color_b = 28 # Color que tiene que llegar en B.

var ini_scale1 = Vector3(1,1,1) * base_size_buble
var ini_scale2 = Vector2(1,1) * base_size_collider
var next_scale1 = ini_scale1
var next_scale2 = ini_scale2

const SCALE_STEP = 3;
var actual_limit

#variables para tiempo de espera 
var toend = false
var elapsedtime = 0
var maxtime = 3;

func _ready() -> void: 
	burbuja_mesh.scale = ini_scale1
	burbuja_collider.scale = ini_scale2
	burbuja_collider2.scale = ini_scale2
	sub_viewport = $"3D/SubViewport"
	_on_active()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scale1 = burbuja_mesh.scale
	var scale2 = burbuja_collider.scale

	burbuja_mesh.scale = burbuja_mesh.scale.lerp(next_scale1, delta * SCALE_STEP)
	burbuja_collider.scale = next_scale2
	burbuja_collider2.scale = next_scale2
	
	#print(position)
	
	if toend:
		if elapsedtime < maxtime:
			elapsedtime += delta
			print(elapsedtime)
		else:
			Global.change_scene(nextScene)
			print("zzumo")
			

func _on_active():
	actual_limit = Global.size_bubble_percent + 0.25

func _area_enter(area: Area2D) -> void:
	print("COLISION")
	if area.name == "DragAr":
		
		if area.get_parent().dragType == 0:
			print("Deformable")
		elif area.get_parent().dragType == 1:
			print("Pintable")
			if Global.r_change > color_r/255:
				Global.r_change -= 0.02
			if Global.g_change > color_g/255:
				Global.g_change -= 0.02
			if Global.b_change > color_b/255:
				Global.b_change -= 0.02
			$rendering/Pompa.modulate = Color(Global.r_change, Global.g_change, Global.b_change, 1)
		elif area.get_parent().dragType == 2:
			print ("DOSSS")
		#elif area.get_parent().dragType == 3: # 3 es cuando se quedan dentro los objetos
		area.get_parent()._onEnter()
	
	
	# Cambio de tamanyo.
	if Global.size_bubble_percent < actual_limit:
		Global.size_bubble_percent += 0.02;	
		var scale1 = burbuja_mesh.scale
		var scale2 = burbuja_collider.scale
		next_scale1 = scale1 + Vector3(1,1,1) * Global.size_bubble_percent
		next_scale2 = scale2 + Vector2(1,1) * Global.size_bubble_percent
	else:
		toend = true
		
