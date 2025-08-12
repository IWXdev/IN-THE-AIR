extends CharacterBody3D


@export var speed = 7
var is_dead = false
@export var gravity = -10
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = %player

signal zombe_killed

func _ready() -> void:
	add_to_group("enemy")
	$BlockyZombie/AnimationPlayer.play("mixamo_com")
	pass
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity
	
	var der = to_local(navigation_agent_3d.get_next_path_position()).normalized()
	$BlockyZombie.look_at(%player.position)
	
	velocity = der * speed
	$BlockyZombie.rotation.x = 0 
	move_and_slide()
	pass

	
	
func make_path():
	navigation_agent_3d.target_position = player.global_position
	pass

func _on_timer_timeout() -> void:
	make_path()
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		body.damage()
	pass # Replace with function body.
