extends Collectible


func _on_area_entered(area: Area2D) -> void:
	var targets:Array = []
	targets.append(get_tree().get_nodes_in_group("hunter"))
	targets.append(get_tree().get_nodes_in_group("joes"))
	if area in targets:
		Globals.crack_speed = Globals.default_crack_speed
		#AudioManager.play("res://assets/audio/gun_lying_around.mp3")
