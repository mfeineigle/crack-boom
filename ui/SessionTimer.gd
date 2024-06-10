extends Timer

func _ready() -> void:
	Signals.game_over.connect(_game_over)

func _game_over() -> void:
	self.stop()
