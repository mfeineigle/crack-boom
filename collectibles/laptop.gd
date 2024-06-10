extends Collectible

@onready var laptop_sprite_2d: Sprite2D = $Sprites/LaptopSprite2D
@onready var hooker_sprite_2d: Sprite2D = $Sprites/HookerSprite2D

func _ready() -> void:
	var choice:int = randi() % 2
	if choice == 0:
		laptop_sprite_2d.visible = true
	elif choice == 1:
		hooker_sprite_2d.visible = true
	AudioManager.play("res://assets/audio/laptop_russian_disinfo.mp3")
