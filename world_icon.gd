@tool
extends Control
class_name LevelIcon

@export var level_name := "1"
@export var next_level_left: LevelIcon
@export var next_level_right: LevelIcon
@export var next_level_up: LevelIcon
@export var next_level_down: LevelIcon
@export_file("*.tscn") var next_scene_path: String

# Called when the node enters the scene tree for the first time.
func _ready():
	#sets label to correspond to level number
	$Label.text = "Level " + str(level_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		#sets label to correspond to level number and update
		$Label.text = "Level " + str(level_name)
