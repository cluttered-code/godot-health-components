@tool
class_name HurtBox3D extends Area3D

@export var health: Health

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area3D) -> void:
	var hitbox := area as HitBox3D
	if not hitbox:
		return
	
	match hitbox.Action:
		HitBox3D.Action.DAMAGE:
			health.damage(hitbox.amount)
		HitBox3D.Action.HEAL:
			health.heal(hitbox.amount)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if not health:
		warnings.append("This Node requires a Health component")
	
	return warnings
