extends Collectible

											# SPAWN
var audio_choice: Dictionary = {"BRIBE": [ ["res://assets/audio/joe_sniff_hair_money.mp3",
											"res://assets/audio/trump_bidens_sniff_out.mp3"],
											# COLLECT
											["res://assets/audio/joe_biden_10_percent_for_me.mp3",
											 "res://assets/audio/trump_big_guy_pull_it.mp3"],
										  ],
							   }

func _ready() -> void:
	AudioManager.play(audio_choice.BRIBE[SUBCHOICE.SPAWN].pick_random())

func _on_area_entered(area: Area2D) -> void:
	Signals.spawn_joe.emit()
	if area in get_tree().get_nodes_in_group("hunter"):
		AudioManager.play(audio_choice.BRIBE[SUBCHOICE.COLLECT].pick_random())
	if area in get_tree().get_nodes_in_group("joes"):
		AudioManager.play(audio_choice.BRIBE[SUBCHOICE.COLLECT].pick_random())
