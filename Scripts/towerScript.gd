extends Node3D

# Define the signal that the enemy will hear to prompt it to take damage
signal enemy_takes_damage(current_target, damage_amount)

@onready var crystal_animation_tree: AnimationTree = $Shooting_Tower/Crystal/CrystalAnimationPlayer/CrystalAnimationTree


var current_target = null # this variable stores a reference to the enemy that the tower is currently targeting
var enemies_in_range = [] # This is an array
var damage_interval = 1.0 # Seconds where the tower deals damage at each interval. So every 1s, the tower will deal damage to the enemy.
var damage_amount = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect signals to my functions for when a body enters or exits the area - basically detection of enemies coming in and out of the detection area (Area3D node)
	$DetectionArea.body_entered.connect(_on_body_entered) # Emits signal from the Area3D node - body_entered, and then ".connect" calls the function inside the brackets - _on_body_entered
	$DetectionArea.body_exited.connect(_on_body_exited) # Emits signal from the Area3D node - body_exited. So the signal goes off when it detects something entering the collider of the Area3D node
	
	# Start a timer to deal damage repeatedly (every second at the moment as per the var damage_interval)
	var timer = Timer.new()
	timer.wait_time = damage_interval
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)


func _on_body_entered(body):
	# If there's no current target, set the first enemy to be the target
	if body.is_in_group("enemies"):
		enemies_in_range.append(body)
		if current_target == null:
			current_target = body # store the enemy ref
			print(current_target.name, " is now the target.")
			#emit_signal("enemy_takes_damage", current_target, 10)
		
		
func _on_body_exited(body):
	# If the target leaves the area, reset the target and wait for next enemy
	if body in enemies_in_range:
		enemies_in_range.erase(body)
	
	if body == current_target:
		print(current_target.name, " is no longer the target")
		current_target = null
		
		if enemies_in_range.size() > 0:
			current_target= enemies_in_range[0]
			print(current_target)
		

func _on_timer_timeout():
	if current_target != null and is_instance_valid(current_target): # If there's a valid target
		# Emit the signal when the timer times out
		
		emit_signal("enemy_takes_damage", current_target, damage_amount)
		
		# Play the OneShot attack animation
		if crystal_animation_tree != null:
			crystal_animation_tree.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
