extends Node2D

onready var stacked_sprite = $StackedSprite
onready var car = $Car

func _process(delta):
	stacked_sprite.position = car.position
	stacked_sprite.set_rotation(car.velocity.angle() - deg2rad(90))
