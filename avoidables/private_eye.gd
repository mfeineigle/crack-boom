extends Collectible

func _ready() -> void:
	AudioManager.play("res://assets/audio/investigators_too_hot_for_pops.mp3")
	for joe in get_tree().get_nodes_in_group("joes"):
		Signals.run_away_joe.emit()


func _on_area_entered(area: Area2D) -> void:
	var group = get_tree().get_nodes_in_group("joes") + get_tree().get_nodes_in_group("hunter")
	if area in group:
		pass
