extends StaticBody2D

var health = 3
var invincible = false
var time = 0

############
## BRICKS ##
############

func _physics_process(delta: float) -> void:
	if health == 0:
		queue_free()
	if invincible == true:
		time += delta
	if time >= 1:
		invincible = false
		time = 0
	$Label.text = str(health)
