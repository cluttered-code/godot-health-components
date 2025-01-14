class_name HitBox3D extends Area3D
## HitBox3D is associated with an object that can collide with a [HurtBox3D].

## Possible actions to performed.
enum Action {DAMAGE, HEAL}

## The [Action] to be performed.
@export var action: Action = Action.DAMAGE
## The amount of the action.
@export var amount: int = 0


## Returns the object's class name as a [String].
func get_class() -> String: return "HitBox3D"
