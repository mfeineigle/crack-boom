extends Collectible

@onready var commie_sprite_2d: Sprite2D = $Sprites/CommieSprite2D
@onready var hooker_sprite_2d: Sprite2D = $Sprites/HookerSprite2D
@onready var ukraine_sprite_2d: Sprite2D = $Sprites/UkraineSprite2D

enum CHOICE {RUSSIA, HOOKER, UKRAINE}
@onready var choice:int = CHOICE.values().pick_random()


func _ready() -> void:
	match choice:
		CHOICE.RUSSIA:
			commie_sprite_2d.visible = true
			AudioManager.play("res://assets/audio/laptop_russian_disinfo.mp3")
		CHOICE.HOOKER:
			hooker_sprite_2d.visible = true
			AudioManager.play("res://assets/audio/laptop_trump_stormy_crime_that_atrocity.mp3")
		CHOICE.UKRAINE:
			ukraine_sprite_2d.visible = true


func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("hunter"):
		Globals.crack_spawn_rate *= 1.1
		match choice:
			CHOICE.RUSSIA:
				pass
				#AudioManager.play("We saved democracy!")
			CHOICE.HOOKER:
				AudioManager.play("res://assets/audio/trump_what_a_simp.mp3")
				pass
			CHOICE.UKRAINE:
				AudioManager.play("res://assets/audio/joe_dont_pay_to_play.mp3")
	if area in get_tree().get_nodes_in_group("joes"):
		Globals.crack_spawn_rate *= 1.1
		match choice:
			CHOICE.RUSSIA:
				pass
				#AudioManager.play("We saved democracy!")
				# Who was Seth Rich?
			CHOICE.HOOKER:
				pass
				#AudioManager.play("You paid for that?")
				#AudioManager.play("Really son?")
			CHOICE.UKRAINE:
				AudioManager.play("res://assets/audio/joe_dont_pay_to_play.mp3")
