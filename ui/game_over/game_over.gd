extends Control



@onready var score_number: Label = $Background/ScoreHbox/ScoreNumber
@onready var session_time: Label = $Background/TimerHbox/SessionTime
@onready var game_over_sfx: AudioStreamPlayer2D = $GameOverSFX
@onready var your_score: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/LastScoreHBox/YourScore
@onready var high_score: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/HighScoreHBox/HighScore
@onready var your_time: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/LastTimeHBox/YourTime
@onready var best_time: Label = $Background/CenterHBox/GameOverVBox/HighScoreVBox/BestTimeHBox/BestTime


func _ready() -> void:
	AudioManager.stop_all()
	game_over_sfx.play()
	# gui hud display
	score_number.text = str(Globals.score)
	session_time.text = "%0.1f" % (Globals.time_alive)
	# scores from this run
	your_score.text = str(Globals.score)
	your_time.text = str(Globals.time_alive)
	# highest score
	var old_score: int = Utils.load_score()[0]
	high_score.text = str(old_score)
	Utils.save_score(Globals.score)
	# best time
	var old_time: float = Utils.load_time()[0]
	best_time.text = "%0.1f" % (old_time)
	Utils.save_time(Globals.time_alive)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("quit"):
		get_tree().quit()
