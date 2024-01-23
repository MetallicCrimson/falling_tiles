extends CanvasLayer

signal starting

# Called when the node enters the scene tree for the first time.
func _ready():
	$HelpText.hide()
	$AboutText.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_button_pressed():
	if not ($HelpText.visible or $AboutText.visible):
		starting.emit()


func _on_help_button_pressed():
	if $HelpText.visible:
		$HelpText.hide()
	else:
		if $AboutText.visible:
			$AboutText.hide()
		$HelpText.show()


func _on_about_button_pressed():
	if $AboutText.visible:
		$AboutText.hide()
	else:
		if $HelpText.visible:
			$HelpText.hide()
		$AboutText.show()
