extends CharacterBody3D

var health = 100 # This is the health variable of the enemy


func _on_tower_enemy_takes_damage(enemy: Variant, damage_amount: Variant) -> void:
	print('---------------')
	print(enemy)
	health = health - damage_amount
	print(health)
