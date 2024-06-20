extends Area2D

@export var speed:int = 100
@export var rotation_speed:int = 2

@onready var rotation_timer: Timer = $RotationTimer
@onready var ttl_timer: Timer = $TTL_Timer

var velocity = Vector2.RIGHT
var rotation_direction:bool = true

func _ready() -> void:
	var pis = get_tree().get_nodes_in_group("private_eyes")
	if pis:
		AudioManager.play("res://assets/audio/they_fired_him.mp3")
		for pi in pis:
			pi.queue_free()
	else:
		AudioManager.play("res://assets/audio/joe_biden_10_percent_for_me.mp3")


func _process(delta: float) -> void:
	position += velocity * speed * delta * move_toward_hunter()
	if rotation_direction:
		rotation += delta * rotation_speed
	else:
		rotation -= delta * rotation_speed

func move_toward_hunter() -> Vector2:
	return position.direction_to(Globals.hunter_pos)

func _on_rotation_timer_timeout() -> void:
	rotation_direction = !rotation_direction
	rotation_timer.start((randi() % 5)+1)


func _on_area_entered(area: Area2D) -> void:
	if area not in get_tree().get_nodes_in_group("joes"):
		area.queue_free()


func _on_ttl_timer_timeout() -> void:
	print("bye bye Biden")
	queue_free()
