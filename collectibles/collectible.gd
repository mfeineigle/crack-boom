class_name Collectible
extends Area2D

var speed:int = Global.crack_speed

var velocity = Vector2.DOWN

func _process(delta: float) -> void:
	position += velocity * speed * delta
	rotation += delta
