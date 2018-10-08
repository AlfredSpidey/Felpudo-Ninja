extends Node2D

onready var fruits = get_node("Fruits")

var pear = preload("res://scenes//Pear.tscn")
var orange = preload("res://scenes//Orange.tscn")
var banana = preload("res://scenes//Banana.tscn")
var lemon = preload("res://scenes//Lemon.tscn")
var avocado = preload("res://scenes//Avocado.tscn")
var pineapple = preload("res://scenes//PineApple.tscn")
var tomato = preload("res://scenes//Tomato.tscn")
var watermelon = preload("res://scenes//Watermelon.tscn")
var bomb = preload("res://scenes//Bomb.tscn")


var score = 0
var lifes = 3

func _ready():
	
	pass


func _on_Generator_timeout():
	if lifes <= 0 : return
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0, 5))
		var obj
		if type == 0:
			obj = pineapple.instance()
		elif type == 1:
			obj = pear.instance()
		elif type == 2:
			obj = bomb.instance()
		elif type == 3:
			obj = watermelon.instance()
		elif type == 4:
			obj = orange.instance()
		elif type == 5:
			obj = lemon.instance()
		elif type == 6:
			obj == banana.instance()
		elif type == 7:
			obj == avocado.instance()
		
		
		obj.born(Vector2(rand_range(200, 1080), 800))
		
		obj.connect("life", self, "dec_life")
		
		if type != 2:
			obj.connect("score", self, "inc_score")
		
		fruits.add_child(obj)
		



func dec_life():
	lifes -= 1
	if lifes == 0:
		get_node("GameOverScreen").start()
		get_node("InputProc").acabou = true
		get_node("Control/Bomb1").set_modulate(Color(1,0,0))
	if lifes == 2:
		get_node("Control/Bomb3").set_modulate(Color(1,0,0))
	if lifes == 1:
		get_node("Control/Bomb2").set_modulate(Color(1,0,0))



func inc_score():
	if lifes == 0 : return
	score += 1
	get_node("Control/Label").set_text(str(score))
