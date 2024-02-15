extends StaticBody2D



func _ready():
	fallingCoconut()
	
	
func fallingCoconut():
	$AnimationPlayer.play("fallingCoconut")
	await get_tree().create_timer(1.5).timeout
	$AnimationPlayer.play("fade")
	print("+1 coconuts")
	await get_tree().create_timer(0.3).timeout
	queue_free()
	
