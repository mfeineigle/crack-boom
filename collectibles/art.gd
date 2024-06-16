extends Collectible

@onready var sfx:Array = [
	"res://assets/audio/trump_you_call_that_art.mp3",
	"res://assets/audio/trump_call_that_bribery.mp3",
	"res://assets/audio/trump_call_that_payoff.mp3",
	]

func _ready() -> void:
	var choice:int = randi() % sfx.size()
	AudioManager.play(sfx[choice])
	
func _on_area_entered(area: Area2D) -> void:
	var targets:Array = []
	targets.append(get_tree().get_nodes_in_group("hunter"))
	targets.append(get_tree().get_nodes_in_group("joes"))
	if area in targets:
		AudioManager.play("res://assets/audio/gun_lying_around.mp3")
