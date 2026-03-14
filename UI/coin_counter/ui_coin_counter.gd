extends Control

@onready var label_collected: Label = $Panel/HBoxContainer/Label2
@onready var label_separator: Label = $Panel/HBoxContainer/Label3
@onready var label_total: Label = $Panel/HBoxContainer/Label

func _ready() -> void:
	BusSignals.coin_updated.connect(_on_coin_updated)

func _on_coin_updated(collected: int, total: int) -> void:
	label_collected.text = str(collected)
	label_total.text = str(total)
