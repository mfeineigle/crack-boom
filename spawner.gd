extends Node2D

# control spawns
enum collectibles {LAPTOP, GUN, BRIBE, NARCAN, ART, RANDOM, NONE}
@export var collectible_spawn:collectibles = collectibles.RANDOM
enum avoidables {FBI, PRIVATE_EYE, RANDOM, NONE}
@export var avoidable_spawn:avoidables = avoidables.RANDOM

@onready var spawn_path: PathFollow2D = $Path2D/SpawnPath
@onready var crack_timer: Timer = $CrackTimer
@onready var avoidable_timer: Timer = $AvoidableTimer
@onready var collectible_timer: Timer = $CollectibleTimer

func _ready() -> void:
	Signals.missed_crack.connect(_reset_crack_timer)
	Signals.missed_bribe.connect(_reset_collectible_timer)
	Signals.missed_gun.connect(_reset_collectible_timer)
	Signals.missed_laptop.connect(_reset_collectible_timer)
	Signals.missed_fbi.connect(_reset_avoidable_timer)
	Signals.missed_private_eye.connect(_reset_avoidable_timer)
	Signals.game_over.connect(_game_over)
	Signals.spawn_joe.connect(_spawn_joe)


func _spawn_joe() -> void:
	var joe = load("res://joe.tscn").instantiate()
	var joe_spawn_x:Array = [0,800]
	var x = joe_spawn_x[randi() % joe_spawn_x.size()]
	var joe_spawn_y:Array = [50,115,180]
	var y = joe_spawn_y[randi() % joe_spawn_y.size()]
	joe.position = Vector2(x,y)
	joe.speed = randi_range(50,500)
	call_deferred("add_child", joe)


# COLLECTIBLES
func _on_collectible_timer_timeout() -> void:
	collectible_timer.wait_time *= 0.95
	collectible_timer.start()
	choose_collectable()

func choose_collectable() -> void:
	var choice:int = randi() % 3
	if collectible_spawn != collectibles.RANDOM:
		choice = collectible_spawn
	if choice == 0:
		spawn_collectible("res://collectibles/laptop.tscn")
	elif choice == 1:
		spawn_collectible("res://collectibles/gun.tscn")
	elif choice == 2:
		spawn_collectible("res://collectibles/bribe.tscn")
	elif choice == 3:
		spawn_collectible("res://collectibles/narcan.tscn")
	elif choice == 4:
		spawn_collectible("res://collectibles/art.tscn")

func spawn_collectible(col_path: String) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	col.speed = Globals.crack_speed
	add_child(col)

func _reset_collectible_timer() -> void:
	collectible_timer.wait_time = 1


# CRACK
func _on_crack_timer_timeout() -> void:
	crack_timer.wait_time *= 0.95
	crack_timer.start()
	spawn_collectible("res://collectibles/crack_rock.tscn")

func _reset_crack_timer() -> void:
	crack_timer.wait_time = 1


# AVOIDABLES
func _on_avoidable_timer_timeout() -> void:
	avoidable_timer.start()
	avoidable_timer.wait_time *= 0.95
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
	col.speed = Globals.crack_speed
	add_child(col)

func _reset_avoidable_timer() -> void:
	avoidable_timer.wait_time = 1


func _game_over() -> void:
	crack_timer.stop()
	avoidable_timer.stop()
	collectible_timer.stop()
