class_name Health extends Node
## Health is used to track the owner's health, death, and revival.

## Emitted after damage is applied.
signal damaged(owner: Node, amount: int, applied: int)
## Emitted after damage is applied when death has occured.
signal died(owner: Node)

## Emitted after healing is applied.
signal healed(owner: Node, amount: int, applied: int)
## Emitted after healing is applied when dead.
signal revived(owner: Node)


## Emitted when damaged and entity had full health.
signal first_hit(owner: Node)
## Emitted when trying to damage an entity that is not damageable.
signal not_damageable(owner: Node)
## Emitted when damaging and current health is already zero.
signal already_dead(owner: Node)
## Emitted when trying to apply enough damage to an enemy to kill them and they cannot be.
signal not_killable(owner: Node)


## Emitted when trying to heal and entity is not healable.
signal not_healable(owner: Node)
## Emitted when healing and current health is already full.
signal already_full(owner: Node)
## Emitted when trying to heal a dead entity that is not revivable
signal not_revivable(owner: Node)

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


## Returns [color=orange]true[/color] when current health is greater than 0.
func is_alive() -> bool:
	return current > 0


## Returns [color=orange]true[/color] when not alive.
func is_dead() -> bool:
	return not is_alive()


## Return [color=orange]true[/color] when current health is max.
func is_full() -> bool:
	return current == max


## Returns the percent of current to maximum health.
func percent() -> float:
	return minf(float(current) / float(max), 1.0)


## Apply the specified amount of damage if damageable and not dead.
func damage(amount: int) -> void:
	if not damageable:
		print_debug("%s cannot be damaged" % owner)
		not_damageable.emit(owner)
		return
	
	if is_dead():
		print_debug("%s is already dead" % owner)
		already_dead.emit(owner)
		return
	
	var applied := clampi(amount, 0, current)

	if applied == current and not killable:
		print_debug("%s is not killable" % owner)
		not_killable.emit(owner)
		return

	var is_first_hit := is_full() and applied > 0
	current -= applied
	print_debug("%s damaged amount=%d applied=%d current=%d" % [owner, amount, applied, current])
	damaged.emit(owner, amount, applied)
	if is_first_hit:
		print_debug("%s first hit" % owner)
		first_hit.emit(owner)
	
	if is_dead():
		print_debug("%s died" % owner)
		died.emit(owner)


## apply the specified amount of healing if healable, not full, or dead and revivable.
func heal(amount: int) -> void:
	if not healable:
		print_debug("%s is not healable" % owner)
		not_healable.emit(owner)
		return
	
	if is_full():
		print_debug("%s already has full health" % owner)
		already_full.emit(owner)
		return
	
	if is_dead() and not revivable:
		print_debug("%s cannot be revived" % owner)
		not_revivable.emit(owner)
		return
	
	var notify_revived := is_dead() and amount > 0
	
	var applied := clampi(amount, 0, max - current)
	current += applied
	print_debug("%s healed amount=%d applied=%d current=%d" % [owner, amount, applied, current])
	healed.emit(owner, amount, applied)
	
	if notify_revived:
		print_debug("%s revived" % owner)
		revived.emit(owner)


## Returns the object's class name as a [String].
func get_class() -> String: return "Health"
