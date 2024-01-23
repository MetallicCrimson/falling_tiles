extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func show_success():
	$ColorRect.color = Color.DARK_GOLDENROD
	await get_tree().create_timer(.05).timeout
	$ColorRect.color = Color.WHITE

func show_fail():
	$ColorRect.color = Color.RED
	await get_tree().create_timer(.05).timeout
	$ColorRect.color = Color.WHITE
