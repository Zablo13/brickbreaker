extends CharacterBody2D

var speed = 10
var dir = Vector2.ZERO
const MAXSPEED = 100
var single = false
##########
## BALL ##
##########


func _ready() -> void:
	velocity = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized() * speed


func _physics_process(delta: float) -> void:
	check_win()
	check_collision(delta)
	set_maxspeed()
	move_and_collide(velocity * speed * delta)


func check_collision(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		var collider = collision.get_collider()
		if collider.is_in_group("Brick"):
			if collider.invincible == false:
				collider.health -= 1
		if collider.is_in_group("Paddle"):
			var x = velocity.length_squared()
			var y = collider.velocity.length_squared()
			if x < y:
				velocity = collider.velocity
				if collider.player == 1:
					if single == true:
						position.y -= 15
					else:
						position.x += 15
					if single == true:	
						if velocity.y > 0:
							velocity.y *= -1
					else:
						if velocity.x < 0:
							velocity.x *= -1
						
				if collider.player == 2:	
					position.x += 15	
					if velocity.x > 0:
						velocity.x *= -1
			else:
				velocity = velocity.bounce(collision.get_normal()) * 1.1
		else:
			velocity = velocity.bounce(collision.get_normal()) * 0.9
		play_sound()


func check_win():
	
	if global_position.x > 1920: 
		$"..".over()
	if global_position.x < 0:
		$"..".over2()
	if global_position.y < 0: 
		$"..".over()
	if global_position.y > 1100:
		$"..".over2()
				

func set_maxspeed():
	if velocity.length_squared() > MAXSPEED:
		velocity = velocity.normalized() * MAXSPEED
		

func play_sound():
	
	var sounds = [
	$Sounds/S1,
	$Sounds/S2,
	$Sounds/S3,
	$Sounds/S4,
	$Sounds/S5,
	$Sounds/S6,
	$Sounds/S7,
	$Sounds/S8,
	$Sounds/S9,
	$Sounds/S10,
	$Sounds/S11,
	$Sounds/S12,
	$Sounds/S13,
	$Sounds/S14,
	$Sounds/S15,
	$Sounds/S16,
	$Sounds/S17,
	$Sounds/S18,
	$Sounds/S20,
	$Sounds/S19,
	$Sounds/S20,	
	$Sounds/S21,
	$Sounds/S22,
	$Sounds/S23,
	$Sounds/S24,
	$Sounds/S25,
	$Sounds/S26,
	$Sounds/S27,
	$Sounds/S28,
	$Sounds/S29,
	$Sounds/S30,
	$Sounds/S31,
	$Sounds/S32,
	$Sounds/S33,
	].pick_random()
	if !sounds.is_playing():
		sounds.play()
