extends Control

@onready var sfx_volume_slider: HSlider = $ColorRect/SFXVolumeSlider
@onready var music_volume_slider: HSlider = $ColorRect/MusicVolumeSlider


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
	#$SFXPlayer.volume_db = value

# Handle Music volume change
func _on_music_volume_changed(value: float) -> void:
	GlobalSettings.music_volume = value
	# Update your music player volume (assuming you have an AudioStreamPlayer for Music)
	#$MusicPlayer.volume_db = value
