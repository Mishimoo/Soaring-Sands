extends Control 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	@warning_ignore("standalone_expression")
	delta
	if(Input.is_action_just_pressed("LMB")):
		clinker()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://zones/test.tscn") # Currently enters the test scene
func _on_quit_pressed():
	get_tree().quit() # Closes the Game.
func clinker(): #Runs when LMB
	pass
