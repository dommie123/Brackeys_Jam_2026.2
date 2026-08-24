extends Control

@export var card_data: Card

func _ready() -> void:
	$TextureRect.texture = card_data.image
