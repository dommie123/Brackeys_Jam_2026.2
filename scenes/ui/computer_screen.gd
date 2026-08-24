extends Control

signal tweeter_lookup(name: String)
signal db_lookup(name: String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_tweeter_icon_pressed() -> void:
	print("Going to Tweeter...")
	reset_computer_state();
	$TweeterScreen.visible = true;
	

func _on_amazing_on_icon_pressed() -> void:
	print("Going to Amazing On...")
	reset_computer_state();
	$AmazingOnScreen.visible = true;


func _on_quokka_db_icon_pressed() -> void:
	print("Going to QuokkaDB...")
	reset_computer_state();
	$QuokkaDBScreen.visible = true;
	

func _on_close_btn_pressed() -> void:
	print("Going Home...")
	reset_computer_state();
	$ComputerHomeScreen.visible = true;
	
	
func reset_computer_state() -> void:
	$ComputerHomeScreen.visible = false;
	$TweeterScreen.visible = false;
	$AmazingOnScreen.visible = false;
	$QuokkaDBScreen.visible = false;
