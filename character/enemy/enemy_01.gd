class_name Enemy extends AnimatableBody2D

enum MoveType { STATIC, HORIZONTAL, VERTICAL }
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@export var move_type: MoveType = MoveType.STATIC
@export var speed: float = 80.0
@export var range_distance: float = 150.0

var _origin: Vector2
var _time: float = 0.0

func _ready() -> void:
	animated_sprite_2d.play("walking")
	_origin = global_position

func _physics_process(delta: float) -> void:
	if move_type == MoveType.STATIC:
		return
	_time += delta * speed / range_distance
	var offset := sin(_time) * range_distance
	var prev_x := global_position.x
	match move_type:
		MoveType.HORIZONTAL:
			global_position = _origin + Vector2(offset, 0)
			var dir := global_position.x - prev_x
			if dir != 0:
				animated_sprite_2d.flip_h = dir < 0
		MoveType.VERTICAL:
			global_position = _origin + Vector2(0, offset)
