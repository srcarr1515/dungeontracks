#ASTEROIDS TYPE MOVEMENT
#var speed = 400
#export var ACCELERATION:= 0.1
#export var FRICTION:= 0.05
#var rotation_speed = 1.5
#
#var velocity = Vector2.ZERO
#var rotation_dir = 0
#
#func get_input():
#	rotation_dir = 0
#	velocity = Vector2.ZERO
#	if Input.is_action_pressed("ui_right"):
#		rotation_dir += 1
#	if Input.is_action_pressed("ui_left"):
#		rotation_dir -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity -= transform.x * speed
#	if Input.is_action_pressed("ui_up"):
#		velocity += transform.x * speed
#
#func _physics_process(delta):
#	get_input()
#	rotation += rotation_dir * rotation_speed * delta
#	velocity = move_and_slide(velocity)

## FOLLOW THE LEADER
#var leader
#var target
#var speed = 600
#var velocity = Vector2.ZERO
#var rotation_speed = PI*2
#export (String, "drive", "reverse") var gear = "drive"
#onready var timer = $Timer
#var distance_travelled = 0
#
#
#func _ready():
#	leader = get_tree().get_nodes_in_group("players")[0]
#	GameData.car = self
#
#func _input(event):
#	if leader:
#		target = leader.target.global_position
#
#
#func rotate_toward(delta, _target):
#	var v = _target - global_position
#	var angle = v.angle()
#	var r = global_rotation
#	var angle_delta = rotation_speed * delta
#	angle = lerp_angle(r, angle, 1.0)
#	angle = clamp(angle, r - angle_delta, r + angle_delta)
#	global_rotation = angle
#
#func _physics_process(delta):
#	if leader && target:
#		var dir_multiplier = 1
#		if gear == "reverse":
#			dir_multiplier = -1
#		## Smooth Rotation Toward
#		rotate_toward(delta, target)
#		##
#		velocity = (transform.x * speed) * dir_multiplier
#		# stop moving if we get close to the target
#		var distance = global_position.distance_to(target)
#		if abs(rotation) > 0 && abs(rotation) < 3.5 && gear == "drive":
#
#			if timer.is_stopped():
#				timer.start()
#		if gear == "reverse":
#			if distance > 120:
#				gear = "drive"
#
#		if distance > 16:
#			distance_travelled += 1
#			velocity = move_and_slide(velocity)
#		else:
#			distance_travelled = 0
#
#func _on_Timer_timeout():
#	if distance_travelled > 0:
#		gear = "reverse"
#
#func on_tap(tap_type, tap_position):
#	print("Car Tap")

