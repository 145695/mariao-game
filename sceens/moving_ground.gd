extends AnimatableBody2D

@export var speed: float = 100.0

@onready var ray: RayCast2D = $WallDetector

var direction: int = 1  # 1 = right, -1 = left

func _physics_process(delta):
	# Point the ray in the current direction of travel
	ray.target_position.x = abs(ray.target_position.x) * direction
	ray.force_raycast_update()

	if ray.is_colliding():
		direction *= -1
		ray.target_position.x = abs(ray.target_position.x) * direction
		ray.force_raycast_update()

	global_position.x += direction * speed * delta
