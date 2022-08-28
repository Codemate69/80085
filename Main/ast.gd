extends KinematicBody2D

const speed = 100

var velocity = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var to_player = ($"../player".position - position).normalized()
	velocity = to_player*speed 
	move_and_collide(velocity*delta)
	

func kill_enemy():
	queue_free() 
	
func _on_Area2D_body_entered(body):
	if "player" in body.name :
		kill_enemy() 
		
