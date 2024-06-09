extends Collectible

func _ready() -> void:
	AudioManager.play("res://assets/audio/investigators_too_hot_for_pops.mp3")
	for joe in get_tree().get_nodes_in_group("joes"):
		joe.queue_free()
