extends Area2D

var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var h = $stop_hiding
@onready var cherchechat2 = $CollisionShape2D_lit


func _ready():
	h.visible = false
	cherchechat2.disabled = true
	$CanvasLayer_lit.visible = false
	 
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		h.visible = true
		player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		h.visible = false
		player_in_area = false


func _process(delta):
	if player_in_area and Input.is_action_just_pressed("hide"):

		# TURNING ON

		if state == 0:
			state = 1
			
			$CanvasLayer_lit.visible = true 
			 
			

		# TURNING OFF
		else:
			state = 0
			$CanvasLayer_lit.visible = false 
			
			$CollisionShape2D_lit.set_deferred("disabled", true)

			# OFF logic
			
			
