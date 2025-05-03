extends Node3D

@onready var pivot: Node3D = $Pivot

# Rotation speed in radians per second
@export var rotation_speed: float = 0.5

func _process(delta: float) -> void:
	pivot.rotate_y(rotation_speed * delta)
