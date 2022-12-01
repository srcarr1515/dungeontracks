extends Node2D

onready var stage = $Stage
onready var ui = $MainCamera/UI

func _ready():
	GameData.game = self
	GameData.car = $Stage/Player/Car
	GameData.player = $Stage/Player
	GameData.camera = $MainCamera
	GameData.hud = $MainCamera/UI/InGame

func on_tap(tap_type, tap_position):
	pass
