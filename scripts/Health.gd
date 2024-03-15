extends Label
var tc
var heaper
# Called when the node enters the scene tree for the first time.
func _ready():
	heaper = get_parent().get_parent()
	if(heaper == null):
		pass
	else:
		heaper = heaper.get_meta('health')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	@warning_ignore("standalone_expression")
	delta
	while(heaper ==null):
		heaper = get_parent().get_parent()
		if(heaper == null):
			pass
		else:
			heaper = heaper.get_meta('health')
		print(tc + " Health.gd _process Null checker ")
		tc+=1
	text= "Health: " + str(get_parent().get_parent().get_meta('health'))
	if(Input.is_action_just_pressed("ui_select")):
		
		print(str(get_parent().get_parent().get_meta('health')) + "   Health.gd test")
