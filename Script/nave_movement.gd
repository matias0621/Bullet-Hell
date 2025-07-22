extends CharacterBody2D

@export var speed: float = 50

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left","right","up", "down")
	
	velocity = direction * speed
	move_and_slide()
