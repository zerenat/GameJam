extends StaticBody3D

# Define the signal that the enemy will hear to prompt it to take damage
signal enemy_takes_damage(damage_amount)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ready - waiting for input...")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space_button_press"):
		emit_signal("enemy_takes_damage", 10)
		print("Signal sent on space_button_pressed")


func _on_enemy_takes_damage(damage_amount: Variant) -> void:
	pass # Replace with function body.
