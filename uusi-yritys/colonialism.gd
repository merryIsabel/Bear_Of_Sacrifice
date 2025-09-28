extends Label
var full_text = "We shall collect every 
pelt on this island! 
Kill everyone that 
can be of use!"
var char_index = 0
var typing_speed = 0.05  # seconds between characters

func _ready():
	text = ""  # Start empty
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
