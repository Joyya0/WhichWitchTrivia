extends CanvasLayer

@onready var hud_label = $HUDLabel

func _ready():
	GameState.reset()
	hud_label.add_theme_font_size_override("font_size", 16)
	hud_label.add_theme_color_override("font_color", Color(1, 0.9, 0.2))
	hud_label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 1))
	hud_label.add_theme_constant_override("shadow_offset_x", 2)
	hud_label.add_theme_constant_override("shadow_offset_y", 2)
	hud_label.anchor_left = 0
	hud_label.anchor_top = 1
	hud_label.anchor_right = 0
	hud_label.anchor_bottom = 1
	hud_label.offset_left = 10
	hud_label.offset_top = -80
	hud_label.offset_right = 300
	hud_label.offset_bottom = -10
	update_hud()

func get_hearts() -> String:
	var hearts = ""
	for i in range(GameState.playerLives):
		hearts += "❤️ "
	return hearts

func update_hud():
	hud_label.text = "Room " + str(GameState.curRoom + 1) + " of " + str(GameState.TOTAL_ROOMS) + "\n" + get_hearts() + "\nF = File  |  H = Help"

func _process(_delta):
	update_hud()
