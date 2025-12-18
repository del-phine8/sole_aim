extends CharacterBody2D
var direction = Vector2.ZERO;
var ACCELERATION = 700;
var MAX_SPEED = 140.0;

func _process(delta):
	direction = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
 
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk_side"
		$AnimatedSprite2D.flip_v = false
		# See the note below about the following boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x > 0
	if velocity.y < 0:
		$AnimatedSprite2D.animation = "walk_up"
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "walk_down"
		
func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta);
	else:
		velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta);

	move_and_slide();
	
	
