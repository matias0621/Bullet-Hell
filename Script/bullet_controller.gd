extends Node

var attack = true
@export var amount_bullet:int = 5
var rotate = 0
const BULLET = preload("res://Scene/bullet.tscn")


func _process(delta: float) -> void:
	rotate -= get_rotation_for_bullet()
	
	var bullet: Bullet = BULLET.instantiate()
	bullet.position = self.position
	bullet.set_rotation_bullet(rotate)
	get_tree().root.add_child(bullet)


func get_rotation_for_bullet() -> float:
	return 360 / amount_bullet
