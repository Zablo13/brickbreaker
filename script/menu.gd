extends CanvasLayer

##########
## MENU ##
##########


func _on_button_2_pressed() -> void:
	get_parent().get_tree().quit()


func _on_button_pressed() -> void:
	$"..".start()
	queue_free()


func _on_button_3_pressed() -> void:
	$"..".solo()
	queue_free()
