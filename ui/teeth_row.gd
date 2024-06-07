extends Node2D

var unbroken_teeth:Dictionary
#var unbroken_teeth:Dictionary = {
#1:true,   2:true,  3:true,  4:true,  5:true,  6:true,  7:true,  8:true,  9:true, 10:true,
#11:true, 12:true, 13:true, 14:true, 15:true, 16:true, 17:true, 18:true, 19:true, 20:true,
#21:true, 22:true, 23:true, 24:true, 25:true, 26:true, 27:true, 28:true, 29:true, 30:true,
#}

func _ready() -> void:
	Signals.missed_crack.connect(_break_tooth)
	_create_teeth()
	
func _create_teeth() -> void:
	for i in range(1,28):
		var t = load("res://ui/tooth.tscn").instantiate()
		t.position.x = 30*i
		unbroken_teeth[i] = t
		add_child(t)
		
func _break_tooth() -> void:
	print(unbroken_teeth.size())
	var random_key = unbroken_teeth.keys()[randi() % unbroken_teeth.size()]
	unbroken_teeth[random_key].queue_free()
	unbroken_teeth.erase(random_key)
	if unbroken_teeth.size() <= 0:
		Signals.game_over.emit()
		
