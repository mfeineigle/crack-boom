extends Control



@onready var score_number: Label = $Background/ScoreHbox/ScoreNumber
@onready var session_time: Label = $Background/TimerHbox/SessionTime
@onready var game_over_sfx: AudioStreamPlayer2D = $GameOverSFX
@onready var local_high_score: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/LocalHBox/LocalHighScore


func _ready() -> void:
	AudioManager.stop_all()
	game_over_sfx.play()
	score_number.text = str(Globals.score)
	session_time.text = "%0.1f" % (Globals.time_alive)
	var old_score: int = Utils.load_score()
	local_high_score.text = str(old_score)
	if Globals.score > old_score:
		Utils.save_score(Globals.score)
		local_high_score.text = str(Globals.score)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
