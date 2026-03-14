extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var ui_press_space: Control = $UI/UiPressSpace
@onready var door: Door = $Composition/Door
var _total_coins: int = 0  # ← adiciona isto

func _ready() -> void:
	BusSignals.collected.connect(_on_coin_collected)
	door.visible = false
	door.monitoring = false
	await get_tree().physics_frame
	_total_coins = get_tree().get_nodes_in_group("coin").size()
	_validate_coins()

func enable_interact() -> void:
	set_process_input(true)
	
func _on_coin_collected() -> void:
	await get_tree().physics_frame
	_validate_coins()

func _validate_coins() -> void:
	var coins := get_tree().get_nodes_in_group("coin")
	var collected := _total_coins - coins.size()
	BusSignals.coin_updated.emit(collected, _total_coins)
	if coins.is_empty():
		door.visible = true
		door.monitoring = true

var _used := false

func _input(event: InputEvent) -> void:
	if _used:
		return
	if event.is_action_pressed("ui_accept"):
		_used = true
		ui_press_space.queue_free()
