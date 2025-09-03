extends Node2D

@export var player = preload("res://scenes/paddle.tscn")
@export var player2 = preload("res://scenes/paddle.tscn")
@export var brick = preload("res://scenes/brick.tscn")
@export var ball = preload("res://scenes/ball.tscn")

###########
## LEVEL ##
###########

func _ready() -> void:
	$Label.visible = false
	create_world()
	

func create_world():
	
	var o = player.instantiate()
	add_child(o)
	o.position = Vector2(150,540)
	
	var v = player2.instantiate()
	add_child(v)
	v.player = 2
	v.position = Vector2(1770,540)
	print(v.dict_control)

	var brick_position = Vector2(15,108)
	var brick_position2 = Vector2(1905,108)
	
	for x in range(1,6):
		var b = brick.instantiate()
		add_child(b)
		b.position = brick_position
		brick_position += Vector2(0,216)
		
	for x in range(1,6):
		var b2 = brick.instantiate()
		add_child(b2)
		b2.position = brick_position2
		brick_position2 += Vector2(0,216)	
	
	var x = ball.instantiate()
	add_child(x)
	x.position = Vector2(960,540)


func over():
	$Label.visible = true
	await get_tree().create_timer(5.0).timeout
	$"..".show_menu()
	queue_free()
	
func over2():
	$Label.visible = true
	$Label.text = "Player2 wins!"
	await get_tree().create_timer(5.0).timeout
	$"..".show_menu()
	queue_free()
