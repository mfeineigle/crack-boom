extends Collectible

var inhales: Array = ["res://assets/audio/inhale_1.mp3", "res://assets/audio/inhale_2.mp3", "res://assets/audio/nar_cant.mp3"]

func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play(inhales.pick_random())
	if area in get_tree().get_nodes_in_group("joes"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play("res://assets/audio/joe_breathe_boy.mp3")
