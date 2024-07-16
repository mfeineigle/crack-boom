extends Area2D

@export var speed:int = 100
@export var rotation_speed:int = 2

@onready var rotation_timer: Timer = $RotationTimer
@onready var ttl_timer: Timer = $TTL_Timer
@onready var running_away:bool = false
@onready var exit_dir:Vector2

var velocity = Vector2.RIGHT
var rotation_direction:bool = true

func _ready() -> void:
	Signals.run_away_joe.connect(_run_away)


func _process(delta: float) -> void:
	if rotation_direction:
		rotation += delta * rotation_speed
	else:
		rotation -= delta * rotation_speed
	if running_away == false:
		position += velocity * speed * delta * move_toward_hunter()
	else: #running_away = true
		position += velocity * speed * delta * exit_dir
		if position.x < -50:
			print("gone left")
			queue_free()
		elif position.x > 850:
			print("gone right")
			queue_free()

func move_toward_hunter() -> Vector2:
	return position.direction_to(Globals.hunter_pos)

func _on_rotation_timer_timeout() -> void:
	rotation_direction = !rotation_direction
	rotation_timer.start((randi() % 5)+1)


func _on_area_entered(area: Area2D) -> void:
	if area not in get_tree().get_nodes_in_group("joes"):
		area.queue_free()


func  _run_away() -> void:
	running_away = true
	var distance_left = global_position.distance_to(Vector2(0,0))
	var distance_right = global_position.distance_to(Vector2(800,0))
	if distance_left < distance_right:
		exit_dir = Vector2.LEFT * 5
	else:
		exit_dir = Vector2.RIGHT * 5
