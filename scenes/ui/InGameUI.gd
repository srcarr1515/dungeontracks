extends Control
onready var gauge = $Gauge

func _ready():
	GameData.joystick = $Joystick

func set_health_gauge():
	var max_display_value = 28
	var percent_diff = float(GameData.car.hp)/float(GameData.car.max_hp)
	var cur_display_value = max_display_value * percent_diff
	gauge.get_node("HealthBar").value = cur_display_value

func set_speed_gauge():
	var max_display_value = 58
	var percent_diff = float(GameData.car.current_speed)/float(GameData.car.speed)
	var cur_display_value = min(max_display_value * percent_diff, max_display_value)
	gauge.get_node("SpeedBar").value = cur_display_value
	gauge.get_node("Speed").text = str(round(min((GameData.car.speed/4) * percent_diff, (GameData.car.speed/4))))
