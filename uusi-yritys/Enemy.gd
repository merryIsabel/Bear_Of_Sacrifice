extends Area2D

@export var speed: int = 100
@export var patrol_distance: int = 84

var start_position: Vector2
var direction: int = 1

func _ready():
	start_position = global_position
	
func _physics_process(delta):
	var velocity_x = direction * speed
	global_position.x += velocity_x * delta
	
	if abs(global_position.x - start_position.x) > patrol_distance:
		direction *= -1
		$Sprite2D.flip_h = direction < 0

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.die()
