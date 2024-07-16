extends Collectible

											# SPAWN
var audio_choice: Dictionary = {"NARCAN": [ ["res://assets/audio/joe_breathe_boy.mp3",
											 "res://assets/audio/nar_cant.mp3"],
											# COLLECT
											["res://assets/audio/inhale_1.mp3",
											 "res://assets/audio/inhale_2.mp3"],
										  ],
							   }

func _ready() -> void:
	AudioManager.play(audio_choice.NARCAN[SUBCHOICE.SPAWN].pick_random())


func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		AudioManager.play(audio_choice.NARCAN[SUBCHOICE.COLLECT].pick_random())
	if area in get_tree().get_nodes_in_group("joes"):
		AudioManager.play(audio_choice.NARCAN[SUBCHOICE.COLLECT].pick_random())
