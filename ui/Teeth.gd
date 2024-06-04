extends Label

func _ready() -> void:
	Global.missed_crack.connect(_missed_crack)

func _missed_crack() -> void:
	text = str(int(text) - 1)
	if int(text) <= 0:
		print("game over")
		Global.game_over.emit()
