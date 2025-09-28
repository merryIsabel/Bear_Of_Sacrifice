extends Area2D

signal level_complete

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("level_complete", Callable(self, "_on_goal_level_complete"))

func _on_body_entered(body):
	if body.is_in_group("player"):
		if body.has_method("reset_block_usage"):
			body.reset_block_usage()
		emit_signal("level_complete")

func _on_goal_level_complete():
	get_tree().change_scene_to_file("res://End.tscn")
