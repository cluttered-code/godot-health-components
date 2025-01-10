class_name Health extends Node


signal damaged(owner: Node, amount: int)
signal healed(owner: Node, amount: int)

signal changed(owner: Node)

signal died(owner: Node)
signal revived(owner: Node)

@export var current: int = 100
@export var max: int = 100


## returns "true" when current health is greater than 0, otherwise "false".
func is_alive() -> bool:
	return current > 0


## returns "true" when current health is 0, otherwise "false". 
func is_dead() -> bool:
	return not is_alive()


## return "true" when current health is max, otherwise "false".
func is_full() -> bool:
	return current == max


## returns the percent of current to maximum health.
func percent() -> float:
	return minf(float(current) / float(max), 1.0)


## apply the specified amount of damage.
func damage(amount: int) -> void:
	if is_dead():
		return

	amount = clampi(amount, 0, current)
	current -= amount
	print_debug("{0} - damaged amount={1} current={2}".format([owner, amount, current]))
	damaged.emit(owner, amount)
	changed.emit(owner)

	if is_dead():
		died.emit(owner)


## apply the specified amount of healing.
func heal(amount: int) -> void:
	if is_full():
		return

	var was_revived := is_dead() and amount > 0

	amount = clampi(amount, 0, max - current)
	current += amount
	print_debug("{0} - healed amount={1} current={2}".format([owner, amount, current]))
	healed.emit(owner, amount)
	changed.emit(owner)

	if was_revived:
		revived.emit(owner)
