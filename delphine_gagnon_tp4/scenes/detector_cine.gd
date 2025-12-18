extends Area2D

func _ready() -> void:
	$detector_cine/collision_cine.disabled = true 
	t.visible = false
	$detector_cine/collision_cine/yeux_sofa.visible = false
	$detector_cine/collision_cine/sanscle.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$detector_cine/collision_cine.disabled = false 


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$collision_bouffe.queue_free()



var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var t = $detector_cine/dontbehere
@onready var cherchechat2 = $detector_cine/collision_cine


 
func _on_detector_cine_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		t.visible = true
		player_in_area = true


func _on_detector_cine_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		t.visible = false
		player_in_area = false

	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("dontbehere"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$detector_cine/collision_cine/yeux_sofa.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$detector_cine/collision_cine/yeux_sofa.visible = false
			$detector_cine/collision_cine/sanscle.visible = true
			$detector_cine/collision_cine/clesound.play()
			await await get_tree().create_timer(1).timeout
			$detector_cine/collision_cine/sanscle.visible = false
			

			# OFF logic
			
			cherchechat2.queue_free()
