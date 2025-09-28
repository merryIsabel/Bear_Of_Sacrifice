extends Label

var full_text = "Come here, my little snowball. Mommy’s time 
is running out—not because of frozen fish or a 
bad cold, but because those colonial humans 
are coming, and they don’t care about polar 
bears or cozy forests. I won’t be around 
much longer. But before I go, I need you to 
do something important. Go find your Aunt 
Ursa. She’s hiding somewhere deep in the 
forest, probably knitting scarves for the 
squirrels or plotting how to outwit those 
humans. Find her. You’ll need her cleverness 
and stubbornness more than ever."
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
