extends Node2D

@export var player = preload("res://scenes/paddle.tscn")
@export var brick = preload("res://scenes/q_brick.tscn")
@export var ball = preload("res://scenes/ball.tscn")

############
## SINGLE ##
############

func _ready() -> void:
	$Label.visible = false
	create_world()
	

func create_world():
	
	var o = player.instantiate()
	add_child(o)
	o.position = Vector2(960,640)


	var brick_position = Vector2(48,15)
	
	for x in range(1,21):
		var b = brick.instantiate()
		add_child(b)
		b.position = brick_position
		brick_position += Vector2(96,0)
	brick_position = Vector2(48,45)
	for x in range(1,21):
		var b = brick.instantiate()
		add_child(b)
		b.position = brick_position
		brick_position += Vector2(96,0)
	brick_position = Vector2(48,75)
	for x in range(1,21):
		var b = brick.instantiate()
		add_child(b)
		b.position = brick_position
		brick_position += Vector2(96,0)	
	brick_position = Vector2(48,1000)
	for x in range(1,21):
		var b = brick.instantiate()
		add_child(b)
		b.position = brick_position
		brick_position += Vector2(96,0)	

	
	var x = ball.instantiate()
	add_child(x)
	x.position = Vector2(960,540)
	x.single = true
	

func over():
	$Label.visible = true
	await get_tree().create_timer(5.0).timeout
	$"..".show_menu()
	queue_free()
	
	
func over2():
	$Label.visible = true
	$Label.text = "you lose"
	await get_tree().create_timer(5.0).timeout
	$"..".show_menu()
	queue_free()
