class_name Customer
extends Resource

enum CustomerType {
	KID,
	NORMAL,
	NERD,
	SCALPER_1,
	SCALPER_2,
	SCALPER_3,
	CREATOR,
	INFLUENCER,
	MOTHER
}

# General Customer Properties
@export var charPortrait: Texture;  # The portrait to be used outside of computer mechanics

# Properties specifically tied to their ID card
@export_category("ID Properties")
@export var legalName: String;
@export var address: String;
@export var age: int;
@export var idNumber: int;

# Properties specifically tied to their social media account
@export_category("Social Media Properties")
@export var username: String;
@export var bio: String;
@export var private: bool;
@export var posts: Array;

# Properties specifically tied to their customer database entry
@export_category("Database Properties")
@export var purchaseHistory: Array[Order];
@export var creditCardNumber: int;

# Hidden Customer Properties (The player is not meant to see these)
var type: CustomerType;
var cardInterest: int; # How much the customer is willing to pay for the card
var dialogueList: Array[String];

func _init(p_legalName: String, p_address: String, p_age: int, p_idNumber: int, p_username: 
String, p_bio: String, p_private: bool, p_posts: Array, p_purchaseHistory: Array[Order], 
p_creditCardNumber: int, p_type: CustomerType, p_cardInterest: int, p_dialogueList: Array[String]) -> void:
	legalName = p_legalName;
	address = p_address;
	age = p_age;
	idNumber = p_idNumber;
	username = p_username;
	bio = p_bio;
	private = p_private;
	purchaseHistory = p_purchaseHistory;
	creditCardNumber = p_creditCardNumber;
	type = p_type;
	cardInterest = p_cardInterest;
	dialogueList = p_dialogueList;
