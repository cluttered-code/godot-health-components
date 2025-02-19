@tool
@icon("res://addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg")
class_name HurtBox2D extends Area2D
## HurtBox2D enables collision detection by [HitBox2D] or [HitScan2D] and applies affects to [Health].

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

@export_group("Advanced")
## Applies healing to [Health] when [color=orange]damage()[/color] is called.
@export var heal_on_damage: bool = false
## Applies damage to [Health] when [color=orange]heal()[/color] is called.
@export var damage_on_heal: bool = false



## Calculates and applies damage to associated [Health].
## Will apply healing to [Health] if `heal_on_damage` set to [color=orange]true[/color].
func damage(amount: int) -> void:
	if not health:
		push_error("%s is missing a 'Health' component" % self)
		return
	
	amount = roundi(amount * damage_multiplier)
	if amount == 0:
		return
	
	if heal_on_damage:
		health.heal(amount)
		return
	
	health.damage(amount)


## Calculates and applies healing to associated [Health].
## Will apply damage to [Health] if `damage_on_heal` set to [color=orange]true[/color].
func heal(amount: int) -> void:
	if not health:
		push_error("%s is missing a 'Health' component" % self)
		return
	
	amount = roundi(amount * heal_multiplier)
	if amount == 0:
		return
	
	if damage_on_heal:
		health.damage(amount)
		return
	
	health.heal(amount)


# Warn users if values haven't been configured.
func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if health is not Health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings


## Returns the object's class name as a [String].
func get_class() -> String: return "HurtBox2D"
