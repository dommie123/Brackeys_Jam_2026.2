class_name Customer
extends Resource

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
@export var purchaseHistory: Array;
@export var creditCardNumber: int;
