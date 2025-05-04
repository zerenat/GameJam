extends Button

#Button References
@onready var resume: Button = $PauseWindow/Resume
@onready var new_game: Button = $PauseWindow/NewGame
@onready var settings: Button = $PauseWindow/Settings
@onready var return_to_main_menu: Button = $PauseWindow/ReturnToMainMenu
@onready var exit: Button = $PauseWindow/Exit

#Menu References
@onready var pause_window: ColorRect = $PauseWindow
@onready var settings_menu: Control = $SettingsMenu

func _ready() -> void:
	self.pressed.connect(_menu_button_pressed)
	resume.pressed.connect(_resume_button_pressed)
	new_game.pressed.connect(_new_game_button_pressed)
	settings.pressed.connect(_settings_button_pressed)
	return_to_main_menu.pressed.connect(_return_to_main_menu_button_pressed)
	exit.pressed.connect(_exit_button_pressed)
	

func _menu_button_pressed():
	print('Menu button pressed')
	if pause_window.visible:
		pause_window.visible = false
		settings_menu.visible = false
	else:
		pause_window.visible = true
	
	if get_tree().paused:
		get_tree().paused = false
	else:
		get_tree().paused = true
	
func _resume_button_pressed():
	print('Menu button pressed')
	get_tree().paused = false
	pause_window.visible = false

func _new_game_button_pressed():
	print('Menu button pressed')
	get_tree().paused = false
	get_tree().reload_current_scene()

func _settings_button_pressed():
	print("Open Settings")
	if settings_menu.visible:
		settings_menu.visible = false
	else:
		settings_menu.visible = true

func _return_to_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _exit_button_pressed():
	print("Exit")
	get_tree().quit()
	
