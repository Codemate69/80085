extends KinematicBody2D
#start of movement physics
export var ACCELERATION = 5
export var MAX_SPEED = 100
export var ROTATION_ACCELERATION = 1
export var KNOCKBACK_POWER = 1
var input_vector = Vector2()
var current_velocity = Vector2.ZERO
var rotation_velocity = Vector2.ZERO
var knockback_velocity = Vector2.ZERO
#var velocity = Vector2.ZERO
var rotation_dir = 0
var current_rotation = 0

#Gets called every single tick/every single frame by default
func _physics_process(delta):
	
	_jetpack_move(delta)
	rotation += rotation_dir * ROTATION_ACCELERATION * delta
	
	if knockback_velocity != Vector2.ZERO:
		current_velocity = move_and_slide(knockback_velocity)
		knockback_velocity = Vector2.ZERO
		
	else:
		current_velocity = move_and_slide(current_velocity.limit_length(MAX_SPEED))
	
func _jetpack_move(delta):
	#rotation_dir = 0
	
	input_vector = Vector2()
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 0.05
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 0.05

	if Input.is_action_pressed("ui_up"):
		input_vector = Vector2(0, -ACCELERATION).rotated(rotation)
	current_velocity += input_vector
	
func _on_Hurtbox_area_entered(area):
	knockback_velocity = current_velocity * -KNOCKBACK_POWER
	


	
 
