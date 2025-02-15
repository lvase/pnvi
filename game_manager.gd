extends Node3D

@onready var timer = $Timer
@onready var timer_label = $UI/TimerLabel
@onready var win_label = $UI/WinLabel
@onready var lose_label = $UI/LoseLabel
@onready var coin_sound = $CoinSound
@onready var restart_label = $UI/RestartLabel
var time_left = 45  
var game_over_flag
var score = 0  
@onready var score_label = $UI/ScoreLabel 

func add_score(points: int):
	score += points
	score_label.text = "Скор: " + str(score)  

	if score == 200:
		win_game()

func win_game():
	win_label.text = "ПОБЕДИВТЕ!!!"
	win_label.show()
	restart_label.show()
	game_over_flag = true
	$mile.stop_movement()
	timer.stop()

func lose_game():
	print("Game Lost!")  
	lose_label.text = "ИЗГУБИВТЕ, ОБИДЕТЕ СЕ ПОВТОРНО!"
	lose_label.show()
#	get_tree().paused = true  
	print("Game Paused (Lose)")
	restart_label.show()
	game_over_flag = true
	timer.stop()
	$mile.stop_movement()
	
func game_over():
	lose_game()

func _ready():
	win_label.hide()
	lose_label.hide()
	restart_label.hide()
	timer.wait_time = 1
	timer.one_shot = false
	timer.start()
	
	
func _on_timer_timeout():
	time_left -= 1
	timer_label.text = "Време: " + str(time_left)

	if time_left <= 0:
		game_over()


func _process(delta):
	if game_over: 
		if Input.is_action_just_pressed("restart"):
			print("R Key Pressed! Restarting...")  
			get_tree().reload_current_scene() 
			print("Scene Reload Attempted!")  
			timer_label.text = "Време: 0"	
