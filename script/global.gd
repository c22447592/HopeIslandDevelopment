extends Node

var current_scene = 'beach' #initialise variable to spawn beach
var transition_scene = false #initialise transition state

#initialise player position
var player_exit_position_x = 0
var player_exit_position_y = 0
var player_start_position_x = 0
var player_start_position_y = 0

func finish_transition():
	if transition_scene == true:
		transition_scene == false
		if current_scene == "beach":
			current_scene = "npc_village"
		else:
			current_scene = "beach"
