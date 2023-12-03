extends Node2D

var menu_path = "res://scenes/menu/menu.tscn"

func _on_area_2d_body_entered(body):
	if body.name == "Clin Wor":
		var total_levels = len(Game.levels_paths)
		#  Preguntamos si todavía no estamos en el nivel final
		if Game.next_level < total_levels:
			var next_level_path = Game.levels_paths[Game.next_level]
			get_tree().change_scene_to_file(next_level_path)
			Game.next_level += 1
		else:
			get_tree().change_scene_to_file(menu_path)
			Game.next_level = 1  # Resetea el conteo de niveles
