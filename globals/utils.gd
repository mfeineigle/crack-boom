extends Node

func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func get_all_files(path: String, file_ext := "", files := []):
	var dir = DirAccess.open(path)
	if DirAccess.get_open_error() == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				files = get_all_files(dir.get_current_dir() +"/"+ file_name, file_ext, files)
			else:
				if file_ext and file_name.get_extension() != file_ext:
					file_name = dir.get_next()
					continue
				files.append(dir.get_current_dir() +"/"+ file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access %s." % path)
	return files


func load_score() -> Array:
	if not FileAccess.file_exists(Globals.score_save_path):
		var w_file = FileAccess.open(Globals.score_save_path, FileAccess.WRITE)
		w_file.store_var([0,0,0,0,0])
		print("load score not exists")
	var r_file = FileAccess.open(Globals.score_save_path, FileAccess.READ)
	var scores: Array = r_file.get_var()
	scores.reverse()
	return scores.slice(0,5)


func save_score(highscore: int) -> void:
	var old_scores: Array
	if FileAccess.file_exists(Globals.score_save_path):
		var r_file = FileAccess.open(Globals.score_save_path, FileAccess.READ)
		old_scores = r_file.get_var()
		old_scores.append(highscore)
		old_scores.sort()
	var w_file = FileAccess.open(Globals.score_save_path, FileAccess.WRITE)
	w_file.store_var(old_scores)


func load_time() -> Array:
	if not FileAccess.file_exists(Globals.time_save_path):
		var w_file = FileAccess.open(Globals.time_save_path, FileAccess.WRITE)
		w_file.store_var([0,0,0,0,0])
		print("load score not exists")
	var r_file = FileAccess.open(Globals.time_save_path, FileAccess.READ)
	var times: Array = r_file.get_var()
	times.reverse()
	return times.slice(0,5)


func save_time(hightime: float) -> void:
	var old_times: Array
	if FileAccess.file_exists(Globals.time_save_path):
		var r_file = FileAccess.open(Globals.time_save_path, FileAccess.READ)
		old_times = r_file.get_var()
		old_times.append(hightime)
		old_times.sort()
	var w_file = FileAccess.open(Globals.time_save_path, FileAccess.WRITE)
	w_file.store_var(old_times)
