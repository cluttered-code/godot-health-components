extends Node


func _ready() -> void:
	%Damageable.pressed.connect(_on_damageable_pressed.bind(%Damageable))
	%Healable.pressed.connect(_on_healable_pressed.bind(%Healable))
	%Killable.pressed.connect(_on_killable_pressed.bind(%Killable))
	%Revivable.pressed.connect(_on_revivable_pressed.bind(%Revivable))
	
	%DamageMultiplier.value_changed.connect(_on_damage_multiplier_changed)
	%Damage.pressed.connect(_on_damage_pressed)
	
	%HealMultiplier.value_changed.connect(_on_heal_multiplier_changed)
	%Heal.pressed.connect(_on_heal_pressed)
	
	$Player.health.died.connect(_on_player_died)
	$Player.health.revived.connect(_on_player_revived)


func _on_damageable_pressed(button: CheckButton) -> void:
	$Player.health.damageable = button.button_pressed


func _on_healable_pressed(button: CheckButton) -> void:
	$Player.health.healable = button.button_pressed


func _on_killable_pressed(button: CheckButton) -> void:
	$Player.health.killable = button.button_pressed


func _on_revivable_pressed(button: CheckButton) -> void:
	$Player.health.revivable = button.button_pressed


func _on_damage_multiplier_changed(value: float) -> void:
	$Player.hurt_box.damage_multiplier = value


func _on_damage_pressed() -> void:
	$HitBox2D.monitoring = false
	$HitBox2D.action = HitBox2D.Action.DAMAGE
	$HitBox2D.amount = %DamageAmount.value
	$HitBox2D.monitoring = true


func _on_heal_multiplier_changed(value: float) -> void:
	$Player.hurt_box.heal_multiplier = value


func _on_heal_pressed() -> void:
	$HitBox2D.monitoring = false
	$HitBox2D.action = HitBox2D.Action.HEAL
	$HitBox2D.amount = %HealAmount.value
	$HitBox2D.monitoring = true


func _on_player_died(_player: Node) -> void:
	%Status.text = "Dead"


func _on_player_revived(_player: Node) -> void:
	%Status.text = "Alive"
