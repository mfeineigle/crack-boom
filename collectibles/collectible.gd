class_name Collectible
extends Area2D

@onready var spin: int = (randi() % 3) + 3

var speed:int = Globals.crack_speed
var velocity = Vector2.DOWN

func _process(delta: float) -> void:
	position += velocity * speed * delta
	rotation += delta * spin
