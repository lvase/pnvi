extends Area3D

@export var value: int = 10 
@export var rotation_speed: float = 120.0  
@onready var coin_sound = $coin_sound

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
func _on_body_entered(body):
	if body.is_in_group("player"):  # Check if the player touches the coin
		print("Player collected the coin!")  # Debugging
		var game_manager = get_tree().get_first_node_in_group("game_manager")
		if game_manager:
			game_manager.add_score(value)  # Increase score
			game_manager.coin_sound.play()  # Play sound from GameManager
		queue_free()  # Remove coin
func _process(delta):
	rotate_y(deg_to_rad(rotation_speed * delta)) 
