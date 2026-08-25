extends Control

signal tweeter_lookup(name: String)
signal db_lookup(name: String, isQuokka: bool)


func _on_tweeter_icon_pressed() -> void:
	reset_computer_state();
	$TweeterScreen.visible = true;


func _on_amazing_on_icon_pressed() -> void:
	reset_computer_state();
	$AmazingOnScreen.visible = true;


func _on_quokka_db_icon_pressed() -> void:
	reset_computer_state();
	$QuokkaDBScreen.visible = true;


func _on_close_btn_pressed() -> void:
	reset_computer_state();
	$ComputerHomeScreen.visible = true;


func reset_computer_state() -> void:
	$ComputerHomeScreen.visible = false;
	$TweeterScreen.visible = false;
	$AmazingOnScreen.visible = false;
	$QuokkaDBScreen.visible = false;


func _on_tweeter_search_bar_search_conducted(term: String) -> void:
	tweeter_lookup.emit(term);


func _on_amazing_on_search_bar_search_conducted(term: String) -> void:
	db_lookup.emit(term, false);


func _on_quokka_db_search_bar_search_conducted(term: String) -> void:
	db_lookup.emit(term, true);


# TODO display search results upon receiving them from the database.
