extends Area2D


const SPEED = 250.0
var heaper
var health_me
var HEALTH_MAX = 6
func _ready():
	health_me = HEALTH_MAX
	heaper = get_node('../Player')
	if(heaper == null):
		pass
	else:
		heaper = heaper.get_meta('health')
	pass
func _process(delta):
	@warning_ignore("standalone_expression")
	delta
	$Sprite2D/TotalHealthMe/ColorRect.size = Vector2( float(health_me)/float(HEALTH_MAX) * 260, 40)
	print(str(float(health_me)/float(HEALTH_MAX)) + "  Sword Testing Kill guy")
	if(health_me == 0):
		set_monitoring(0)
		print("I DIEIDIED " + str(is_monitoring()))
		set_visible(false)
		$CollisionShape2D.set_disabled(true)
	pass
func _on_body_entered(body):
	print(str(body) + "   Body Check ")
	if( body.name == ('Player') && is_monitoring()):
		heaper = get_node('../Player')	
		if(heaper == null):
			pass
		else:
			heaper = heaper.get_meta('health')
			get_node('../Player').set_meta('health', int(heaper) - 1)
			print(str((heaper-1)) + "  Melee Check")				
	elif(body.name == ('SwordBody') && is_monitoring()):
		health_me-=1
		
	pass # Replace with function body.





