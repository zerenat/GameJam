extends Control

@onready var new_game: Button = $NewGame
@onready var settings: Button = $Settings
@onready var exit: Button = $Exit
@onready var settings_menu: Control = $SettingsMenu

func _ready() -> void:
	new_game.pressed.connect(_on_new_game_pressed)
	settings.pressed.connect(_on_settings_pressed)
	exit.pressed.connect(_on_exit_pressed)

func _on_new_game_pressed() -> void:
	print("Start New Game")
	settings_menu.visible = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_settings_pressed() -> void:
	print("Open Settings")
	if settings_menu.visible == true:
		settings_menu.visible = false
	else:
		settings_menu.visible = true

func _on_exit_pressed() -> void:
	print("Exit")
	get_tree().quit()
