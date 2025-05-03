# Enemy.gd (for Godot 4.x)
extends Node3D

@export var speed: float = 2.0
@export var target: NodePath

var target_node: Node3D

func _ready():
	if has_node(target):
		target_node = get_node(target)

func _process(delta):
	print("test")
	if target_node:
		var direction = (target_node.global_position - global_position).normalized()
		global_position += direction * speed * delta
