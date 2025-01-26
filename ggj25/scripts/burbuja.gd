extends Node2D

var burbuja_mesh = self
@export var base_size_collider: float = 0.1
@export var nextScene: int

@export var color_r = 94 # Color que tiene que llegar en R.
@export var color_g = 91 # Color que tiene que llegar en G.
@export var color_b = 28 # Color que tiene que llegar en B.

var ini_scale = Vector2(1,1) * base_size_collider

const SCALE_STEP = 3;
var actual_limit


#variables para tiempo de espera 
var toend = false
var elapsedtime = 0
var maxtime = 3;

func _ready() -> void: 
	burbuja_mesh.scale = Vector2(1,1)* ((Global.max_bubble_size / 4) * Global.nivel_actual)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if toend:
		if elapsedtime < maxtime:
			elapsedtime += delta
			#print(elapsedtime)
		else:
			Global.change_scene(nextScene)
			#print("zzumo")
	else:
		var new_scale =  Vector2(1,1) * (Global.actual_size + (Global.max_bubble_size / 4) * Global.nivel_actual)
		
		burbuja_mesh.scale = burbuja_mesh.scale.lerp(new_scale, delta * SCALE_STEP)


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
			$Pompa.modulate = Color(Global.r_change, Global.g_change, Global.b_change, 1)
		elif area.get_parent().dragType == 2:
			print ("DOSSS")
		#elif area.get_parent().dragType == 3: # 3 es cuando se quedan dentro los objetos
		area.get_parent()._onEnter()
	
	print(Global.actual_size)
	print(((Global.max_bubble_size / 4) * Global.nivel_actual))
	print(burbuja_mesh.scale)
	# Cambio de tamanyo.
	if  Global.actual_size < ((Global.max_bubble_size / 4) * Global.nivel_actual) and not toend:
		Global.actual_size += 0.05
	elif not toend:
		toend = true
		Global.nivel_actual += 1
