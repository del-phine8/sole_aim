extends Area2D

var player_in_area = false
@onready var f = $cantfar/f


func _ready() -> void:
	$area_food/CollisionShape2D.disabled = true
	$"../cherchelit/CollisionShape2D_lit".disabled = true
	$"../areacine/collision_cle_cine".disabled = true 
	f.visible = false   
	$cantfar/CollisionShape2D.disabled = true
	$"../bath/detect_player_bain/CollisionShape2D".disabled = true
	$"../area_trou_mur/collision_trou".disabled = true  
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_area = true
		$"../CatBiscuits".visible = false
		$"../ramasser_bouffe".play()
		$area_food/CollisionShape2D.call_deferred("set_disabled",false)
		$"../cherchelit/CollisionShape2D_lit".set_deferred("disabled", false)
		$"../areacine/collision_cle_cine".set_deferred("disabled", false)
		$cantfar/CollisionShape2D.set_deferred("disabled", false)
		$"../cle_litiere/collision_litiere".set_deferred("disabled", false)
		$"../bath/detect_player_bain/CollisionShape2D".set_deferred("disabled", false)
		$"../area_trou_mur/collision_trou".set_deferred("disabled", false) 
		

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_area = false
		$CollisionShape2D.set_deferred("disabled", true)
		$"../messagecgat1/collision_chat".set_deferred("disabled", true)
		 
		
func _on_cantfar_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		f.visible  = true


func _on_cantfar_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		f.visible  = false
		$cantfar/CollisionShape2D.set_deferred("disabled", true)
