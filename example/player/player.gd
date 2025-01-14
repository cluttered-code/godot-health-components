extends CharacterBody2D

@onready var health: Health = $Health
@onready var hurt_box: HurtBox2D = $HurtBox2D
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	update_health_bar()
	
	health.damaged.connect(_on_damaged)
	health.healed.connect(_on_healed)


func update_health_bar() -> void:
	health_bar.set_value_no_signal(health.percent())


func _on_damaged(_owner: Node, _amount: int, _applied: int) -> void:
	update_health_bar()


func _on_healed(_owner: Node, _amount: int, _applied: int) -> void:
	update_health_bar()
