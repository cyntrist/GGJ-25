extends PathFollow2D

var speed = 0.05
var timer = 0
var interval = 400.0
var min_speed = 0.05/2
var max_speed = 0.25/2
var speed_factor = 0.0005/2
var subir = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# if (subir):
	# 	if (timer <= interval/2):
	# 		timer += 1
	# 		if (speed < max_speed):
	# 			speed += speed_factor * 2
	# 	else:
	# 		timer = 0
	# 		subir = false
	# else:
	# 	if (timer <= interval * 2):
	# 		timer += 1
	# 		if (speed > min_speed):
	# 			speed -= speed_factor 
	# 	else:
	# 		timer = 0
	# 		subir = true

	# speed = clamp(speed, min_speed, max_speed)
	progress_ratio  += delta * speed
	pass
