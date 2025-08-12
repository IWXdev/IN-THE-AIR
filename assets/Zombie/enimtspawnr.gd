extends Node3D

@onready var spawntimer: Timer = $spawntimer

const ZOMBE = preload("res://assets/Zombie/zombe.tscn")



func _on_spawntimer_timeout() -> void:
	var newEnemy = ZOMBE.instantiate()
	get_parent().add_child(newEnemy)
	
	newEnemy.navigation_agent_3d.target_position = global_position
