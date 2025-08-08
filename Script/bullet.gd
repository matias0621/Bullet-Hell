class_name Bullet
extends Node2D

@export var speed = 50
var advance: bool = true
var increment_rotation = 0

func set_rotation_bullet(new_rotation:float):
	rotation_degrees = new_rotation

func _process(delta: float) -> void:
	if advance:
		#position += transform.x * speed * delta
		position += Vector2.RIGHT.rotated(rotation) * speed * delta
		rotation_degrees += increment_rotation
