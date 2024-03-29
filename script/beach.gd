extends Node

func _ready():
	pass
	
func _process(delta):
	change_scene()

func _on_exit_area_body_entered(body):
	if body.has_method("player"):
		Global.transition_scene = true

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == 'beach':
			get_tree().change_scene_to_file("res://scenes/npc_village.tscn")
			Global.finish_transition()
