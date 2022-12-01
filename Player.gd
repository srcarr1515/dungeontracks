extends KinematicBody2D

var speed = 600 # speed in pixels/sec
var velocity = Vector2.ZERO
onready var target = $Pivot/Position2D
onready var pivot = $Pivot

func _ready():
	GameData.player = self

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	if velocity != Vector2.ZERO:
		rotation = velocity.angle()

func _physics_process(delta):
#	get_input()
	velocity = move_and_slide(velocity)
