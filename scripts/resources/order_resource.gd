class_name Order
extends Resource

@export var purchases: Array[Purchase];

func calculate_total() -> float:
	var total = 0;
	for purchase in purchases:
		total += purchase.marketValue;
	return total;
