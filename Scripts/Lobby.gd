extends Control

var tabs = []

func _ready():
	tabs = [$PlayTab, $DeckTab, $CollectionTab, $StoreTab, $SettingsTab]
	$HBoxContainer/PlayBtn.connect("pressed", func(): show_tab(0))
	$HBoxContainer/DeckBtn.connect("pressed", func(): show_tab(1))
	$HBoxContainer/CollectionBtn.connect("pressed", func(): show_tab(2))
	$HBoxContainer/StoreBtn.connect("pressed", func(): show_tab(3))
	$HBoxContainer/SettingsBtn.connect("pressed", func(): show_tab(4))
	show_tab(0)
	$PlayTab/Button.connect("pressed", on_start_pressed)

func show_tab(index):
	for i in range(tabs.size()):
		tabs[i].visible = i == index

func on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")
