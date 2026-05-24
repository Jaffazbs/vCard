extends Control

var catalogue = preload("res://Scripts/CardCatalogue.gd").new()

const CARD_WIDTH = 220
const CARD_HEIGHT = 308
const COLUMNS = 4
const GAP = 16  # match your h_separation theme constant

func _ready():
	var scroll = get_node("ScrollContainer")
	var margin = get_node("ScrollContainer/MarginContainer")
	var grid = get_node("ScrollContainer/MarginContainer/GridContainer")

	scroll.anchor_right = 1.0
	scroll.anchor_bottom = 1.0
	scroll.offset_right = 0
	scroll.offset_bottom = 0

	grid.columns = COLUMNS
	grid.add_theme_constant_override("h_separation", GAP)
	grid.add_theme_constant_override("v_separation", GAP)

	# Calculate total grid width and pad the sides to center it
	var grid_width = (CARD_WIDTH * COLUMNS) + (GAP * (COLUMNS - 1))
	var viewport_width = get_viewport().get_visible_rect().size.x
	var padding = max(0, (viewport_width - grid_width) / 2)

	margin.add_theme_constant_override("margin_left", int(padding))
	margin.add_theme_constant_override("margin_right", int(padding))
	margin.add_theme_constant_override("margin_top", 20)
	margin.add_theme_constant_override("margin_bottom", 20)

	var all_cards = (
		catalogue.Mascot_Holo +
		catalogue.Uncommon_Holo +
		catalogue.Full_Art_Rare_Holo +
		catalogue.Ultra_Rare_Holo +
		catalogue.Support_Holo +
		catalogue.Secret_Rare_Holo +
		catalogue.Signature_God_Rare
	)

	for card_name in all_cards:
		var texture = load("res://Assets/" + card_name + ".png")
		var texture_rect = TextureRect.new()
		texture_rect.texture = texture
		texture_rect.custom_minimum_size = Vector2(CARD_WIDTH, CARD_HEIGHT)
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		grid.add_child(texture_rect)
