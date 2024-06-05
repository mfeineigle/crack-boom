extends Collectible

func _on_area_entered(area: Area2D) -> void:
	var group = get_tree().get_nodes_in_group("joes") + get_tree().get_nodes_in_group("hunter")
	if area in group:
		for joe in get_tree().get_nodes_in_group("joes"):
			joe.queue_free()
