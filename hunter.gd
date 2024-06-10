extends Area2D

@export var speed = 1500

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hunter_collision: CollisionPolygon2D = $HunterCollision
@onready var pipe_collision: CollisionShape2D = $Pipe/PipeCollision

var velocity = Vector2.ZERO
var screensize = Vector2(800, 360)

func _ready() -> void:
	position.y = 270
	Signals.caught_crack.connect(_caught_crack)


func _process(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if velocity == Vector2.LEFT:
		self.scale.x = 0.4
	if velocity == Vector2.RIGHT:
		self.scale.x = -0.4
	if Input.is_action_pressed("speed_up"):
		Globals.crack_speed += 25
	
	position += velocity * speed * delta
	# clamp within the screensize
	position.x = clamp(position.x, 55, screensize.x-55)
	Globals.hunter_pos = position
	
func _caught_crack() -> void:
	Globals.crack_speed += 25

func _on_area_entered(area: Area2D) -> void:
	# crack
	if area in get_tree().get_nodes_in_group("crack_rocks"):
		Signals.caught_crack.emit()
	# avoidables
	elif area in get_tree().get_nodes_in_group("FBIs"):
		Signals.caught_fbi.emit()
	elif area in get_tree().get_nodes_in_group("private_eyes"):
		Signals.caught_private_eye.emit()
	# collectibles
	elif area in get_tree().get_nodes_in_group("bribes"):
		Signals.caught_bribe.emit()
	elif area in get_tree().get_nodes_in_group("guns"):
		Signals.caught_gun.emit()
	elif area in get_tree().get_nodes_in_group("laptops"):
		Signals.caught_laptop.emit()
	area.queue_free()

func _on_pipe_area_entered(area: Area2D) -> void:
	print("direct hit")
	Signals.caught_crack.emit()
	area.queue_free()
