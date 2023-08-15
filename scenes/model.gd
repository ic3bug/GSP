extends Node3D

func _process(delta):
	
	if !owner.grounded:
		$AnimationPlayer.play("Fall")
	else:
		if owner.velocity.length() > 1.0:
			$AnimationPlayer.play("Run")
		else:
			$AnimationPlayer.play("Idle")
	
	if !is_multiplayer_authority():
		owner.position = lerp(owner.position, owner.target_position, delta * 10.0)
		owner.rotation.y = lerp_angle(owner.rotation.y, owner.target_rotation.y, delta * 10.0)
