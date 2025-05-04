extends Control

@onready var sfx_volume_slider: HSlider = $ColorRect/SFXVolumeSlider
@onready var music_volume_slider: HSlider = $ColorRect/MusicVolumeSlider
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		# Set initial slider values to match global settings
	sfx_volume_slider.value = GlobalSettings.sfx_volume
	music_volume_slider.value = GlobalSettings.music_volume
	
	# Connect sliders to volume adjustment functions
	sfx_volume_slider.value_changed.connect(_on_sfx_volume_changed)
	music_volume_slider.value_changed.connect(_on_music_volume_changed)


# Handle SFX volume change
func _on_sfx_volume_changed(value: float) -> void:
	GlobalSettings.sfx_volume = value
	# Update your SFX player volume (assuming you have an AudioStreamPlayer for SFX)
	# $AudioStreamPlayer2D.volume_db = value

# Handle Music volume change
func _on_music_volume_changed(value: float) -> void:
	GlobalSettings.music_volume = value

	var min_db = -60.0
	var max_db = 0.0

	# Avoid log(0) by clamping
	var clamped_value = clamp(value, 1.0, 100.0)

	# Use natural log and convert to log base 10
	var normalized = log(clamped_value) / log(100.0)

	var db = lerp(min_db, max_db, normalized)

	audio_stream_player_2d.volume_db = db
