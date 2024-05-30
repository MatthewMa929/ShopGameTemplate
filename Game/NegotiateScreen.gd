extends Control

@onready var inc_icon = $IncIcon
@onready var dec_icon = $DecIcon
@onready var price_box = $PriceBox
@onready var price_digit = $PriceDigit
@onready var price_box_arr = [price_box]
@onready var price_digit_arr = [price_digit]
@onready var digit_ptr = 0


func _ready():
	for i in range(Global.max_digits):
		duplicate_button(i)

func _process(delta):
	if Input.is_action_just_pressed("MoveDigitLeft"):
		inc_icon.position.x -= 64
		dec_icon.position.x -= 64
		digit_ptr += 1
	if Input.is_action_just_pressed("MoveDigitRight"):
		inc_icon.position.x += 64
		dec_icon.position.x += 64
		digit_ptr -= 1
	if Input.is_action_just_pressed("MoveDigitUp"):
		price_digit_arr[digit_ptr].text = "[color=black]" + str(int(price_digit_arr[digit_ptr].text) + 1)
	if Input.is_action_just_pressed("MoveDigitDown"):
		price_digit_arr[digit_ptr].text = "[color=black]" + str(int(price_digit_arr[digit_ptr].text) - 1)

func duplicate_button(num):
	var new_price_box = price_box.duplicate(true)
	var new_price_digit = price_digit.duplicate(true)
	var prev_price_digit = price_digit_arr[num]
	var prev_price_box = price_box_arr[num]
	new_price_digit.position = Vector2(prev_price_digit.position.x - 64, prev_price_digit.position.y)
	new_price_box.position = Vector2(prev_price_box.position.x - 64, prev_price_box.position.y)
	price_digit_arr.append(new_price_digit)
	price_box_arr.append(new_price_box)
	add_child(new_price_digit)
	add_child(new_price_box)

func change_price(new_price):
	pass
