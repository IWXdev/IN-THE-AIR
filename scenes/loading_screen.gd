extends Node2D

@onready var animation_player: AnimationPlayer = $"ColorRect/GettyImages-497707356-e722Dce/AnimationPlayer"





func _ready() -> void:
	animation_player.play("new_animation")
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_texture_button_2_pressed() -> void:
	get_tree().quit()
