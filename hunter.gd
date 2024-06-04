extends Area2D

@export var speed = 1500

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hunter_collision: CollisionPolygon2D = $HunterCollision
@onready var pipe_collision: CollisionShape2D = $Pipe/PipeCollision

var velocity = Vector2.ZERO
var screensize = Vector2(1142, 648)

func _ready() -> void:
	position.y = 550
	Global.caught_crack.connect(_caught_crack)


func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if velocity == Vector2.LEFT:
		self.scale.x = 1
	if velocity == Vector2.RIGHT:
		self.scale.x = -1
	
	position += velocity * speed * delta
	# clamp within the screensize
	position.x = clamp(position.x, 110, screensize.x-100)
	Global.hunter_pos = position
	
func _caught_crack() -> void:
	Global.crack_speed += 50

func _on_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("crack_rocks"):
		Global.caught_crack.emit()
	if area in get_tree().get_nodes_in_group("bribes"):
		Global.caught_bribe.emit()
	if area in get_tree().get_nodes_in_group("guns"):
		Global.caught_gun.emit()
	if area in get_tree().get_nodes_in_group("laptops"):
		Global.caught_laptop.emit()
	area.queue_free()

func _on_pipe_area_entered(area: Area2D) -> void:
	print("direct hit")
	Global.caught_crack.emit()
	area.queue_free()
