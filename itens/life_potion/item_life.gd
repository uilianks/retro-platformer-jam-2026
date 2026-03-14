extends Area2D

func _ready() -> void:
	if LifeManager.life_potion_collected:
		queue_free()
		return
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		set_deferred("monitoring", false)
		LifeManager.life_potion_collected = true
		LifeManager.current_lives += 1
		BusSignals.life_updated.emit(LifeManager.current_lives, LifeManager.MAX_LIVES)
		queue_free()
