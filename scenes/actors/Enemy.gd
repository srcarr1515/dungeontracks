extends KinematicBody2D

export var speed = 200
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite
onready var hitbox_shape = $HitBox/Area/Shape
onready var drop_target_timer = $DropTarget
var motion = Vector2.ZERO
var player = null

func _physics_process(delta):
	motion = Vector2.ZERO
	if player:
		motion = global_position.direction_to(player.global_position) * speed
		if player.global_position.distance_to(global_position) > 5:
			motion = move_and_slide(motion)

func _on_Area2D_body_entered(body):
	player = body

func _on_Area2D_body_exited(body):
	drop_target_timer.start()

func _on_HurtBox_is_dead():
	set_physics_process(false)
	sprite.visible = false
	yield(get_tree().create_timer(0.1), "timeout")
	var blood = load("res://scenes/actors/effects/Blood.tscn").instance()
	blood.rotation = global_position.angle_to_point(GameData.car.global_position)
	add_child(blood)
	blood.global_position = global_position

func _on_HurtBox_took_damage(amount, from):
	hitbox_shape.call_deferred("set_disabled", true)

func _on_DropTarget_timeout():
	player = null
