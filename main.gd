extends Node2D

var score : int = 0

func _process(delta):
	if !$Shuttlecock.running:
		$Shuttlecock.SetPosition($PlayerBat.position + Vector2(100, 0))

func _on_area_2d_body_entered(body):
	$Shuttlecock.start()


func _on_shuttlecock_score():
	score += 10
