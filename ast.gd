extends KinematicBody2D

const speed = 100

var velocity = Vector2()

func _ready():
	$Timer.start()

func _physics_process(delta):
	var to_player = ($"../Player".position - position).normalized()
	velocity = to_player*speed 
	move_and_collide(velocity*delta)



func kill_enemy():
	queue_free() 
	
	
func _on_Area2D_body_entered(body):
	if "Player" in body.name :
		kill_enemy() 
		
func _on_Timer_timeout():
	queue_free()
