extends ParallaxBackground

#Need to add the offset for every time w is pressed 
#Can also maybe replace sprites with obstacles
#like asteroids 

export (float) var scrolling_speed = 1550.0

func _process(delta): 
	scroll_offset.y += scrolling_speed * delta 

