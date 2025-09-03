extends Node2D

@export var menu = preload("res://scenes/menu.tscn")
@export var game = preload("res://scenes/level.tscn")
@export var single = preload("res://scenes/singleplayer.tscn")

##########
## MAIN ##
##########

func _ready() -> void:
	show_menu()


func start():
	await get_tree().create_timer(1.0).timeout
	var l = game.instantiate()
	add_child(l)
	

func solo():
	await get_tree().create_timer(1.0).timeout
	var s = single.instantiate()
	add_child(s)


func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		$".".quit()


func show_menu():
	var m = menu.instantiate()
	add_child(m)
