extends Collectible


func _on_area_entered(area: Area2D) -> void:
	Signals.spawn_joe.emit()
