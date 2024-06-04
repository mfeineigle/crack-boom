extends Node

@onready var score: Label = $UI/Score

func _ready() -> void:
	Signals.game_over.connect(_game_over)


func _game_over() -> void:
	for i in get_tree().get_nodes_in_group("collectibles"):
		i.queue_free()
