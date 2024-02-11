extends CharacterBody2D

var speed = 100

var playerState #variable for which sprite to use

#movement function
func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down") #variable that takes in keyboard input
	
	# idle state
	if direction.x == 0 and direction.y == 0:
		playerState = "Idle"
	else:
		playerState = "walking"

	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction, playerState)
	
func play_anim(dir, state):
	if state == "Idle":
		$AnimatedSprite2D.play("Idle")
		
	if state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("N-walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("E-walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("W-walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("S-walk")

		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("NE-walk")
		if dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("SE-walk")
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("SW-walk")
		if dir.x < -05 and dir.y < -0.5:
			$AnimatedSprite2D.play("NW-walk")
	
func player():
	pass
