extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Game.next_level = 1
	Game.next_cinematic = 0

func _on_button_pressed():
	get_tree().quit()


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/cinematics/cinematic.tscn")


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/cinematics/credits.tscn")
