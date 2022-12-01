extends KinematicBody2D
var input_dir = Vector2.ZERO
var is_moving = false
var is_hitting = null
export var speed = 200
var current_speed = 0
export var speed_label = 120

export var friction = 0.05
#export var acceleration = 0.01
export var accel = 3
var velocity:=Vector2.ZERO

## Hurt Box will only collect the damage, we will determine dead state and if damage is dealt.
onready var hurtbox_shape = $HurtBox/Area/Shape
export var max_hp:= 5
var hp setget set_hp, get_hp

onready var hitbox_shape = $HitBox/Area/Shape

func _ready():
	yield(get_tree().get_root(), "ready")
	set_hp(max_hp)

func process_player_input():
	input_dir.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_dir.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

func _process(delta):
	if GameData.is_touchscreen:
		input_dir = GameData.joystick.get_node("Joystick_Button").get_value()
	else:
		process_player_input()
	
	if input_dir:
		input_dir = input_dir.normalized()
		if input_dir != Vector2.ZERO:
			hitbox_shape.disabled = false
			rotation = lerp_angle(rotation, input_dir.angle(), 0.1)
			current_speed += accel
#			velocity = lerp(velocity, input_dir * speed, 0.5)
			velocity = lerp(velocity, input_dir * min(current_speed, speed), 0.1)
		is_moving = true
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
		is_moving = false
		current_speed = lerp(current_speed, 0, 0.2)
		hitbox_shape.disabled = true
	velocity = move_and_slide(velocity)
	GameData.hud.set_speed_gauge()
		

func _on_HurtBox_took_damage(amount, from):
	var taking_damage = !is_moving || (is_moving && is_hitting != from)
	if taking_damage:
		GameData.car.hp -= amount
		print(hp)
		if hp < 1:
			hp = 0
			print('deadsies')

func set_hp(_hp):
	hp = _hp
	if GameData.hud:
		GameData.hud.set_health_gauge()

func get_hp():
	return hp

func _on_HitBox_on_hit(target, damage):
	is_hitting = target
