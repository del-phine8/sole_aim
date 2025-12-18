extends Area2D
var player_in_area = false
var state := 0  # 0 = OFF, 1 = ON

@onready var l = $L

func _ready() -> void:
	
	$L.visible = false 
	 



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = true
		l.visible = true
	


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_area = false
		l.visible = false
		
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("lock"):

		# TURNING ON

		if state == 0:
			state = 1
			
		

			
			

		# TURNING OFF
		else:
			state = 0
			$sonlocked.play()
			
			
			 
