@tool
@icon("res://addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg")
class_name HurtBox3D extends Area3D
## HurtBox3D enables collision detection by [HitBox3D] or [HitScan3D] and applies affects to [Health].

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
	
	amount = roundi(amount * damage_multiplier)
	if amount == 0:
		return
	
	if amount < 0:
		health.heal(absi(amount))
		return
	
	health.damage(amount)


## Calculates and applies healing to associated [Health].
func heal(amount: int) -> void:
	if not health:
		push_error("%s is missing a 'Health' component" % self)
		return
	
	amount = roundi(amount * heal_multiplier)
	if amount == 0:
		return
	
	if amount < 0:
		health.damage(absi(amount))
		return
	
	health.heal(amount)


# Warn users if values haven't been configured.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if health is not Health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings


## Returns the object's class name as a [String].
func get_class() -> String: return "HurtBox3D"
