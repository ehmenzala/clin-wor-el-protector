extends Node2D

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://scenes/levels/NIVEL FOCA/NIVELFOCA1.tscn")
