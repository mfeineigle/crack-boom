extends Node

func _ready() -> void:
	Signals.game_over.connect(_game_over)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _game_over() -> void:
	for col in get_tree().get_nodes_in_group("collectibles"):
		col.queue_free()
	for joe in get_tree().get_nodes_in_group("joes"):
		joe.queue_free()
	for hunter in get_tree().get_nodes_in_group("hunter"):
		hunter.queue_free()
	# free all children
	for i in self.get_children():
		i.queue_free()
	# swap in new scene
	var game_over_screen = load("res://ui/game_over.tscn").instantiate()
	call_deferred("replace_by", game_over_screen)
