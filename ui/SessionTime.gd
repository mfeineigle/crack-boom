extends Label


func _ready() -> void:
	text = "0.0"

func _on_session_timer_timeout() -> void:
	text = str(float(text) + 0.1)
