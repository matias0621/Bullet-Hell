extends Node

var attack = true
@export var amount_bullet:int = 10
var rotate = 0
const BULLET = preload("res://Scene/bullet.tscn")
var time = 0.0
@export var time_wait = 0.1
@export var test = 0


func _process(delta: float) -> void:
	if test == 0:
		double_spiral_pattern(delta)
	elif test == 1:
		spiral_pattern(delta)

func circle_pattern(delta:float) -> void:
	time += delta
	if time > time_wait:
		var list_bullet:Array[Bullet] = []
		for i in range(0, amount_bullet):
			var bullet:Bullet = BULLET.instantiate()
			bullet.position = self.position
			bullet.advance = false
			rotate += get_rotation_for_bullet()
			bullet.set_rotation_bullet(rotate)
			list_bullet.append(bullet)
		
		for i in range(0, list_bullet.size()):
			list_bullet[i].advance = true
			get_tree().root.add_child(list_bullet[i])
		time = 0

func spiral_pattern(delta:float) -> void:
	time += delta
	if time > time_wait:
		rotate += get_rotation_for_bullet()
		create_bullet()
		time = 0.0

func double_spiral_pattern(delta:float) -> void:
	time += delta
	var save_rotation:float
	if time > time_wait:
		rotate += get_rotation_for_bullet()
		save_rotation = rotate
		create_bullet()
		rotate = 180 + save_rotation
		create_bullet()
		rotate = save_rotation - 180
		time = 0

func create_bullet() -> void:
	var bullet: Bullet = BULLET.instantiate()
	bullet.position = self.position
	bullet.set_rotation_bullet(rotate)
	get_tree().root.add_child(bullet)

func get_rotation_for_bullet() -> float:
	return 360 / amount_bullet
