extends Node3D  # Attach this to the main scene (World)

@onready var timer = $Timer  # Reference to the Timer node
@onready var timer_label = $UI/TimerLabel  # Reference to the TimerLabel in UI
@onready var score_label = $UI/ScoreLabel  # Reference to the ScoreLabel in UI

var score = 0  # Keeps track of the score

func _ready():
	timer.start()  # Start the countdown timer

func _process(delta):
	timer_label.text = "Time: " + str(int(timer.time_left))  # Update timer UI

func add_score(value):
	score += value  # Increase score
	score_label.text = "Score: " + str(score)  # Update UI text
	check_win_condition()  # Check if player collected all coins

func _on_Timer_timeout():
	game_over()  # Call game over function when time runs out

func game_over():
	get_tree().change_scene_to_file("res://GameOver.tscn")  # Load Game Over scene

func check_win_condition():
	var coins_left = get_tree().get_nodes_in_group("coins").size()
	if coins_left == 0:
		get_tree().change_scene_to_file("res://WinScreen.tscn")  # Load Win screen
