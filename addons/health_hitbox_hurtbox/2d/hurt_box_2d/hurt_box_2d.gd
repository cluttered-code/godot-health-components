@tool
@icon("res://addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg")
class_name HurtBox2D extends Area2D
## HurtBox2D detectes collisions with [HitBox2D] and applies affects to [Health].

## The [Health] component to affect.
@export var health: Health = null:
	set(new_health):
		health = new_health
		if Engine.is_editor_hint():
			update_configuration_warnings()

## The multiplier to apply to all damage actions.
@export var damage_multiplier: float = 1.0
## The multiplier to apply to all heal actions.
@export var heal_multiplier: float = 1.0


## Calculates and applies damage to associated [Health].
func damage(amount: int) -> void:
	if not health:
		push_error("%s is missing a 'Health' component" % self)
		return
	
	health.damage(roundi(amount * damage_multiplier))


## Calculates and applies healing to associated [Health].
func heal(amount: int) -> void:
	if not health:
		push_error("%s is missing a 'Health' component" % self)
		return
	
	health.heal(roundi(amount * heal_multiplier))


# Warn users if values haven't been configured.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if health is not Health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings


## Returns the object's class name as a [String].
func get_class() -> String: return "HurtBox2D"
