extends CharacterBody2D

@onready var health: Health = $Health
@onready var hurt_box: HurtBox2D = $HurtBox2D
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	update_health_bar()
	
	health.damaged.connect(_on_health_changed)
	health.healed.connect(_on_health_changed)


func update_health_bar() -> void:
	health_bar.set_value_no_signal(health.percent())


func _on_health_changed(_owner: Node, _amount: int) -> void:
	update_health_bar()
