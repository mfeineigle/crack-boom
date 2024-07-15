extends Node

var score_save_path = "user://score.save"
var time_save_path = "user://time.save"
var screensize = Vector2(800, 360)
var current_level


# Spawn Rates
var avoidable_spawn_rate:float = 5.0
var collectible_spawn_rate:float = 4.0
var crack_spawn_rate:float = 1.0

# Speed
var crack_speed:int = 100

var hunter_pos:Vector2

var score:int = 0
var time_alive:float = 0.0
