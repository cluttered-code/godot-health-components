class_name Health extends Node
## Health is used to track the owner's health, death, and revival.

## Emitted after damage is applied.
signal damaged(owner: Node, amount: int)
## Emitted after damage is applied when death has occured.
signal died(owner: Node)

## Emitted after healing is applied.
signal healed(owner: Node, amount: int)
## Emitted after healing is applied when dead.
signal revived(owner: Node)

## The current amount of health.
@export var current: int = 100
## The maximum amount of health.
@export var max: int = 100

@export_category("Conditions")
## Enable if owner is capable of taking damage.
@export var damageable: bool = true
## Enable if owner is capable of being healed.
@export var healable: bool = true
## Enable if owner is able to be killed.
@export var killable: bool = true
## Enable if owner is able to be revived from death.
@export var revivable: bool = true


## Returns [color=orange]true[/color] when not killable or current health is greater than 0.
func is_alive() -> bool:
	return not killable or current > 0


## Returns [color=orange]true[/color] when not alive.
func is_dead() -> bool:
	return not is_alive()


## Return [color=orange]true[/color] when current health is max, otherwise "false".
func is_full() -> bool:
	return current == max


## Returns the percent of current to maximum health.
func percent() -> float:
	return minf(float(current) / float(max), 1.0)


## Apply the specified amount of damage if damageable and not dead.
func damage(amount: int) -> void:
	if not damageable:
		print_debug("{0} cannot be damaged".format([owner]))
		return
	
	if is_dead():
		print_debug("{0} is already dead".format([owner]))
		return
	
	current -= clampi(amount, 0, current)
	print_debug("{0} was damaged amount={1} current={2}".format([owner, amount, current]))
	damaged.emit(owner, amount)
	
	if is_dead():
		print_debug("{0} died".format([owner]))
		died.emit.call_deferred(owner)


## apply the specified amount of healing if healable, not full, or dead and revivable.
func heal(amount: int) -> void:
	if not healable:
		print_debug("{0} is not healable".format([owner]))
		return
	
	if is_full():
		print_debug("{0} already has full health".format([owner]))
		return
	
	if is_dead() and not revivable:
		print_debug("{0} cannot be revived".format([owner]))
		return
	
	var was_revived := is_dead() and amount > 0
	
	current += clampi(amount, 0, max - current)
	print_debug("{0} was healed amount={1} current={2}".format([owner, amount, current]))
	healed.emit(owner, amount)
	
	if was_revived:
		print_debug("{0} was revived".format([owner]))
		revived.emit.call_deferred(owner)


## Returns the object's class name as a [String].
func get_class_name() -> String: return "Health"
