extends Button

func _on_button_down() -> void:
	Signals.level_changed.emit("res://ui/title_menu/title_menu.tscn")
