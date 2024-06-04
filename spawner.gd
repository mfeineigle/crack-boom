extends Node2D

@onready var spawn_path: PathFollow2D = $Path2D/SpawnPath
@onready var crack_timer: Timer = $CrackTimer

func _ready() -> void:
	Global.missed_crack.connect(_reset_crack_timer)
	Global.game_over.connect(_game_over)
	Global.spawn_joe.connect(_spawn_joe)

func _spawn_joe() -> void:
	var joe_spawn_points:Array = [100,200,300]
	var joe = load("res://joe.tscn").instantiate()
	var x = Global.hunter_pos.x + randi_range(-250,250)
	var y = joe_spawn_points[randi() % joe_spawn_points.size()]
	joe.position = Vector2(x,y)
	joe.speed = randi_range(50,500)
	call_deferred("add_child", joe)
	
func spawn_collectible(col_path: String) -> void:
	var col = load(col_path).instantiate()
	spawn_path.progress_ratio = randf()
	col.position = spawn_path.global_position
	col.speed = Global.crack_speed
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
