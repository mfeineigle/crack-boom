extends Label

func _ready() -> void:
	Signals.missed_crack.connect(_missed_crack)

func _missed_crack() -> void:
	text = str(int(text) - 9)
	if int(text) <= 0:
		print("game over")
