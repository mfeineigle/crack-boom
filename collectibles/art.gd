extends Collectible

											# SPAWN
var audio_choice: Dictionary = {"ART": [ ["res://assets/audio/joe_talented_artist.mp3",
										  "res://assets/audio/trump_call_that_art_2.mp3" ],
											# COLLECT
											["res://assets/audio/joe_pretty_picture.mp3",
											"res://assets/audio/trump_art_payoff.mp3" ],
										  ],
							   }

func _ready() -> void:
	AudioManager.play(audio_choice.ART[SUBCHOICE.SPAWN].pick_random())

func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play(audio_choice.ART[SUBCHOICE.COLLECT].pick_random())
	if area in get_tree().get_nodes_in_group("joes"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play(audio_choice.ART[SUBCHOICE.COLLECT].pick_random())
