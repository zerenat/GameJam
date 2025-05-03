extends Control

@onready var game_timer: Timer = $GameTimer
@onready var time_label: Label = $TimeLabel

@export var time_left: int = 30  # Countdown start value in seconds

func _ready() -> void:
	time_label.text = "Time: %d" % time_left
	game_timer.timeout.connect(_on_game_timer_timeout)
	game_timer.start()  # Start the timer if Autostart is off

func _on_game_timer_timeout() -> void:
	time_left -= 1
	time_label.text = "Time: %d" % time_left

	if time_left <= 0:
		game_timer.stop()
		_on_timer_finished()

func _on_timer_finished() -> void:
	print("Time's up!")
	# Add your logic here: restart, end game, show message, etc.
