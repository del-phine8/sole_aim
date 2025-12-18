extends CollisionShape2D

@onready var text_label= $"../Label"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		text_label.visible = true
		


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		text_label.visible = false
