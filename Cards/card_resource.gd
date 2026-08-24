class_name Card
extends TextureRect

## Base card resource

@export var card_name: String
@export var rarity: int
@export var shiny: bool
@export var real: bool = true
@export var market_value: int
@export var image: Texture

func _ready() -> void:
	texture = image
