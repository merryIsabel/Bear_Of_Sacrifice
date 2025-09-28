extends AnimatedSprite2D

func _ready():
	await get_tree().create_timer(1.0).timeout   
	change_level()

func change_level():
	get_tree().change_scene_to_file("res://hug_animation.tscn")
