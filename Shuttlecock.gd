extends CharacterBody2D
class_name ShuttleCock

signal score()

const SPEED = 300.0

var tween : Tween
@export var running : bool = false
var speed : int = SPEED
var acceleration : int = 20

func _ready():
	start()


func start():
	running = false
	velocity.x = 1 * SPEED
	velocity.y = 0.05 * SPEED
	position.x = -436
	position.y = -28
	rotation = velocity.angle()


func SetPosition(pos : Vector2):
	position = pos
	rotation = velocity.angle()


func _process(delta):
	if Input.is_action_pressed("start"):
		running = true

func _physics_process(delta):

	if running:
		var collide = move_and_collide(velocity * delta)
		if collide:
			
			velocity = velocity.bounce(collide.get_normal()) + Vector2(float((randi() % 100)) / 10 - 5.0, float(randi() % 100) / 10 - 5.0)
			speed = speed + 10
			if velocity.x == 0:
				velocity.y = speed
			else:
				var ratio = abs(velocity.x / velocity.y)
				var x_delta = (ratio /(ratio + 1)) * acceleration
				var y_delta = (1 /(ratio + 1)) * acceleration
				velocity.x += x_delta if velocity.x > 0 else -1 * x_delta
				velocity.y += y_delta if velocity.y > 0 else -1 * y_delta
			tween = create_tween()
			tween.tween_property($".", "rotation", velocity.angle(), 1).set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_SINE)
			if collide.get_collider() == PlayerBat:
				score.emit()	
