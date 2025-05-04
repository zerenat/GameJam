#class_name Enemy extends Node3D
extends CharacterBody3D

@export var health: int = 100
#@export var speed: float = 2.0
#@export var target: NodePath
#
#var target_node: Node3D
#@onready var camera = get_node("../../Camera3D")
#@onready var health_bar = get_node("../HealthBar")
#

#
#func _ready():
	#if has_node(target):
		#target_node = get_node(target)
#
#func _process(delta):
	#if target_node:
		#print(health_bar)
		#var direction = (target_node.global_position - global_position).normalized()
		#global_position += direction * speed * delta
		#var damage: float = 50 * delta
		#take_damage(damage)
#
#func take_damage(damage: float):
	#health -= damage
	#if health <= 0:
		#health = 0
		#destroy()
		#print("ded")
	#display_health()
		#
#func display_health():
	#if health:
		#health = health  # Update it with current health
	#print("Health left: " + str(health))
	#
@onready var path_follow_3d: PathFollow3D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const move_speed := 0.05
	path_follow_3d.progress += move_speed + delta

	
	
func destroy():
	queue_free()

func _on_tower_enemy_takes_damage(enemy: Variant, damage_amount: Variant) -> void:
	print('---------------')
	print(enemy)
	if health > 0:
		health = health - damage_amount
		print(health)
	elif health <= 0:
		print("DEAD!")
		destroy()
