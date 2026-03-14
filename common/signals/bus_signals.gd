extends Node

signal jumped(force: float, angle_rad: float)
signal collected
signal coin_updated(collected: int, total: int)
signal player_died
signal life_updated(current: int, max_lives: int)
