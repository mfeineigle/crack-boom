extends Collectible

											# SPAWN
var audio_choice: Dictionary = {"GUN": [ ["res://assets/audio/joe_bidens_dont_lie_about_guns.mp3",
										  "res://assets/audio/trump_throw_em_a_bone.mp3" ],
											# COLLECT
											["res://assets/audio/joe_gun_lying_around.mp3",
											 "res://assets/audio/trump_legitimizes_my_trial_right.mp3"],
										  ],
							   }

func _ready() -> void:
	AudioManager.play(audio_choice.GUN[SUBCHOICE.SPAWN].pick_random())

func _on_area_entered(area: Area2D) -> void:
	Signals.spawn_joe.emit()
	if area in get_tree().get_nodes_in_group("hunter"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play(audio_choice.GUN[SUBCHOICE.COLLECT].pick_random())
	if area in get_tree().get_nodes_in_group("joes"):
		Globals.crack_spawn_rate *= 1.1
		AudioManager.play(audio_choice.GUN[SUBCHOICE.COLLECT].pick_random())
