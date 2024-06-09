extends Collectible


func _on_area_entered(area: Area2D) -> void:
	var groups: Array = get_tree().get_nodes_in_group("hunter")
	groups += get_tree().get_nodes_in_group("joes")
	if area in groups:
		Signals.spawn_joe.emit()
