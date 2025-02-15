#extends Timer
#
#@onready var label = $"../UI/TimerLabel"  # Finds the label in the UI layer
#
#func _process(delta):
	#label.text = "Time: " + str(int(time_left))  # Update UI text
#
#func _on_timeout():
	#get_tree().change_scene_to_file("res://GameOver.tscn")  # Game over when time runs out
