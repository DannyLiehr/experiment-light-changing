extends Control

var leaders = []
var color_list = []
var overall_color = Color(1,1,1,1) # Nothing for now.

func _display_color():
	if leaders.size() > 2:
		leaders = leaders.slice(-2)
	match leaders.size():
		2:
			return leaders[0].lerp(leaders[1], 0.5)
		1:
			return leaders[0]
		_:
			return Color.BLACK

func _update_color_display() -> void:
	$"../../Light/Aura".light_color = _display_color()
	var color_names = leaders.map(func(color):
			match color:
				Color.RED: return "Red"
				Color.GREEN: return "Green"
				Color.BLUE: return "Blue"
				Color.WHITE: return "White"
				_: return "Unknown"
			)
	$Panel/MixLabel.text = ", ".join(color_names)

func _add_leader(color):
	leaders.append(color)

func _process(_delta: float) -> void:
	color_list = []
	for l in leaders:
		if l == Color.RED:
			color_list.append("Red")
		elif l == Color.BLUE:
			color_list.append("Blue")
		elif l == Color.GREEN:
			color_list.append("Green")
		else:
			color_list.append("White")
	var joined_string = ", ".join(color_list)
	$Panel/MixLabel.text = joined_string
	_update_color_display()

func _on_red_pressed() -> void:
	_add_leader(Color.RED)

func _on_blue_pressed() -> void:
	_add_leader(Color.BLUE)

func _on_green_pressed() -> void:
	_add_leader(Color.GREEN)

func _on_white_pressed() -> void:
	_add_leader(Color.WHITE)

func _on_clear_pressed() -> void:
	leaders = []
