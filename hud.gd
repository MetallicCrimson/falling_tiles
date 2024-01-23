extends CanvasLayer

signal start_game

var heart_full_texture = preload("res://heart_full.png")
var heart_empty_texture = preload("res://heart_empty.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func update_score(score):
	$ScoreLabel.text = str(score)


func display_hit(life):
	if life == 3:
		$Heart3.set_texture(heart_empty_texture)
	if life == 2:
		$Heart2.set_texture(heart_empty_texture)
	if life == 1:
		$Heart1.set_texture(heart_empty_texture)


func fill_hearts():
	$Heart1.set_texture(heart_full_texture)
	$Heart2.set_texture(heart_full_texture)
	$Heart3.set_texture(heart_full_texture)
