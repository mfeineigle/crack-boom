extends Node

func _ready() -> void:
	Signals.game_over.connect(_game_over)
	Globals.score = 0
	Globals.time_alive = 0.0


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()


func _game_over() -> void:
	Signals.level_changed.emit("res://ui/game_over.tscn")
