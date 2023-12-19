extends Control
class_name LevelSelect

@onready var current_level: LevelIcon = $WorldIcon

# Called when the node enters the scene tree for the first time.
func _ready():
	$selectFigure.global_position = current_level.global_position

# uses user input to control level selection
func _input(event):
	#left
	if event.is_action_pressed("ui_left") and current_level.next_level_left:
		current_level = current_level.next_level_left
		$selectFigure.global_position = current_level.global_position
	#right
	if event.is_action_pressed("ui_right") and current_level.next_level_right:
		current_level = current_level.next_level_right
		$selectFigure.global_position = current_level.global_position
	#up
	if event.is_action_pressed("ui_up") and current_level.next_level_up:
		current_level = current_level.next_level_up
		$selectFigure.global_position = current_level.global_position
	#down
	if event.is_action_pressed("ui_down") and current_level.next_level_down:
		current_level = current_level.next_level_down
		$selectFigure.global_position = current_level.global_position
	#select level
	if event.is_action_pressed("ui_accept"):
		if current_level.next_scene_path:
			get_tree().change_scene_to_file(current_level.next_scene_path)
