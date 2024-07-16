extends Collectible

func _ready() -> void:
	AudioManager.play("res://assets/audio/watch_out_kiddo_its_the_fuzz.mp3")

func _on_area_entered(area: Area2D) -> void:
	var group = get_tree().get_nodes_in_group("joes") + get_tree().get_nodes_in_group("hunter")
	if area in group:
		for joe in get_tree().get_nodes_in_group("joes"):
			Signals.run_away_joe.emit()
