extends Label


func _ready() -> void:
	# crack
	Signals.caught_crack.connect(_caught_crack)
	Signals.missed_crack.connect(_missed_crack)
	# avoidable
	Signals.caught_fbi.connect(_caught_fbi)
	Signals.missed_fbi.connect(_missed_fbi)
	Signals.caught_private_eye.connect(_caught_private_eye)
	Signals.missed_private_eye.connect(_missed_private_eye)
	# collectibles
	Signals.caught_bribe.connect(_caught_bribe)
	Signals.missed_bribe.connect(_missed_bribe)
	Signals.caught_gun.connect(_caught_gun)
	Signals.missed_gun.connect(_missed_gun)
	Signals.caught_laptop.connect(_caught_laptop)
	Signals.missed_laptop.connect(_missed_laptop)
	
# crack
func _caught_crack() -> void:
	print("caught crack")
	text = str(int(text) + 1)
func _missed_crack() -> void:
	print("missed crack")
	
# avoidables
func _caught_fbi() -> void:
	print("caught FBI")
func _missed_fbi() -> void:
	print("missed FBI")
	
func _caught_private_eye() -> void:
	print("caught private eye")
func _missed_private_eye() -> void:
	print("missed private eye")
	
# collectibles
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
