# Enemy.gd (for Godot 4.x)
extends Node3D

@export var health: float = 100.0
@export var speed: float = 2.0
@export var target: NodePath

var target_node: Node3D

func _ready():
	if has_node(target):
		target_node = get_node(target)

func _process(delta):
	if target_node:
		var direction = (target_node.global_position - global_position).normalized()
		global_position += direction * speed * delta
		var damage: float = 50 * delta
		take_damage(damage)

func take_damage(damage: float):
	health -= damage
	if health <= 0:
		health = 0
		destroy()
		print("ded")
	display_health()
		
func display_health():
	print("Health left: " + str(health))
	
func destroy():
	queue_free()
