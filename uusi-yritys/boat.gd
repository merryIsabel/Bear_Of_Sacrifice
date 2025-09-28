extends Node2D

func _ready():
	await get_tree().create_timer(3.5).timeout   
	change_level()

func change_level():
	get_tree().change_scene_to_file("res://colonialism.tscn")
