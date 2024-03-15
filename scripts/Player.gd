extends CharacterBody2D
var speed = 300
var up = Image.load_from_file("res://Images/Player02.png")
var tup = ImageTexture.create_from_image(up)
var down = Image.load_from_file("res://Images/Player03.png")
var td = ImageTexture.create_from_image(down)
var side = Image.load_from_file("res://Images/Player01.png")
var ts = ImageTexture.create_from_image(side)
func _ready():
	set_meta("health", 3)
	print(get_meta('health'))
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# print(input_dir)
	velocity = input_dir * speed
func _physics_process(delta):
	get_input()
	if( 0 < sign(velocity.x)):
		$PlaySprite.texture = ts
		$PlaySprite.set_flip_h(0)
		$PlaySprite/Sword.set_position( Vector2(36.5,6))
		$PlaySprite/Sword.set_rotation_degrees(90.0)
	elif(0 > sign(velocity.x)):
		$PlaySprite.texture = ts
		$PlaySprite.set_flip_h(1)
		$PlaySprite/Sword.set_position( Vector2(-36.5,6))
		$PlaySprite/Sword.set_rotation_degrees( (270.0))
	elif(0 > sign(velocity.y)):
		$PlaySprite.texture = tup
		$PlaySprite/Sword.set_position( Vector2(0,-32))
		$PlaySprite/Sword.set_rotation_degrees( (0.0))
		
		pass
	elif(0 < sign(velocity.y)):
		$PlaySprite.texture = td
		$PlaySprite/Sword.set_position( Vector2(0,40))
		$PlaySprite/Sword.set_rotation_degrees( (180.0))
		
		pass
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().change_scene_to_file("res://zones/MainMenu.tscn") # Currently enters the test scene
		pass
	if( int(get_meta('health')) == 0):
		set_visible(false)
		$HurtPlayer.set_disabled(true)
		$PlaySprite/Sword/Sprite2D/SwordBody/SwordCol.set_disabled(true)
	move_and_collide(velocity * delta)
	pass
