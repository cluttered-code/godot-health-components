class_name HitBox2D extends Area2D
## HitBox2D is associated with an object that can collide with a [HurtBox2D].

## Possible actions to performed.
enum Action {DAMAGE, HEAL}

## The [Action] to be performed.
@export var action: Action = Action.DAMAGE
## The amount of the action.
@export var amount: int = 0


## Returns the object's class name as a [String].
func get_class() -> String: return "HitBox2D"
