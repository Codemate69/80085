extends ParallaxBackground


export (float) var scrolling_speed = 1550.0


func _process(delta): 
	if Input.is_action_pressed("ui_up"): 
		scroll_offset.y -= scrolling_speed * delta 
