extends CharacterBody2D

@onready var health: Health = $Health
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	update_health_bar()
	
	health.changed.connect(_on_health_changed)


func update_health_bar() -> void:
	health_bar.set_value_no_signal(health.percent())


func _on_health_changed(owner: Node) -> void:
	update_health_bar()
