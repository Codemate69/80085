extends Node

export (PackedScene) var sky #placeholder for Bella's scroll world 
var velocity 

func new_game():
	get_tree().
	$Timer.start() 
func ready(): 
	pass 
	
func game_over():
	$Timer.stop() 
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
