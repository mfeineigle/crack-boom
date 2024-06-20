extends Control


@onready var score_number: Label = $Background/ScoreHbox/ScoreNumber
@onready var session_time: Label = $Background/TimerHbox/SessionTime
@onready var game_over_sfx: AudioStreamPlayer2D = $GameOverSFX


func _ready() -> void:
	AudioManager.stop_all()
	game_over_sfx.play()
	score_number.text = str(Globals.score)
	session_time.text = "%0.1f" % (Globals.time_alive)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
