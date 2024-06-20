extends Button


func _on_button_down() -> void:
	Signals.level_changed.emit("res://ui/high_score_menu.tscn")
