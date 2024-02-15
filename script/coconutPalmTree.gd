extends Node2D

var state = "noCoconuts"
var player_in_area = false

var coconut = preload("res://scenes/coconut_item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if state == "noCoconuts":
		$growth_Timer.start()
		
func _process(delta):
	if state == "noCoconuts":
		$AnimatedSprite2D.play("noCoconuts")
	if state == "coconuts":
		$AnimatedSprite2D.play("coconuts")
		if player_in_area:
			if Input.is_action_just_pressed("interact"):
				state = "noCoconuts"
				dropCoconut()



func _on_interaction_area_body_entered(body):
	if body.has_method("player"):
		player_in_area = true


func _on_interaction_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false


func _on_growth_timer_timeout():
	if state == "noCoconuts":
		state = "coconuts"
		
func dropCoconut():
	var coconut_instance = coconut.instantiate()
	coconut_instance.global_position = $Marker2D.global_position
	get_parent().add_child(coconut_instance)
	
	await get_tree().create_timer(3).timeout
	$growth_Timer.start()
