extends Node2D

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://scenes/cinematics/intro_renny.tscn")
