extends Node3D

var end_game = false

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("next"):
		get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	
	
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/hause.tscn")
	pass 
