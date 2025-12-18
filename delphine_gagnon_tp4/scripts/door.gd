extends StaticBody2D

@onready var teleporte_piece = $door_cuisine/Area2D/teleporte_piece
@onready var teleporte_chambre = $door_chambre/Area_chambre/CollisionShape2D
@onready var chatmanger = get_node("../room1/messagecgat1/collision_chat")
@onready var portechatmanger = get_node("../room1/messagechat02/collision_chatporte")
@onready var collision_chamgre_bas = $door_chambre_enbas/collision_chambre_bas

@onready var cineswitch = $cineswitch/collision_switch


func _ready ():
	teleporte_piece.disabled = true
	teleporte_chambre.disabled = true 
	chatmanger.disabled = true 
	portechatmanger.disabled = true 
	collision_chamgre_bas.disabled = true
	$ending_brule/CanvasLayer.visible = false
	$bruit_pas_01/area_cuisine/locked.visible = false
	$apparition_A/a.visible = false
	cineswitch.disabled = true
	$ending_cheveux/collision_hair.disabled = true 
	  
	
func _process(delta):
	if $door_cuisine/collision_cuisine.disabled and $CollisionDoor.disabled and $door_cuisine/player_detecter2/cle.disabled:
		$porte_entrer/collision_fin.disabled = true
		$ending_cheveux/collision_hair.disabled = true
		$ending_brule/CollisionShape2D.disabled = false
		
	elif !$door_cuisine/collision_cuisine.disabled and $door_cuisine/player_detecter2/cle.disabled :
		$porte_entrer/collision_fin.disabled = true
		$ending_brule/CollisionShape2D.disabled = true
		$ending_cheveux/collision_hair.disabled = false
		
	else:
		$porte_entrer/collision_fin.disabled = false
		
		

	
func _on_player_detecter_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$AnimatedSprite2D.play("door_opened")
		$sound_door.play()
		await $AnimatedSprite2D.animation_finished
		$CollisionDoor.disabled = true
		$player_detecter/CollisionShape2D.disabled = true 
		await get_tree().create_timer(3).timeout
		$AnimatedSprite2D.play("door_closed")
		$sound_door_2.play()
		await $AnimatedSprite2D.animation_finished
		$CollisionDoor.disabled = false
		$player_detecter/CollisionShape2D.disabled = false 
		


func _on_player_detecter_2_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$door_cuisine/player_detecter2/Clef.visible = false
		$door_cuisine/player_detecter2/cle_sound.play()
		
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 1647
			cam.limit_right = 3665
			cam.limit_top = -2352
			cam.limit_bottom = -880


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -991
			cam.limit_bottom = 1135


func _on_player_detecter_chambre_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$door_chambre/AnimatedSprite2D.play("chambre_ouvre")
		$sound_door.play()
		await $door_chambre/AnimatedSprite2D.animation_finished
		$door_chambre/CollisionShape2D.disabled = true
		teleporte_chambre.disabled = false
		$door_chambre/player_detecter_chambre/collision_chambre.set_deferred("disabled", true) 
		


func _on_area_chambre_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_chambre/Area_chambre/marker_chambre.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 5394
			cam.limit_right = 7553
			cam.limit_top = -2288
			cam.limit_bottom = -1168


