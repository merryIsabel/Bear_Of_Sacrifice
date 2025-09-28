extends Node2D

func _on_StartButton_pressed() -> void:
	get_tree().change_scene_to_file("res://hug_animation.tscn")
