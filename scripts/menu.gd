extends CanvasLayer

@onready var settings_menu: Control = $SettingsMenu
@onready var paused_menu: Control = $PausedMenu
@onready var quit_label: Label = $QuitLabel
@onready var darken: TextureRect = $Darken

@onready var volume_slider: HSlider = $SettingsMenu/VBoxContainer/Volume/VolumeSlider
@onready var machine_speed_slider: HSlider = $SettingsMenu/VBoxContainer/MachineSpeed/MachineSpeedSlider
@onready var jump_height_slider: HSlider = $SettingsMenu/VBoxContainer/JumpHeight/JumpHeightSlider
@onready var player_size_slider: HSlider = $SettingsMenu/VBoxContainer/PlayerSize/PlayerSizeSlider
@onready var masterbus = AudioServer.get_bus_index("Master")




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if paused_menu.visible == false and settings_menu.visible == false:
			# pause and open menu
			get_tree().paused = true
			paused_menu.visible = true
			darken.visible = true
		elif paused_menu.visible == true:
			# unpause and close menu
			get_tree().paused = false
			paused_menu.visible = false
			darken.visible = false
		elif settings_menu.visible == true:
			# leave settings menu and open paused menu
			paused_menu.visible = true
			settings_menu.visible = false
		


func _on_resume_pressed() -> void:
	# resume
	get_tree().paused = false
	paused_menu.visible = false


func _on_quit_pressed() -> void:
	# quit and tell the user how much they suck
	paused_menu.visible = false
	settings_menu.visible = false
	darken.modulate = Color.BLACK
	quit_label.visible = true
	get_tree().quit


func _on_settings_pressed() -> void:
	# open settings menu and close paused menu
	paused_menu.visible = false
	settings_menu.visible = true


func _on_back_pressed() -> void:
	# leave settings menu and open paused menu
	paused_menu.visible = true
	settings_menu.visible = false


func _on_apply_pressed() -> void:
	Singleton.jump_height = jump_height_slider.value
	Singleton.player_size = player_size_slider.value
	Singleton.machine_speed = machine_speed_slider.value
	AudioServer.set_bus_volume_db(masterbus, linear_to_db(volume_slider.value))
