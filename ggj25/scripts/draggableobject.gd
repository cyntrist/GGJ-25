extends Node2D

var is_selected = false # Para saber si esta seleccionado y moverlo.
var maxPercent = 1000
var elapsedPercent = 0
var dentro = false

@export var dragType : int 
@export var Ylimit : float
@export var draggersNodeBubble: Node2D
@export var draggersNode: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Mover el objeto.
	if is_selected:
		global_position = get_global_mouse_position()
	elif global_position.y < Ylimit && not dentro:
		if elapsedPercent <maxPercent:
			elapsedPercent += 10 * delta
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
	if dragType == 3:
		get_parent().remove_child(get_node("."))
		draggersNode.add_child(get_node("."))
		dentro = false
		global_position = get_global_mouse_position()
		print(get_parent().name)
	#print("Despulsado")

func _onEnter():
	#0 = deformable, 1 = pintable, 2 = sombrero, 3 meterse dentro
	if dragType == 3 && not dentro:
		dentro = true
		get_parent().remove_child(get_node("."))
		draggersNodeBubble.add_child(get_node("."))
		print("HOLE HOLE")
	pass

func _onExit():
	#0 = deformable, 1 = pintable, 2 = sombrero, 3 meterse dentro
	
	pass
