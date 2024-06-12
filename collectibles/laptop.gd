extends Collectible

@onready var commie_sprite_2d: Sprite2D = $Sprites/CommieSprite2D
@onready var hooker_sprite_2d: Sprite2D = $Sprites/HookerSprite2D

func _ready() -> void:
	var choice:int = randi() % 2
	if choice == 0:
		commie_sprite_2d.visible = true
		AudioManager.play("res://assets/audio/laptop_russian_disinfo.mp3")
	elif choice == 1:
		hooker_sprite_2d.visible = true
		AudioManager.play("res://assets/audio/laptop_trump_stormy_crime_that_atrocity.mp3")
