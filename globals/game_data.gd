extends Node

onready var graveyard = []
var player_data = {}
var player
var car
var state
var joystick
var camera
var is_touchscreen
var hud
var game

func _ready():
	 is_touchscreen = !["Android", "iOS", "HTML5"].has(OS.get_name())

func destroy(_target):
	graveyard.push_front(_target)
	_target.queue_free()

func is_destroyed(_target):
	var is_destroyed = graveyard.has(_target)
	return is_destroyed

func remove_grave(_target):
	if is_destroyed(_target):
		graveyard.erase(_target)

func purge_graveyard():
	graveyard = []
	

