extends Collectible

@onready var commie_sprite_2d: Sprite2D = $Sprites/CommieSprite2D
@onready var hooker_sprite_2d: Sprite2D = $Sprites/HookerSprite2D
@onready var ukraine_sprite_2d: Sprite2D = $Sprites/UkraineSprite2D
@onready var china_sprite_2d: Sprite2D = $Sprites/ChinaSprite2D

enum CHOICE {RUSSIA, HOOKER, UKRAINE, CHINA}
enum SUBCHOICE {SPAWN, COLLECT}

@onready var choice:int = CHOICE.values().pick_random()
											# SPAWN
var audio_choice: Dictionary = {"RUSSIA": [ ["res://assets/audio/laptop_russian_disinfo.mp3",
											 "res://assets/audio/trump_who_was_seth_rich.mp3"],
											# COLLECT
											["res://assets/audio/joe_i_saved_democracy.mp3",
											 "res://assets/audio/trump_hacked_elections.mp3" ],
										  ],
											# SPAWN
								"HOOKER": [ ["res://assets/audio/joe_really_son.mp3",
											 "res://assets/audio/laptop_trump_stormy_crime_that_atrocity.mp3"],
											# COLLECT
											["res://assets/audio/joe_you_paid_for_that.mp3",
											 "res://assets/audio/trump_what_a_simp.mp3" ],
										  ],
											# SPAWN
								"UKRAINE": [ ["res://assets/audio/joe_smartest_tycoon.mp3",
											  "res://assets/audio/trump_what_is_burisma.mp3"],
											# COLLECT
											 ["res://assets/audio/joe_dont_pay_to_play.mp3",
											  "res://assets/audio/trump_youre_fired_my_line.mp3" ],
										   ],
											# SPAWN
								"CHINA": [ ["res://assets/audio/joe_what_billion_deal.mp3",
											"res://assets/audio/trump_china_owns_biden.mp3"],
											# COLLECT
										   ["res://assets/audio/joe_beijing_ally.mp3",
											"res://assets/audio/trump_tough_on_chinas_pocket_book.mp3"],
										 ],
							   }

func _ready() -> void:
	match choice:
		CHOICE.RUSSIA:
			commie_sprite_2d.visible = true
			AudioManager.play(audio_choice.RUSSIA[SUBCHOICE.SPAWN].pick_random())
		CHOICE.HOOKER:
			hooker_sprite_2d.visible = true
			AudioManager.play(audio_choice.HOOKER[SUBCHOICE.SPAWN].pick_random())
		CHOICE.UKRAINE:
			ukraine_sprite_2d.visible = true
			AudioManager.play(audio_choice.UKRAINE[SUBCHOICE.SPAWN].pick_random())
		CHOICE.CHINA:
			china_sprite_2d.visible = true
			AudioManager.play(audio_choice.CHINA[SUBCHOICE.SPAWN].pick_random())


func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		Globals.crack_spawn_rate *= 1.1
		_choose_audio()
	if area in get_tree().get_nodes_in_group("joes"):
		Globals.crack_spawn_rate *= 1.1
		_choose_audio()

func _choose_audio() -> void:
		match choice:
			CHOICE.RUSSIA:
				AudioManager.play(audio_choice.RUSSIA[SUBCHOICE.COLLECT].pick_random())
			CHOICE.HOOKER:
				AudioManager.play(audio_choice.HOOKER[SUBCHOICE.COLLECT].pick_random())
			CHOICE.UKRAINE:
				AudioManager.play(audio_choice.UKRAINE[SUBCHOICE.COLLECT].pick_random())
			CHOICE.CHINA:
				AudioManager.play(audio_choice.CHINA[SUBCHOICE.COLLECT].pick_random())
