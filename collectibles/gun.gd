extends Collectible

func _ready() -> void:
	AudioManager.play("res://assets/audio/lost_a_gun.mp3")



func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		AudioManager.play("res://assets/audio/gun_lying_around.mp3")
