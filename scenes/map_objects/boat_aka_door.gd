extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "Clin Wor":
		
		var total_cinematics = len(Game.cinematics_paths)
		print("Total cinematics: " + str(total_cinematics))
		
		#  Preguntamos si todavía no estamos en el nivel final
		if Game.next_cinematic < total_cinematics:
			print("Current index: " + str(Game.next_cinematic))
			var next_cinematic_path = Game.cinematics_paths[Game.next_cinematic]
			print("Next Cinematic Path: " + str(Game.next_cinematic))
			get_tree().change_scene_to_file(next_cinematic_path)
			
			Game.next_cinematic += 1
