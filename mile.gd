extends CharacterBody3D

@export var speed: float = 3.0  
@export var jump_force: float = 3.33
@export var gravity: float = 7.7  
var game_over = false
var is_jumping = false 


func _set_game_over(gameover):
	gameover=true
		
func _ready():
	add_to_group("player")
	if $CollisionShape3D == null:
		print("CollisionShape3D is missing!")
		return
	if $MeshInstance3D == null:
		print("MeshInstance3D is missing!")
		return
		

		
func _process(delta):
	
	if game_over:
		return
	
	var input = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		input.z -= 1
	if Input.is_action_pressed("move_backward"):
		input.z += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_right"):
		input.x += 1


	input = input.normalized()


	if Input.is_action_just_pressed("jump") and is_on_floor():  # Only jump if on the ground
		velocity.y = jump_force
		is_jumping = true


	velocity.y -= gravity * delta


	velocity.x = input.x * speed
	velocity.z = input.z * speed

	move_and_slide()


func stop_movement():
	game_over = true
