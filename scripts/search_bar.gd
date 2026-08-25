extends Control

signal search_conducted(term: String);

func _on_search_button_pressed() -> void:
	search_conducted.emit($SearchBox.text);
