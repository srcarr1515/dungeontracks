extends CPUParticles2D

func _ready():
	pass

func _on_Timer_timeout():
	set_process(false)
	set_physics_process(false)
	set_process_input(false)
	set_process_internal(false)
	set_process_unhandled_input(false)
	set_process_unhandled_key_input(false)


func _on_Area2D_body_entered(body):
	pass



func _on_Area2D_area_entered(area):
	if area.name == "Rear":
		var trail_left = load("res://scenes/actors/effects/Trail.tscn").instance()
		var trail_right = load("res://scenes/actors/effects/Trail.tscn").instance()
		add_child(trail_left)
		add_child(trail_right)
		trail_left.line_offset = Vector2(16, 16)
		trail_left.line_offset = Vector2(-16, -16)
		trail_left.position = position
		trail_right.position = position
		trail_left.rotation = rotation
		trail_right.rotation = rotation
