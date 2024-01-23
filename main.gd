extends Node2D


@export var enemy_scene: PackedScene
var score
var life = 0
var default_enemy_timer = .5
var default_enemy_speed = 400
var paused_flag = false

var area_1_colliding = false
var area_2_colliding = false
var area_3_colliding = false
var area_4_colliding = false

var enemy_speed = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	$PauseButton.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("press_space") and life != 0 and not paused_flag:
		get_tree().paused = true
		paused_flag = true
		$PauseButton.show()
	else:
		paused_flag = false
	
	if $EnemyTimer.is_stopped():
		return
	
	if Input.is_action_just_pressed("press_1"):
		if area_1_colliding:
			add_score()
			$PlayArea1.show_success()
			area_1_colliding.queue_free()
		else:
			$PlayArea1.show_fail()
			handle_hit()
	if Input.is_action_just_pressed("press_2"):
		if area_2_colliding:
			add_score()
			$PlayArea2.show_success()
			area_2_colliding.queue_free()
		else:
			$PlayArea2.show_fail()
			handle_hit()
	if Input.is_action_just_pressed("press_3"):
		if area_3_colliding:
			add_score()
			$PlayArea3.show_success()
			area_3_colliding.queue_free()
		else:
			$PlayArea3.show_fail()
			handle_hit()
	if Input.is_action_just_pressed("press_4"):
		if area_4_colliding:
			add_score()
			$PlayArea4.show_success()
			area_4_colliding.queue_free()
		else:
			$PlayArea4.show_fail()
			handle_hit()

func new_game():
	if life == 0:
		score = 0
		life = 3
		enemy_speed = default_enemy_speed
		$EnemyTimer.wait_time = default_enemy_timer
		$HUD.update_score(score)
		$HUD.fill_hearts()
		$EnemyTimer.start()
		$GameoverHUD.hide()

func _on_enemy_timer_timeout():
	var enemy = enemy_scene.instantiate()
	var enemy_spawn_location = (randi_range(0, 3) * 105) + 55
	enemy.position.x = enemy_spawn_location
	enemy.speed = enemy_speed
	enemy_speed += 2
	enemy.losing_life.connect(handle_hit)
	add_child(enemy)
	
	# making it harder
	$EnemyTimer.wait_time -= .001

func add_score():
	score += 1
	$HUD.update_score(score)

func handle_hit():
	
	if $IframeTimer.is_stopped():
		if life == 0:
			game_over()
		else:
			$IframeTimer.start()
			$HUD.display_hit(life)
			life -= 1

func game_over():
	$EnemyTimer.stop()
	get_tree().call_group("enemies", "queue_free")
	$GameoverHUD.show()

func _on_play_area_1_area_entered(area):
	area_1_colliding = area
	
func _on_play_area_1_area_exited(_area):
	area_1_colliding = false


func _on_play_area_2_area_entered(area):
	area_2_colliding = area


func _on_play_area_2_area_exited(_area):
	area_2_colliding = false


func _on_play_area_3_area_entered(area):
	area_3_colliding = area


func _on_play_area_3_area_exited(_area):
	area_3_colliding = false


func _on_play_area_4_area_entered(area):
	area_4_colliding = area


func _on_play_area_4_area_exited(_area):
	area_4_colliding = false

func _on_pause_button_pressed():
	get_tree().paused = false
	$PauseButton.hide()
