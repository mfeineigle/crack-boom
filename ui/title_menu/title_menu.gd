extends Control


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
