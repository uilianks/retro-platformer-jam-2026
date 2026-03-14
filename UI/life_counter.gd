extends Control

@onready var label: Label = $Panel/HBoxContainer/Label2

func _ready() -> void:
	BusSignals.player_died.connect(_on_player_died)
	BusSignals.life_updated.connect(_on_life_updated)
	_update_ui()

func _on_player_died() -> void:
	LifeManager.current_lives -= 1
	_update_ui()
	if LifeManager.current_lives <= 0:
		get_tree().change_scene_to_file("res://stages/game_over/game_over.tscn")
	else:
		get_tree().reload_current_scene()

func gain_life() -> void:
	LifeManager.current_lives = mini(LifeManager.current_lives + 1, LifeManager.MAX_LIVES)
	_update_ui()

func _update_ui() -> void:
	label.text = str(LifeManager.current_lives)

func _on_life_updated(current: int, max_lives: int) -> void:
	_update_ui()
