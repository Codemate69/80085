extends Node2D

const width = 1500
const height = 900
const Ast = preload("res://asteroid.tscn")
var spawn_area= Rect2()

# asteroid spawn time management 
var delta = 2
var offset = 0.5

func _ready():
	randomize()
	spawn_area= Rect2(0,0,width, height)
	set_next_spawn()

func spawn_fasteroid():
	var position = Vector2(randi()%width, randi()%height)

	var asteroid = Ast.instance()
	asteroid.position = position 
	$"..".add_child(asteroid)


	return position

func set_next_spawn():
	#generating a random spawn time
	var next_time = delta + (randf()-0.5)*2*offset 
	$Timer.wait_time = next_time
	$Timer.start()

func _on_Timer_timeout():
	spawn_fasteroid()
	set_next_spawn()

	pass # Replace with function body.




#func _draw():
#    var radius= 20
#    draw_rect(spawn_area, Color(0.2,0.2,1.0,0.5))
#    for i in range(25):
#        draw_circle(spawn_asteroid(), radius, Color.red)
