extends Area2D

signal losing_life

@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.y -= 70

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y += delta * speed


func _on_visible_on_screen_notifier_2d_screen_exited():
	losing_life.emit()
	$ColorRect.scale.y = 1.7
	$ColorRect.color = Color.RED
	await get_tree().create_timer(.1).timeout
	queue_free()
