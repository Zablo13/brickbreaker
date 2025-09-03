extends CharacterBody2D

@export var move_left1 = Input.is_action_pressed("move_left1")
var speed = 1250
var friction = 1.0
var acceleration = 0.25
var player = 1
var dict_control = {}
var pushing = false

############
## PADDLE ##
############

	
func _physics_process(_delta: float) -> void:
	
	controls()
	move()
	rotate_paddle()
	tare()
	move_and_slide()


func move():

	var dir = Input.get_vector(dict_control["move_left"], dict_control["move_right"],dict_control["move_up"], dict_control["move_down"]) #Achse aus links rechts bestimmen
	if dir != Vector2.ZERO: #Bei Richtungseingabe Bewegung ausrechnen
		velocity = lerp(velocity, dir * speed , acceleration)
	elif pushing == true:
		pass
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction) #Ohne Eingabe nachrutschen durch Reibung


func rotate_paddle():

	if Input.is_action_pressed(dict_control["rotate_left"]):
		rotation -= 0.1
	if Input.is_action_pressed(dict_control["rotate_right"]):
		rotation += 0.1


func tare():
	
	if Input.is_action_pressed(str(dict_control["tare"])):
		rotation = 0.0

		
func controls():
	
	if player == 1:
		dict_control = {
		"tare" : "tare1", 
		"move_left": "move_left1",
		"move_up" : "move_up1",
		"move_down" : "move_down1",
		"move_right"	 : "move_right1",
		"rotate_left" : "rotate_left1",
		"rotate_right" : "rotate_right1",
			}
			
	if player == 2:
		dict_control = {
		"tare" : "tare2", 
		"move_left": "move_left2",
		"move_up" : "move_up2",
		"move_down" : "move_down2",
		"move_right"	 : "move_right2",
		"rotate_left" : "rotate_left2",
		"rotate_right" : "rotate_right2",
			}
