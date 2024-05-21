extends CharacterBody2D

const SPEED = 300.0

var tween : Tween

func _ready():
	velocity.x = 1 * SPEED


func _physics_process(delta):

	var collide = move_and_collide(velocity * delta)
	if collide:
		velocity = velocity.bounce(collide.get_normal()) + Vector2(float((randi() % 100)) / 10 - 5.0, float(randi() % 100) / 10 - 5.0)
		print(velocity)
		tween = create_tween()
		tween.tween_property($".", "rotation", velocity.angle(), 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
