extends CharacterBody2D

#Variables needed for spider enemy 
var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

func _physics_process(delta):
	# Add the gravity for spider.
	velocity.y += gravity * delta
	
	#Moves spider towards player if they are in the the area location
	if chase == true:
		
		#Follows player sprite pased on its direction vector with a constant speed of 50
		get_node("AnimatedSprite2D").play("walk")
		player = get_node("../../player/Player")
		var direction = (player.position - position).normalized()
		velocity.x = -50
		
		#Switches spider image to follow the direction based on player
		if player.position.x > position.x:
			get_node("AnimatedSprite2D").flip_h = false
			print("left")
			velocity.x = 50
		elif player.position.x < position.x:
			get_node("AnimatedSprite2D").flip_h = true
			print("right") 
			velocity.x = -50
			
		#if direction.x > 0:
		#	get_node("AnimatedSprite2D").flip_h = false
		#	print("right")
			
		#else:
		#	get_node("AnimatedSprite2D").flip_h = true
		#	print("left")
		#velocity.x = direction * SPEED
	
		#Plays spider idle animation when player is out of area radius
	else:
		get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()
	
	#Plays chase function if Player is inside of Spider area radius
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
		
		#Stops chase function when Player exits Spider area radius
func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false
