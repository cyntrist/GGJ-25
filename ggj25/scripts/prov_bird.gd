extends RigidBody2D

signal prov_bird_touched # Para cuando tocas el pajaro se emita una senyal y la detete quien lo tenga.
@onready  var draggable = preload("res://scenes/draggable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("prov_bird_anim") # Empezar la animacion.
	pass

# Para cuando se toca el pajaro.
func _on_bird_down():
	prov_bird_touched.emit() # Emitir.
	var new_daggable = load("res://scenes/draggable.tscn").instantiate()
	new_daggable.name = str("Bird", 0)
	add_sibling(new_daggable)
	new_daggable.position = global_position
	$AnimationPlayer.stop() # Parar la animacion.
	queue_free() # Eliminarse a si mismo.
	pass
