extends Control


@onready var score_number: Label = $Background/ScoreHbox/ScoreNumber
@onready var session_time: Label = $Background/TimerHbox/SessionTime


func _ready() -> void:
	AudioManager.play("res://assets/audio/biden_no_teeth_retarded_ice_cream_1.mp3")
	score_number.text = str(Globals.score)
	session_time.text = "%0.1f" % (Globals.time_alive)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
