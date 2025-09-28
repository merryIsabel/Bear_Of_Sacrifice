extends Area2D

signal level_complete

func _on_body_entered(body):
	if body.is_in_group("player"):
		# Reset block usage for next level
		if body.has_method("reset_block_usage"):
			body.reset_block_usage()

		next_level()


func next_level():
	var scene_path = get_tree().current_scene.get_scene_file_path()
	match scene_path:
		"res://Main.tscn":
			get_tree().change_scene_to_file("res://Level2.tscn")
		"res://Level2.tscn":
			get_tree().change_scene_to_file("res://level 2,5.tscn")
		"res://level 2,5.tscn":
			get_tree().change_scene_to_file("res://level_3.tscn")
