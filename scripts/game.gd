extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_computer_screen_db_lookup(name: String, isQuokka: bool) -> void:
	print("Looking up '" + name + "' " + ("in QuokkaDB" if isQuokka else "on Amazing On") + "...");


func _on_computer_screen_tweeter_lookup(name: String) -> void:
	print("Looking up '" + name + "' on Tweeter...");
