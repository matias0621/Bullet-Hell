extends Node

var attack = true
var amount_bullet:int = 3
var rotate = 0
const BULLET = preload("res://Scene/bullet.tscn")
var time = 0.0
@export var time_wait = 2
@export var test = 0


func _process(delta: float) -> void:
	time += delta
	if time >= time_wait:
		diagonal_parttern()
		time = 0

func diagonal_parttern()-> void:
	var list_bullet:Array[Bullet] = []
	for i in range(0, amount_bullet):
		var bullet:Bullet = BULLET.instantiate()
		bullet.advance = false
		bullet.set_rotation_bullet(rotate)
		bullet.position = self.position
		bullet.increment_rotation = 0.5
		get_tree().root.add_child(bullet)
		list_bullet.append(bullet)
		rotate += get_rotation_for_bullet()
		if rotate > 180 and amount_bullet != 1: rotate *= -1
	
	for i in range(0, list_bullet.size()):
		list_bullet[i].advance = true

func line_parttern()-> void:
	var list_bullet:Array[Bullet] = []
	for i in range(0, amount_bullet):
		print(i)
		var bullet:Bullet = BULLET.instantiate()
		bullet.advance = false
		bullet.set_rotation_bullet(rotate)
		bullet.position = self.position
		get_tree().root.add_child(bullet)
		list_bullet.append(bullet)
		rotate += get_rotation_for_bullet()
		if rotate > 180 and amount_bullet != 1: rotate *= -1
	
	for i in range(0, list_bullet.size()):
		list_bullet[i].advance = true
	reset_rotate_variable()

func get_rotation_for_bullet() -> float:
	return 360 / amount_bullet

func reset_rotate_variable(rote:float = 0) -> void:
	rotate = rote
	
#region
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
		get_tree().root.add_child(create_bullet()) 
		time = 0.0

func double_spiral_pattern(delta:float) -> void:
	time += delta
	var save_rotation:float
	if time > time_wait:
		rotate += get_rotation_for_bullet()
		save_rotation = rotate
		var bullet1:Bullet = create_bullet()
		bullet1.advance = false
		rotate = 180 + save_rotation
		var bullet2:Bullet = create_bullet()
		bullet2.advance = false
		rotate = save_rotation - 180
		time = 0
		bullet1.advance = true
		bullet2.advance = true
		get_tree().root.add_child(bullet1)
		get_tree().root.add_child(bullet2)

func create_bullet() -> Bullet:
	var bullet: Bullet = BULLET.instantiate()
	bullet.position = self.position
	bullet.set_rotation_bullet(rotate)
	return bullet
#endregion
