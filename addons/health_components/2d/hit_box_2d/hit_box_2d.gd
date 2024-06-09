class_name HitBox2D extends Area2D

enum Action {DAMAGE, HEAL}

@export var action: Action = Action.DAMAGE
@export var amount: int = 0
