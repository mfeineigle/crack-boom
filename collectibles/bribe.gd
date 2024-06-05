extends Collectible


func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		Signals.spawn_joe.emit()
