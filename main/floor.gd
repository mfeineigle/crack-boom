extends Area2D

func _on_area_entered(area: Area2D) -> void:
	# collectibles
	if area in get_tree().get_nodes_in_group("laptops"):
		Signals.missed_laptop.emit()
	elif area in get_tree().get_nodes_in_group("guns"):
		Signals.missed_gun.emit()
	elif area in get_tree().get_nodes_in_group("bribes"):
		Signals.missed_bribe.emit()
		
	# avoidables
	elif area in get_tree().get_nodes_in_group("FBIs"):
		Signals.missed_fbi.emit()
	elif area in get_tree().get_nodes_in_group("private_eyes"):
		Signals.missed_private_eye.emit()
		
	# crack rocks
	else:
		for rock in get_tree().get_nodes_in_group("crack_rocks"):
			rock.queue_free()
		Signals.missed_crack.emit()
		Globals.crack_speed = Globals.default_crack_speed
	area.queue_free()
