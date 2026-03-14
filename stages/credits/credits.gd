extends Control

@onready var button: Button = $Button


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://stages/main_menu/main_menu.tscn")
