extends Node2D

var unbroken_teeth:Dictionary

func _ready() -> void:
	Signals.missed_crack.connect(_break_tooth)
	_create_teeth()
	
func _create_teeth() -> void:
	for i in range(1,28):
		var t = load("res://ui/main/tooth.tscn").instantiate()
		t.position.x = 30*i
		unbroken_teeth[i] = t
		add_child(t)
		
func _break_tooth() -> void:
	print(unbroken_teeth.size())
	for i in range(9):
		var random_key = unbroken_teeth.keys()[randi() % unbroken_teeth.size()]
		unbroken_teeth[random_key].queue_free()
		unbroken_teeth.erase(random_key)
	if unbroken_teeth.size() <= 0:
		Signals.game_over.emit()
		
