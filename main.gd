extends Node

@onready var score: Label = $UI/Score

func _ready() -> void:
	Signals.game_over.connect(_game_over)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _game_over() -> void:
	for col in get_tree().get_nodes_in_group("collectibles"):
		col.queue_free()
	for joe in get_tree().get_nodes_in_group("joes"):
		joe.queue_free()
	for hunter in get_tree().get_nodes_in_group("hunter"):
		hunter.queue_free()
