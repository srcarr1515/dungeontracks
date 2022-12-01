extends Line2D


var point
var is_trailing = true
onready var timer = $Timer
var line_offset:= Vector2.ZERO

func start_trailing():
	timer.start()

func _physics_process(delta):
	if is_trailing:
		point = to_local(GameData.car.global_position + line_offset)
		add_point(point)
		if points.size() < 2:
			var blood_drop = load("res://scenes/actors/effects/BloodDrop.tscn").instance()
			add_child(blood_drop)
			blood_drop.position = point


func _on_Timer_timeout():
	is_trailing = false
