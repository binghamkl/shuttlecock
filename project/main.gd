extends Node2D

var particleScene : PackedScene = null
var score : int = 0
var instruction_message = "Congrats you scored {score}

Use the up/down arrows on the keyboard to move.  
Space to start the shuttlecock.

You get 10 points each time you hit the shuttlecock, and with each bounce it speeds up."

func _ready():
	$"Directions and Score".popup()
	particleScene = preload("res://CollisionParticle.tscn")

func _process(_delta):
	if !$Shuttlecock.running:
		$Shuttlecock.SetPosition($PlayerBat.position + Vector2(100, 0))


func _on_area_2d_body_entered(_body):
	var lastScore = score
	$"Directions and Score".popup()
	$"Directions and Score/Directions".text = instruction_message.format({"score":lastScore})
	$Shuttlecock.start()
	score = 0
	$"Score Label/ScoreValue".text = str(score)

func _on_shuttlecock_score():
	score += 10
	$"Score Label/ScoreValue".text = str(score)


func _on_shuttlecock_bounce(direction, pos):
	# fire off a particle effect.
	var particle = particleScene.instantiate() as HitParticle
	particle.global_position = pos
	particle.setDirection(Vector3(direction.x, direction.y, 0))
	$Particles.call_deferred('add_child', particle)