func _on_retourcouloir_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($retourcouloir/Marker2D.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 3952
			cam.limit_right = 6448
			cam.limit_top = -1135
			cam.limit_bottom = -209


func _on_area_garderobe_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$door_garde_robe/door_garderobe.play("graderobe_ouvre")
		$sound_door.play()
		await $door_garde_robe/door_garderobe.animation_finished
		$door_garde_robe/collision_garde_robe.disabled = true
		
		$door_garde_robe/area_garderobe/CollisionShape2D.set_deferred("disabled", true)


func _on_area_teleporte_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_garde_robe/area_teleporte/garde_robe.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 3797
			cam.limit_right = 5600
			cam.limit_top = -4428
			cam.limit_bottom = -3168
			


func _on_retour_couloir_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($retour_couloir_2/couloir2.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 3952
			cam.limit_right = 6448
			cam.limit_top = -1135
			cam.limit_bottom = -209



			


func _on_entrer_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 1904
			cam.limit_top = -176
			cam.limit_bottom = 1135
			


func _on_chambre_bas_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 1728
			cam.limit_right = 3664
			cam.limit_top = -176
			cam.limit_bottom = 882


func _on_ending_brule_body_entered(body: Node2D) -> void:
		if body.is_in_group("player"):
			$ending_brule/CanvasLayer.visible = true
			$ending_brule/CanvasLayer/stove.play()
			await get_tree().create_timer(1).timeout 
			get_tree().change_scene_to_file("res://ending_brule.tscn")


func _on_entrer_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -991
			cam.limit_bottom = -63


func _on_chambre_bas_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -991
			cam.limit_bottom = -63


func _on_in_switch_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($in_switch/garde_robe_switch.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 5935
			cam.limit_right = 7814
			cam.limit_top = -4576
			cam.limit_bottom = -3264


func _on_retour_couloir_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($retour_couloir_2/couloir2.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 3952
			cam.limit_right = 6448
			cam.limit_top = -1135
			cam.limit_bottom = -209


func _on_play_detector_sallebain_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$door_salle_bain/AnimatedSprite2D.play("salle_ouvre")
		$sound_door.play()
		await $door_salle_bain/AnimatedSprite2D.animation_finished
		$door_salle_bain/CollisionShape2D.disabled = true
		$door_salle_bain/play_detector_sallebain/CollisionShape2D.disabled = true 
		await get_tree().create_timer(3).timeout
		


func _on_area_teleporte_bain_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_salle_bain/area_teleporte_bain/Marker_sall_bain.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 8280
			cam.limit_right = 10204
			cam.limit_top = -4661
			cam.limit_bottom = -3248


func _on_area_retour_chambre_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_salle_bain/area_retour_chambre/retour_chambre.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 5394
			cam.limit_right = 7553
			cam.limit_top = -2288
			cam.limit_bottom = -1168
			


func _on_area_switch_bain_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_salle_bain/area_retour_chambre/retour_chambre.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 5394
			cam.limit_right = 7553
			cam.limit_top = -2288
			cam.limit_bottom = -1168


func _on_area_teleporte_switch_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($door_salle_bain/area_teleporte_switch/Marker_switch_bain.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 11045
			cam.limit_right = 12949
			cam.limit_top = -4896
			cam.limit_bottom = -3248


func _on_bruit_pas_01_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$bruit_pas_01/CollisionShape2D.set_deferred("disabled", true)
		$bruitpas_loin.play()
		await $bruitpas_loin.finished
		$bruitporte_v2.play()
		$door_cuisine/cuisine_anim.play("ouvre_cuisine")
		await $door_cuisine/cuisine_anim.animation_finished
		$door_cuisine/collision_cuisine.disabled = true
		teleporte_piece.disabled = false 
		 
		$bruit_pas_01/area_cuisine/CollisionShape2D.disabled = true 
		chatmanger.disabled = false
		
		portechatmanger.disabled = false
		$bruit_pas_01/area_cuisine.set_deferred("disabled", true)


func _on_area_cuisine_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$bruit_pas_01/area_cuisine/locked.visible = true
		
func _on_area_cuisine_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$bruit_pas_01/area_cuisine/locked.visible = false


func _on_player_detecter_2_body_exited(body: Node2D) -> void:
	$door_cuisine/player_detecter2/cle.set_deferred("disabled", true)
	$cantleave/CollisionShape2D.set_deferred("disabled",true)
	


func _on_apparition_a_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$apparition_A/a.visible = true 


func _on_apparition_a_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$apparition_A/spawn_map1.set_deferred("disabled", true)
		$apparitionA2/spawn_map2.set_deferred("disabled", true)
		
	


func _on_apparition_a_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$apparition_A/a.visible = true 


func _on_apparition_a_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$apparitionA2/spawn_map2.set_deferred("disabled", true)
		$apparition_A/spawn_map1.set_deferred("disabled", true) 


func _on_area_cine_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$door_cinema/door_cine.play("cine_ouvre")
		$sound_door.play()
		await $door_cinema/door_cine.animation_finished
		$door_cinema/CollisionShape2D.disabled = true
		$door_cinema/area_cine/collision_cine.disabled = true 
		await get_tree().create_timer(3).timeout
		

func _on_area_box_body_entered(body: Node2D) -> void:
	$area_box/clebox.visible = false


func _on_cine_norm_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($cine_norm/Marker_norm.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = -5420
			cam.limit_right = -2621
			cam.limit_top = -4516
			cam.limit_bottom = -2832
			
			


func _on_area_switch_lowersousol_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($area_switch_lowersousol/lowersousol.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = -2017
			cam.limit_right = 176
			cam.limit_top = -991
			cam.limit_bottom = 688





	


func _on_area_retour_lowersousol_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($area_retour_lowersousol/lowersousoul_retour.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = -2017
			cam.limit_right = 176
			cam.limit_top = -991
			cam.limit_bottom = 688


func _on_area_retour_couloirbas_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($area_switch_lowersousol/area_retour_couloirbas/marker_retour_couloirbas.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -991
			cam.limit_bottom = -63


func _on_ending_cheveux_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/ending_grabbed.tscn")


func _on_area_map_i_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$area_map_i/CanvasLayer_fuckingI.visible = true 
		
func _on_area_map_i_body_exited(body: Node2D) -> void:
	
	$area_map_i/collision_map.set_deferred("disabled", true)
 


func _on_area_map_v_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$area_map_v1/CanvasLayer.visible = true 
		$area_map_v2/collision_map_v2.set_deferred("disabled", true)
		$area_map_v1/collision_map_v.set_deferred("disabled", true)


func _on_area_map_v_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$area_map_v1/CanvasLayer.visible = true 
		$area_map_v2/collision_map_v2.set_deferred("disabled", true)
		$area_map_v1/collision_map_v.set_deferred("disabled", true)


func _on_area_lavage_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = -680
			cam.limit_right = 1614
			cam.limit_top = -2351
			cam.limit_bottom = -879
			


func _on_area_lavage_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		var cam = body.get_node_or_null("camera1")  # <-- adjust this name/path!
		if cam:
			cam.make_current()
			cam.limit_left = 0
			cam.limit_right = 3665
			cam.limit_top = -991
			cam.limit_bottom = -63



	


func _on_cantleave_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Keymessage.visible = true
		
func _on_cantleave_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		$Keymessage.visible = false


func _on_pile_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$pile/PileOfClothes.visible = false 
		$pile/collision_pile.set_deferred("disabled",true)


func _on_cineswitch_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($cineswitch/marker_switch.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = -1505
			cam.limit_right = 944
			cam.limit_top = -5366
			cam.limit_bottom = -3249


func _on_retour_lower_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.set_position($area_retour_lowersousol/lowersousoul_retour.global_position)
		var cam = body.get_node_or_null("camera1")  
		if cam:
			cam.make_current()
			cam.limit_left = -2017
			cam.limit_right = 176
			cam.limit_top = -991
			cam.limit_bottom = 688
