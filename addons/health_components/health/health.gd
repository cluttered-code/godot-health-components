class_name Health extends Node


signal damaged(owner: Node, amount: int)
signal healed(owner: Node, amount: int)

signal changed(owner: Node)

signal died(owner: Node)
signal revived(owner: Node)

@export var current: int = 100
@export var max: int = 100

@export var damageable: bool = true
@export var healable: bool = true
@export var killable: bool = true
@export var revivable: bool = true


## returns "true" when not killable or current health is greater than 0, otherwise "false".
func is_alive() -> bool:
	return not killable or current > 0


## returns "true" when not alive, otherwise "false".
func is_dead() -> bool:
	return not is_alive()


## return "true" when current health is max, otherwise "false".
func is_full() -> bool:
	return current == max


## returns the percent of current to maximum health.
func percent() -> float:
	return minf(float(current) / float(max), 1.0)


## apply the specified amount of damage if damageable and not dead.
func damage(amount: int) -> void:
	if not damageable:
		print_debug("{0} cannot be damaged".format([owner]))
		return
	
	if is_dead():
		print_debug("{0} is already dead".format([owner]))
		return
	
	amount = clampi(amount, 0, current)
	current -= amount
	print_debug("{0} was damaged amount={1} current={2}".format([owner, amount, current]))
	damaged.emit(owner, amount)
	changed.emit(owner)
	
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
	
	amount = clampi(amount, 0, max - current)
	current += amount
	print_debug("{0} was healed amount={1} current={2}".format([owner, amount, current]))
	healed.emit(owner, amount)
	changed.emit(owner)
	
	if was_revived:
		print_debug("{0} was revived".format([owner]))
		revived.emit.call_deferred(owner)
