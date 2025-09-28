extends Node2D

func _on_StartButton_pressed() -> void:
	get_tree().change_scene_to_file("res://animated_sprite_2d.tscn")
