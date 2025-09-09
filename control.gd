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

func _process(_delta: float) -> void:
	$"../../Light/Aura".light_color = _display_color()
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

func _on_red_pressed() -> void:
	leaders.append(Color.RED)

func _on_blue_pressed() -> void:
	leaders.append(Color.BLUE)

func _on_green_pressed() -> void:
	leaders.append(Color.GREEN)

func _on_white_pressed() -> void:
	leaders.append(Color.WHITE)

func _on_clear_pressed() -> void:
	leaders = []
