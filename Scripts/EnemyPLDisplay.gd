extends Node2D
var active_slot
func _ready():
	$RichTextLabel.add_theme_font_size_override("normal_font_size", 90)
	active_slot = get_node("/root/Main/CardSlots/EnemyCardSlot2")
func _process(_delta):
	if active_slot.card_in_slot and active_slot.card_in_slot is Node2D:
		var card = active_slot.card_in_slot
		var total_pl = card.card_pl + card.card_pl_bonus
		$RichTextLabel.text = str(total_pl)
		visible = true
	else:
		visible = false
