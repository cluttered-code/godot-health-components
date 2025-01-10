@tool
class_name HurtBox3D extends Area3D

@export var health: Health = null:
	set(new_health):
		health = new_health
		if Engine.is_editor_hint():
			update_configuration_warnings()

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area3D) -> void:
	if area is not HitBox3D:
		return
	
	var hitbox := area as HitBox3D
	match hitbox.Action:
		HitBox3D.Action.DAMAGE:
			health.damage(hitbox.amount)
		HitBox3D.Action.HEAL:
			health.heal(hitbox.amount)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if health is not Health:
		warnings.append("This node requires a 'Health' component")
	
	return warnings
