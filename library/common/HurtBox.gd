extends Node2D

onready var this = get_parent()

export (int) var max_hp = 10
onready var hp = max_hp
var is_dead:= false

signal took_damage(amount, from)
signal is_dead

func get_hurt(amount, from):
	hp -= amount
	emit_signal("took_damage", amount, from)
	if hp < 1 && !is_dead:
		hp = 0
		is_dead = true
		emit_signal("is_dead")
	return hp



