extends Node2D

class_name  HitParticle


func _ready():
	$GPUParticles2D.emitting = true
	$GPUParticles2D.one_shot = true	


func setDirection(direction : Vector3):
	$GPUParticles2D.process_material.direction = direction * -1
