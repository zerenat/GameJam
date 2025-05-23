extends Area3D

signal enemy_takes_damage(current_target, damage)

@export var speed: float = 10.0
var target = null
var damage = 10



func _physics_process(delta):
	if target and is_instance_valid(target):
		var direction = (target.global_transform.origin - global_transform.origin).normalized()
		global_translate(direction * speed * delta)
		
func _on_body_entered(body):
	if body == target:
		print("Projectile hit: ", body.name)
		emit_signal("enemy_takes_damage", body, damage)
		# Implement damage dealt here
		queue_free()
		
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))
