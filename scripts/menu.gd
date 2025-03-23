extends CanvasLayer

@onready var settings_menu: Control = $SettingsMenu
@onready var paused_menu: Control = $PausedMenu
@onready var quit_label: Label = $QuitLabel
@onready var darken: TextureRect = $Darken

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	settings_menu.visible = false
	paused_menu.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused_menu.visible == false and settings_menu.visible == false:
			get_tree().paused = true
			paused_menu.visible = true
		elif paused_menu.visible == true:
			get_tree().paused = false
			paused_menu.visible = false
		elif settings_menu.visible == true:
			paused_menu.visible = true
			settings_menu.visible = false
		


func _on_resume_pressed() -> void:
	get_tree().paused = false
	paused_menu.visible = false


func _on_quit_pressed() -> void:
	paused_menu.visible = false
	settings_menu.visible = false
	darken.modulate = Color.BLACK
	quit_label.visible = true
	get_tree().quit


func _on_settings_pressed() -> void:
	paused_menu.visible = false
	settings_menu.visible = true


func _on_back_pressed() -> void:
	paused_menu.visible = true
	settings_menu.visible = false
