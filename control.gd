extends Control

var leaders = []
var color_list = []
var overall_color = Color(1,1,1,1) # Nothing for now.


func _display_color():
	while leaders.size() > 2:
		leaders.pop_front()
	if leaders.size() > 1:
		# Two characters are in the lead. So, combine the color shown.
		overall_color = leaders[0].lerp(leaders[1], 0.5)
	elif leaders.size() == 1:
		# One distinct leader.
		overall_color = leaders[0]
	else:
		# No leader.
		overall_color = Color(0,0,0,1) # Black but with alpha now.
	$"../../Light/Aura".light_color = overall_color

func _ready():
	_display_color()

func _process(delta: float) -> void:
	_display_color()
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
