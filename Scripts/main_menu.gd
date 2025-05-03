extends Control

@onready var new_game: Button = $NewGame
@onready var settings: Button = $Settings
@onready var exit: Button = $Exit

func _ready() -> void:
	new_game.pressed.connect(_on_new_game_pressed)
	settings.pressed.connect(_on_settings_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_new_game_pressed() -> void:
	print("Start New Game")
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_settings_pressed() -> void:
	print("Open Settings")

func _on_exit_pressed() -> void:
	print("Exit")
	get_tree().quit()
