extends CharacterBody2D

var health = 100
var player_alive = true
var attack_in_progress = false
var enemy_inattack_range = false
var enemy_attack_cooldown = true

const speed = 100
var current_dir = "none"

func _ready():
	pass

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	
	if health <= 0:
		player_alive = false
		health = 0
		print("You have fallen...")
		self.queue_free() #change this to transition to an end screen
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -speed
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		#else statement states that the player is to stop in position when not being moved
		
	move_and_slide()
		
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	#left and right directional movement
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk-sideways")
		elif movement == 0:
			anim.play("idle-side")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("walk-sideways")
		elif movement == 0:
			anim.play("idle-side")
	#up and down directional movement
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk-up")
		elif movement == 0:
			anim.play("idle-back")
	if dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("walk-down")
		elif movement == 0:
			anim.play("idle-front")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true
	
func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 10
		enemy_attack_cooldown = false
		$attackCooldown.start()
		print("You have been hit, health is at ", health)
		
func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
