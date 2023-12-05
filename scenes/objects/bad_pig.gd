extends CharacterBody2D

var SPEED = 50
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var isChasing = false

func _ready():
	get_node("AnimatedSprite2D").play("idle")

func _physics_process(delta):
	velocity.y += gravity * delta
	if isChasing:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("run")	
		player = get_node("../../Clin Wor")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Clin Wor":
		isChasing = true


func _on_player_detection_body_exited(body):
	if body.name == "Clin Wor":
		isChasing = false


func _on_player_kill_body_entered(body):
	if body.name == "Clin Wor":
		isChasing = false
		get_node("AnimatedSprite2D").play("death")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
