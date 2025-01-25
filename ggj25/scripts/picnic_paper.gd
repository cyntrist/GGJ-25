extends Node2D

var can_paint = false # Para saber si se puede pintar.
var act_paint = 0 # Cantidad de pintura que llevas.

@export var max_paint = 500 # Gotas de pintura que se puede pintar de maximo para no petar.
@export var color: Color # Color con el que pintas.

# Called when the node enters the scene tree for the first time.
func _ready():
	color = Color(94, 91, 28, 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_paint:
		_paint()
	pass
# Evidentemente pinta.
func _paint():
	# Pintas si puedes pintar.
	print("Pinta y colorea.")
	#if act_paint < max_paint:
		#draw_circle(get_local_mouse_position(), 20, color)
		#act_paint += 1	
	$Line2D.add_point(get_global_mouse_position())
	pass


# Cuando entra el raton se puede pintar.
func _enablePaint():
	print("Puedes pintar")
	can_paint = true
	pass

# Cuando sale el raton no se puede pintar.
func _disablePaint():
	print("No puedes pintar")
	can_paint = false
	pass
