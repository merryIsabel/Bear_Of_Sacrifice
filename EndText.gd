extends Label

var full_text = "The End :)

Creators: 
Isabel Meriläinen 
Paula Jantunen
Sofia Suorsa"
var char_index = 0
var typing_speed = 0.04  # seconds between characters

func _ready():
	await get_tree().create_timer(1.5).timeout
	start_typing()

func start_typing():
	char_index = 0
	text = ""
	type_letter()

func type_letter():
	if char_index < full_text.length():
		text += full_text[char_index]
		char_index += 1
		await get_tree().create_timer(typing_speed).timeout
		type_letter()
