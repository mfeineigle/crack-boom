extends Control

func _ready() -> void:
	AudioManager.play("res://assets/audio/biden_no_teeth_retarded_ice_cream_1.mp3")

func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
