extends Label


func _ready() -> void:
	Global.caught_crack.connect(_caught_crack)
	Global.missed_crack.connect(_missed_crack)
	Global.caught_bribe.connect(_caught_bribe)
	Global.missed_bribe.connect(_missed_bribe)
	Global.caught_gun.connect(_caught_gun)
	Global.missed_gun.connect(_missed_gun)
	Global.caught_laptop.connect(_caught_laptop)
	Global.missed_laptop.connect(_missed_laptop)
	
func _caught_crack() -> void:
	print("caught crack")
	text = str(int(text) + 1)
func _missed_crack() -> void:
	print("missed crack")

func _caught_bribe() -> void:
	print("caught bribe")
func _missed_bribe() -> void:
	print("missed bribe")
	
func _caught_gun() -> void:
	print("caught gun")
func _missed_gun() -> void:
	print("missed gun")
	
func _caught_laptop() -> void:
	print("caught laptop")
func _missed_laptop() -> void:
	print("missed laptop")
