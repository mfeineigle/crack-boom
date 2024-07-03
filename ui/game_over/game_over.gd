extends Control



@onready var score_number: Label = $Background/ScoreHbox/ScoreNumber
@onready var session_time: Label = $Background/TimerHbox/SessionTime
@onready var game_over_sfx: AudioStreamPlayer2D = $GameOverSFX
@onready var local_high_score: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/LocalHBox/LocalHighScore
@onready var last_high_score: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/LastHBox/LastHighScore


func _ready() -> void:
	AudioManager.stop_all()
	game_over_sfx.play()
	score_number.text = str(Globals.score)
	session_time.text = "%0.1f" % (Globals.time_alive)
	last_high_score.text = str(Globals.score)
	var old_score: int = Utils.load_score()[0]
	local_high_score.text = str(old_score)
	Utils.save_score(Globals.score)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
