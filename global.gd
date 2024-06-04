extends Node

signal spawn_joe

signal caught_crack
signal missed_crack
signal caught_bribe
signal missed_bribe
signal caught_gun
signal missed_gun
signal caught_laptop
signal missed_laptop

signal game_over

var screensize = Vector2(1142, 648)

var default_crack_speed:int = 100
var crack_speed:int = 100

var hunter_pos:Vector2
