class_name Bullet
extends Node2D

@export var speed = 50


func set_rotation_bullet(new_rotation:float):
	rotation_degrees = new_rotation

func _process(delta: float) -> void:
	position += transform.x * speed * delta
