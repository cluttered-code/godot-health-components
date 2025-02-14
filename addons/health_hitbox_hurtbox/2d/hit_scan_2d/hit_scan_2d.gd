@tool
@icon("res://addons/health_hitbox_hurtbox/2d/hit_scan_2d/hit_scan_2d.svg")
class_name HitScan2D extends RayCast2D
## HitScan2D interacts with [HurtBox2D] to affect [Health] components.


## The [Health.Action] to be performed.
@export var action: Health.Action = Health.Action.DAMAGE
## The amount of the action.
@export var amount: int = 0


func _enter_tree() -> void:
	# override default in editor
	if Engine.is_editor_hint():
		collide_with_areas = true


func _set(property: StringName, value: Variant) -> bool:
	if not Engine.is_editor_hint():
		return false
	
	## override default in editor
	match property:
		"collide_with_areas":
			collide_with_areas = true
		_:
			return false
	
	return true


## Detect collisions with [HurtBox2D] and apply appropriate action.
func fire() -> void:
	var hurt_box = get_collider() as HurtBox2D
	if not hurt_box:
		return
	
	match action:
		Health.Action.DAMAGE:
			hurt_box.damage(amount)
		Health.Action.HEAL:
			hurt_box.heal(amount)


## Returns the object's class name as a [String].
func get_class() -> String: return "HitScan2D"
