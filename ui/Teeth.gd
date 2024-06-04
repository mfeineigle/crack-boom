extends Label

func _ready() -> void:
	Signals.missed_crack.connect(_missed_crack)

func _missed_crack() -> void:
	text = str(int(text) - 1)
	if int(text) <= 0:
		print("game over")
		Signals.game_over.emit()
