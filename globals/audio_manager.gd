extends Node

var is_playing: bool = false
var num_players = 8
var bus = "master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.

## reset clip timer
@onready var clip_timer: Timer = Timer.new()
## track used clips
@onready var all_clips: Array = (Utils.get_all_files("res://assets/audio", "mp3"))

func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.finished.connect(_on_stream_finished.bind(p))
		p.bus = bus
	# setup timer
	add_child(clip_timer)
	clip_timer.connect("timeout", _on_clip_timer_timeout)
	clip_timer.wait_time = 15
	clip_timer.start()


func _on_stream_finished(stream):
	# When finished playing a stream, make the player available again.
	available.pop_front()
	available.append(stream)
	is_playing = false


func play(sound_path):
	if sound_path in all_clips and not is_playing:
		is_playing = true
		track_played(sound_path)
		queue.append(sound_path)


func stop_all() -> void:
	for i in available:
		i.playing = false
	available.pop_front()
	is_playing = false


## remove a clip from 'all_clips' on played to prevent duplicate plays too soon
func track_played(sound_path) -> void:
	for i in all_clips:
		if i == sound_path:
			all_clips.erase(i)


func _process(_delta):
	# Play a queued sound if any players are available.
	if queue.size() > 0 and available.size() > 0:
		available[0].stream = load(queue.pop_front())
		available[0].play()

## reset 'all_clips'
func _on_clip_timer_timeout() -> void:
	all_clips = (Utils.get_all_files("res://assets/audio", "mp3"))
