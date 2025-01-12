@tool
class_name HurtBox2D extends Area2D

@export var health: Health = null:
	set(new_health):
		health = new_health
		if Engine.is_editor_hint():
			update_configuration_warnings()


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if area is not HitBox2D:
		return
	
	if not health:
		print_debug("{0} is missing 'Health' component".format([self]))
		return
	
	var hitbox := area as HitBox2D
	match hitbox.action:
		HitBox2D.Action.DAMAGE:
			health.damage(hitbox.amount)
		HitBox2D.Action.HEAL:
			health.heal(hitbox.amount)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if health is not Health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings


## Returns the object's class name as a [String].
func get_class_name() -> String: return "HurtBox2D"
