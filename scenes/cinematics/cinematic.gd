extends Node2D

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/cinematics/intro_seals.tscn")

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/cinematics/intro_seals.tscn")
