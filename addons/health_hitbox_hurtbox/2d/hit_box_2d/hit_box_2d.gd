@icon("res://addons/health_hitbox_hurtbox/2d/hit_box_2d/hit_box_2d.svg")
class_name HitBox2D extends Area2D
## [HitBox2D] is associated with an object that can collide with a [HurtBox2D].

## emitted when collision with [HitBox2D] detected.
signal hit_box_entered(hit_box: HitBox2D)
## emitted when collision with [HurtBox2D] detected.
signal hurt_box_entered(hurt_box: HurtBox2D)


## The [Health.Action] to be performed.
@export var action: Health.Action = Health.Action.DAMAGE
## The amount of the action.
@export var amount: int = 0
## Ignore collisions when [color=orange]true[/color].
@export var ignore_collisions: bool


func _ready() -> void:
	area_entered.connect(_on_area_entered)


## Detect collisions with [HitBox2D] or [HurtBox2D] and apply appropriate action.
func _on_area_entered(area: Area2D) -> void:
	if ignore_collisions:
		return
	
	if area is HitBox2D:
		hit_box_entered.emit(area)
		return
	
	if area is not HurtBox2D:
		return
	
	var hurt_box: HurtBox2D = area
	_hit_hurt_box(hurt_box)
	hurt_box_entered.emit(hurt_box)


## Perfomes the [Health.Action] on the specified [HurtBox2D].
func _hit_hurt_box(hurt_box: HurtBox2D) -> void:
	match action:
		Health.Action.DAMAGE:
			hurt_box.damage(amount)
		Health.Action.HEAL:
			hurt_box.heal(amount)


## Returns the object's class name as a [String].
func get_class() -> String: return "HitBox2D"
