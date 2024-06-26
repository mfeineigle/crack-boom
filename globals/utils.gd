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


func load_score() -> int:
	if FileAccess.file_exists(Globals.save_path):
		print("file found")
		var file = FileAccess.open(Globals.save_path, FileAccess.READ)
		return file.get_var()
	else:
		print("file not found")
		return 0


func save_score(highscore: int) -> void:
	var file = FileAccess.open(Globals.save_path, FileAccess.WRITE)
	file.store_var(highscore)
