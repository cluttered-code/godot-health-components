@tool
class_name HurtBox2D extends Area2D

@export var health: Health

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	var hitbox := area as HitBox2D
	if not hitbox:
		return
	
	match hitbox.Action:
		HitBox2D.Action.DAMAGE:
			health.damage(hitbox.amount)
		HitBox2D.Action.HEAL:
			health.heal(hitbox.amount)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if not health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings
