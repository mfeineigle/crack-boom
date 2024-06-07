extends Node2D

@onready var spawn_path: PathFollow2D = $Path2D/SpawnPath
@onready var crack_timer: Timer = $CrackTimer
@onready var avoidable_timer: Timer = $AvoidableTimer

func _ready() -> void:
	Signals.missed_crack.connect(_reset_crack_timer)
	Signals.game_over.connect(_game_over)
	Signals.spawn_joe.connect(_spawn_joe)

func _spawn_joe() -> void:
	var joe_spawn_points:Array = [50,115,180]
	var joe = load("res://joe.tscn").instantiate()
	var x = Globals.hunter_pos.x + randi_range(-400,400)
	var y = joe_spawn_points[randi() % joe_spawn_points.size()]
	joe.position = Vector2(x,y)
	joe.speed = randi_range(50,500)
	call_deferred("add_child", joe)
	
func spawn_collectible(col_path: String) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	col.speed = Globals.crack_speed
	add_child(col)

func choose_collectable() -> void:
	var choice:int = randi() % 10
	if choice == 0:
		spawn_collectible("res://collectibles/laptop.tscn")
	elif choice == 1:
		spawn_collectible("res://collectibles/gun.tscn")
	elif choice == 2:
		spawn_collectible("res://collectibles/bribe.tscn")
	else:
		spawn_collectible("res://collectibles/crack_rock.tscn")


func _on_crack_timer_timeout() -> void:
	crack_timer.start()
	crack_timer.wait_time *= 0.95
	choose_collectable()
	
func _reset_crack_timer() -> void:
	crack_timer.wait_time = 1

func _game_over() -> void:
	crack_timer.stop()
	avoidable_timer.stop()

func _reset_avoidable_timer() -> void:
	avoidable_timer.wait_time = 1

func _on_avoidable_timer_timeout() -> void:
	avoidable_timer.start()
	avoidable_timer.wait_time *= 0.95
	choose_avoidable()


func spawn_avoidable(col_path) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	col.speed = Globals.crack_speed
	add_child(col)
	
func choose_avoidable() -> void:
	var choice:int = randi() % 2
	if choice == 0:
		spawn_collectible("res://avoidables/fbi.tscn")
	if choice == 1:
		spawn_collectible("res://avoidables/private_eye.tscn")
