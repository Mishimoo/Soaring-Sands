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
	print(str(get_parent()) )#.set_meta('health', 4)
	
	get_tree().change_scene_to_file("res://zones/game_level-1.tscn") # Currently enters the test scene
	
func _on_options_pressed():
	get_node('Player').set_meta('health', 4)
	get_tree().change_scene_to_file("res://zones/test.tscn")
	pass # Replace with function body.

func _on_quit_pressed():
	get_tree().quit() # Closes the Game.
func clinker(): #Runs when LMB
	pass

