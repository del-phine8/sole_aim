extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var t = $dontbehere
@onready var cherchechat2 = $collision_cle_cine


func _ready() -> void: 
	t.visible = false
	$CanvasLayer2.visible = false
	$CanvasLayer.visible = false
	$"../lock_the_door/collision_lock".disabled = true 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		t.visible = true
		player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		
		t.visible = false
		player_in_area = false
	

	

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("dontbehere"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$CanvasLayer2.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$CanvasLayer2.visible = false
			$CanvasLayer.visible = true
			$soncle.play()
			await await get_tree().create_timer(1).timeout
			$CanvasLayer.visible = false
			$"../lock_the_door/collision_lock".disabled = false 
			
			

			# OFF logic
			
			cherchechat2.set_deferred("disabled", true)
