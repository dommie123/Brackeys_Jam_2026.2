extends Node2D

signal offer_accepted(order: Order, ivd: float, type: Customer.CustomerType);
signal offer_rejected(ivd: float);

var instance: Customer;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_offer_made(order: Order, askPrice: float) -> void:
	var ivd = calculateIVD(order.calculate_total(), askPrice);
	var interestCheck = randf();
	
	if interestCheck <= ivd:
		offer_accepted.emit(order, ivd, instance.type);
	else:
		offer_rejected.emit(ivd);


func calculateIVD(totalMarketValue: float, askPrice: float) -> float:
	var ivd;
	
	match instance.type:
		Customer.CustomerType.KID:
			ivd = .6 + randf();
		Customer.CustomerType.NORMAL:
			ivd = .4 + (randf() * 2);
		Customer.CustomerType.NERD:
			ivd = .7 + (randf() * 2);
		Customer.CustomerType.SCALPER_1:
			ivd = 1
		Customer.CustomerType.SCALPER_2:
			ivd = .95 + (randf() / 2)
		Customer.CustomerType.SCALPER_3:
			ivd = .9 + (randf() / 2)
		Customer.CustomerType.CREATOR:
			ivd = .6
		Customer.CustomerType.INFLUENCER:
			ivd = .2 + (randf() * 2)
		Customer.CustomerType.MOTHER:
			ivd = .4 + (randf() * 2)
		_:
			ivd = 0
	
	var markedFactor = askPrice / totalMarketValue;
	if markedFactor < 0.5:
		markedFactor = 0.5;
	elif markedFactor > 2:
		markedFactor = 2;
	
	var demand = log(markedFactor) / log(2);
	demand /= 2;
	ivd += demand;
	
	if ivd < 0:
		ivd = 0;
	elif ivd > 1:
		ivd = 1;
	
	return ivd;
