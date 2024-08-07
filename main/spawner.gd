extends Node2D

# control spawns
enum collectibles {ART, GUN, LAPTOP, NARCAN, BRIBE, RANDOM, NONE}
@export var collectible_spawn:collectibles = collectibles.RANDOM
enum avoidables {FBI, PRIVATE_EYE, RANDOM, NONE}
@export var avoidable_spawn:avoidables = avoidables.RANDOM

@onready var spawn_path: PathFollow2D = $Path2D/SpawnPath
@onready var crack_timer: Timer = $CrackTimer
@onready var avoidable_timer: Timer = $AvoidableTimer
@onready var collectible_timer: Timer = $CollectibleTimer

func _ready() -> void:
	Signals.missed_crack.connect(_reset_crack_timer)
	Signals.missed_art.connect(_reset_collectible_timer)
	Signals.missed_bribe.connect(_reset_collectible_timer)
	Signals.missed_gun.connect(_reset_collectible_timer)
	Signals.missed_laptop.connect(_reset_collectible_timer)
	Signals.missed_fbi.connect(_reset_avoidable_timer)
	Signals.missed_private_eye.connect(_reset_avoidable_timer)
	Signals.game_over.connect(_game_over)
	Signals.spawn_joe.connect(_spawn_joe)


func _spawn_joe() -> void:
	var joe = load("res://characters/joe.tscn").instantiate()
	var joe_spawn_x:Array = [0,800]
	var x = joe_spawn_x[randi() % joe_spawn_x.size()]
	var joe_spawn_y:Array = [50,115,180]
	var y = joe_spawn_y[randi() % joe_spawn_y.size()]
	joe.position = Vector2(x,y)
	joe.speed = randi_range(50,500)
	call_deferred("add_child", joe)


# COLLECTIBLES
func _on_collectible_timer_timeout() -> void:
	Globals.collectible_spawn_rate *= 0.99
	collectible_timer.wait_time = clamp(Globals.collectible_spawn_rate, 0.35, 5.0)
	collectible_timer.start()
	choose_collectable()

func choose_collectable() -> void:
	var roll:float = randf()
	if collectible_spawn != collectibles.RANDOM:
		roll = collectible_spawn * 0.16
	if 0 <= roll and roll < 0.15:
		spawn_collectible("res://collectibles/art.tscn")
	elif 0.15 <= roll and roll < 0.30:
		spawn_collectible("res://collectibles/gun.tscn")
	elif 0.30 <= roll and roll < 0.45:
		spawn_collectible("res://collectibles/laptop.tscn")
	elif 0.45 <= roll and roll < 0.60:
		spawn_collectible("res://collectibles/narcan.tscn")
	elif 0.60 <= roll and roll <= 1:
		spawn_collectible("res://collectibles/bribe.tscn")


func spawn_collectible(col_path: String) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	add_child(col)

func _reset_collectible_timer() -> void:
	Globals.collectible_spawn_rate = 2.5


# CRACK
func _on_crack_timer_timeout() -> void:
	Globals.crack_spawn_rate *= 0.98
	crack_timer.wait_time = clamp(Globals.crack_spawn_rate, 0.35, 1.0)
	crack_timer.start()
	spawn_collectible("res://collectibles/crack_rock.tscn")

func _reset_crack_timer() -> void:
	Globals.crack_spawn_rate = 1.0


# AVOIDABLES
func _on_avoidable_timer_timeout() -> void:
	Globals.avoidable_spawn_rate *= 0.99
	avoidable_timer.wait_time = clamp(Globals.avoidable_spawn_rate, 0.35, 5.0)
	avoidable_timer.start()
	choose_avoidable()

func choose_avoidable() -> void:
	var choice:int = randi() % 2
	if avoidable_spawn != avoidables.RANDOM:
		choice = avoidable_spawn
	if choice == 0:
		spawn_collectible("res://avoidables/fbi.tscn")
	if choice == 1:
		spawn_collectible("res://avoidables/private_eye.tscn")

func spawn_avoidable(col_path) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	add_child(col)

func _reset_avoidable_timer() -> void:
	Globals.avoidable_spawn_rate = 2.5


func _game_over() -> void:
	crack_timer.stop()
	avoidable_timer.stop()
	collectible_timer.stop()
