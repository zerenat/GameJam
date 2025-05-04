extends MeshInstance3D

@onready var path_follow_3d: PathFollow3D = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const move_speed := 0.05
	path_follow_3d.progress += move_speed + delta
