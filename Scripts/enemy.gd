extends CharacterBody3D

var health = 100 # This is the health variable of the enemy

func take_damage(amount):
	health -= amount
	print("enemy took ", amount, " damage.")
	
	if health <= 0:
		queue_free() #remove the enemy from the scene
		print("YOU DIED!")
