@icon("res://addons/health_hitbox_hurtbox/3d/hit_box_3d/hit_box_3d.svg")
class_name HitBox3D extends Area3D
## [HitBox3D] is associated with an object that can collide with a [HurtBox3D].

## emitted when collision with [HitBox3D] detected.
signal hit_box_entered(hit_box: HitBox3D)
## emitted when collision with [HurtBox3D] detected.
signal hurt_box_entered(hurt_box: HurtBox3D)
## emitted when collision with [Area3D] that isn't [HitBox3D] or [HurtBox3D].
## Can be using to detect things like environment.
signal unknown_area_entered(area: Area3D)


## The [Health.Action] to be performed.
@export var action: Health.Action = Health.Action.DAMAGE
## The amount of the action.
@export var amount: int = 0
## Ignore collisions when [color=orange]true[/color].[br]
## Set this to [color=orange]true[/color] after a collision is detected to avoid
## further collisions.[br]
## It is recommended to set this to [color=orange]true[/color] before calling
## [color=orange]queue_free()[/color] to avoid further collisions.
@export var ignore_collisions: bool


func _ready() -> void:
	area_entered.connect(_on_area_entered)


## Detect collisions with [HitBox3D] or [HurtBox3D] and apply appropriate action.
func _on_area_entered(area: Area3D) -> void:
	if ignore_collisions:
		return
	
	if area is HitBox3D:
		hit_box_entered.emit(area)
		return
	
	if area is not HurtBox3D:
		unknown_area_entered.emit(area)
		return
	
	var hurt_box: HurtBox3D = area
	_hit_hurt_box(hurt_box)
	hurt_box_entered.emit(hurt_box)


## Perfomes the [Health.Action] on the specified [HurtBox3D].
func _hit_hurt_box(hurt_box: HurtBox3D) -> void:
	match action:
		Health.Action.DAMAGE:
			hurt_box.damage(amount)
		Health.Action.HEAL:
			hurt_box.heal(amount)


## Returns the object's class name as a [String].
func get_class() -> String: return "HitBox3D"
