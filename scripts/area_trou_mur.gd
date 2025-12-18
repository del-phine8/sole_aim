extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

func _ready() -> void:
	$sansbouffe.visible = false
	$avec_bouffe.visible = false
	$meow.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$meow.visible = true
		player_in_area = true 


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$meow.visible = false
		player_in_area = true
		
		
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("meow"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$sansbouffe.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$sansbouffe.visible = false
			$sonbouffe2.play()
			$avec_bouffe.visible = true
			
			await await get_tree().create_timer(1).timeout
			$avec_bouffe.visible = false
			$"../lock_the_door/collision_lock".disabled = false
			$"../messagechat02/collision_chatporte".set_deferred("disabled",true) 
			$"../food_detector/cantfar/CollisionShape2D".set_deferred("disabled",true)
			$"../food_detector/area_food/CollisionShape2D".set_deferred("disabled",true)
			

			# OFF logic
			
			$collision_trou.set_deferred("disabled", true)
