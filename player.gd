extends CharacterBody2D

@export var speed := 220
@export var jump_force := -420
@export var gravity := 900
@export var block_scene: PackedScene  # assign Block.tscn in Inspector

var has_placed_block := false

func _ready():
    has_placed_block = false
    if not is_in_group("player"):
        add_to_group("player")

func _physics_process(delta):
    # horizontal movement
    var dir := Input.get_axis("left", "right")
    velocity.x = dir * speed

    # gravity
    if not is_on_floor():
        velocity.y += gravity * delta
    else:
        velocity.y = 0

    # jump
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_force

    # move
    move_and_slide()

    # check if player fell off the map
    if global_position.y > 648:  # adjust based on your level height
        die()

func _input(event):
    if event.is_action_pressed("place_block") and not has_placed_block:
        place_block()

func place_block():
    if has_placed_block or not block_scene:
        return

    var block = block_scene.instantiate()
    var dir := 1
    if has_node("Sprite2D") and $Sprite2D.flip_h:
        dir = -1

    # place block slightly in front of player
    var offset := Vector2(247 * dir, 155)  # adjust distance
    block.global_position = global_position + offset

    get_tree().current_scene.add_child(block)
    has_placed_block = true
    print("Block placed!")

func reset_block_usage():
    has_placed_block = false

func die():
    has_placed_block = false
    get_tree().reload_current_scene()
