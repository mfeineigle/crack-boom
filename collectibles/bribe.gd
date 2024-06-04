extends Collectible


func _on_area_entered(area: Area2D) -> void:
	Global.spawn_joe.emit()
