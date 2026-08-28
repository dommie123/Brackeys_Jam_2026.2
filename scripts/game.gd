extends Control

signal risk_check_failed();

@export var endTime: int;
@export var customersToGenerate: int;

var currentDay: int;
var customers: Array[Customer];
var currentTime: int;
var customerPointer: int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentDay = 1;
	currentTime = 0;
	customerPointer = -1;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_computer_screen_db_lookup(name: String, isQuokka: bool) -> void:
	print("Looking up '" + name + "' " + ("in QuokkaDB" if isQuokka else "on Amazing On") + "...");


func _on_computer_screen_tweeter_lookup(name: String) -> void:
	print("Looking up '" + name + "' on Tweeter...");


func next_customer() -> void:
	customerPointer += 1;
	$Customer.instance = customers[customerPointer];
	
	$Customer.texture = customers[customerPointer].charPortrait;
	# TODO swap old customer dialogue with new dialogue


func roll_risk_check() -> void:
	if $PlayerBehaviorObject.mode == PlayerBehaviorObject.StoreMode.DANGER:
		return;
	
	var riskCheck = randi_range(0, 100);
	if riskCheck < $PlayerBehaviorObject.repRisk:
		risk_check_failed.emit();


func generate_new_customers() -> void:
	if customersToGenerate == 0:
		print("ERROR! No customers to generate! Exiting game...");
		get_tree().quit(1)
	
	for i in range(customersToGenerate):
		customers[i] = Customer.new("Joe Shmoe", "123 Necroe Way", 23, 4564563, 
		"joeisashmoe77", "Hi, I am joe and I am a shmoe!", false, [], [], 735824095790324790, Customer.CustomerType.NORMAL, 
		7, []);


func _on_igt_timeout() -> void:
	currentTime += 1 if currentTime < endTime else 0;
