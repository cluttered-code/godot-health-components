@tool
@icon("res://addons/health_hitbox_hurtbox/2d/hit_scan_2d/hit_scan_2d.svg")
class_name HitScan2D extends RayCast2D
## HitScan2D interacts with [HurtBox2D] to affect [Health] components.

## emitted when collision with [HitBox2D] detected.
## To cancel each other the [HitBox2D] will have to be [color=orange]queue_free()[/color]
## from hear because collision detection is one sided.
signal hit_box_entered(hit_box: HitBox2D)
## emitted when collision with [HurtBox2D] detected.
signal hurt_box_entered(hurt_box: HurtBox2D)
## emitted when collision with [Area2D] that isn't [HitBox2D] or [HurtBox2D].
## Used to detect things like environment.
signal unknown_area_entered(area: Area2D)


## The [Health.Action] to be performed.
@export var action: Health.Action = Health.Action.DAMAGE
## The amount of the action.
@export var amount: int = 1

# Here for testing, can't mock native node functions
var _collider: Node


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
	var collider = _collider if _collider else get_collider()
	if not collider:
		return
	
	if collider is HitBox2D:
		hit_box_entered.emit(collider)
		return
	
	if collider is not HurtBox2D:
		unknown_area_entered.emit(collider)
		return
	
	var hurt_box: HurtBox2D = collider
	match action:
		Health.Action.DAMAGE:
			hurt_box.damage(amount)
		Health.Action.HEAL:
			hurt_box.heal(amount)
	
	hurt_box_entered.emit(hurt_box)


## Returns the object's class name as a [String].
##func get_class() -> String: return "HitScan2D"
