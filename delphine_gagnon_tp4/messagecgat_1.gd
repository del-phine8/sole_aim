extends Area2D

@onready var chatbouffe = $img_message_chat1

func _ready() -> void:
	$img_message_chat1.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chatbouffe.visible = true 
		



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		chatbouffe.visible = false 
