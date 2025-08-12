extends CharacterBody3D

@export var speed = 7.0
var is_dead = false
@export var gravity = -10
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D = %player

@onready var haelthbar_3d: ProgressBar = $SubViewport/haelthbar3d

@onready var damage_anim: AnimationPlayer = %"holder/damage anim"



var health = 5
var dead = false

func _ready():
	add_to_group("enemy")
	$holder/AnimationPlayer.play("mixamo_com")
	haelthbar_3d.value = health
	pass

	
func _physics_process(delta: float) -> void:
	velocity.y += gravity
	
	var der = to_local(navigation_agent_3d.get_next_path_position()).normalized()
	$holder.look_at(%player.position)
	velocity = der * speed
	$holder.rotation.x = 0 
	move_and_slide()
	
	if health == 0:
		dead = true
		queue_free()
	
	pass
	
func damage():
	health -= 1
	haelthbar_3d.value = health
	$"holder/damage anim".play("aaa3")
	
	
	
	
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
