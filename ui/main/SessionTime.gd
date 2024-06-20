extends Label


func _ready() -> void:
	text = "0.0"

func _on_session_timer_timeout() -> void:
	Globals.time_alive = Utils.round_to_dec(Globals.time_alive +0.1, 1)
	text = "%0.1f" % (Globals.time_alive)
