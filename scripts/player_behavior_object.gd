class_name PlayerBehaviorObject
extends Node

signal offer_made(order: Order, askPrice: float);
signal offer_refused(order: Order);

enum StoreMode {
	SAFE,
	DANGER
}

@export var reputation: int;
@export var repRisk: int;
@export var shelfInventory: Array[Card];
@export var storeInventory: Array[Card];
@export var money: float;
@export var mode: StoreMode;

var ccr: int # Consecutive customers refused

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_customer_offer_accepted(order: Order, ivd: float, type: Customer.CustomerType) -> void:
	pass


func _on_customer_offer_rejected(ivd: float) -> void:
	pass


func calculateRep(ivd: float, offerAccepted: bool) -> void:
	var repDiff;
	match mode:
		StoreMode.SAFE:
			repDiff = 0;
		StoreMode.DANGER:
			repDiff = -3;
	
	if ccr > 2:
		repDiff -= pow(2, ccr - 3);
	
	repDiff += (round(ivd * 5) - (5 if not offerAccepted else 0));
	
	reputation = repDiff;


func calculateRisk(type: Customer.CustomerType) -> void:
	var riskDiff;
	match type:
		Customer.CustomerType.SCALPER_1, Customer.CustomerType.SCALPER_2, Customer.CustomerType.SCALPER_3:
			riskDiff = 10;
		_:
			riskDiff = 0 if repRisk == 0 else -1;
			
	repRisk += riskDiff;
