extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var y = $y
@onready var cherchechat3 = $collision_litiere


func _ready() -> void: 
	y.visible = false
	$collision_litiere/sanscle.visible = false
	$collision_litiere/aveccle.visible = false
	$collision_litiere.disabled = true 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		y.visible = true
		player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		y.visible = false
		player_in_area = false
	

	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("smelly"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$collision_litiere/aveccle.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$collision_litiere/aveccle.visible = false
			$collision_litiere/sanscle.visible = true
			$"../areacine/soncle".play()
			await await get_tree().create_timer(1).timeout
			$collision_litiere/sanscle.visible = false
			 
			
			

			# OFF logic
			
			cherchechat3.set_deferred("disabled", true)
