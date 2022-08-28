extends Node2D


func _ready():
	$GameTimer.start() 


func _on_GameTimer_timeout():
	get_tree().change_scene("res://Main/NewGameScene.tscn")
