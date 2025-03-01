class_name HitBox3DTest extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

var mock_hurt_box: HurtBox3D
var hit_box: HitBox3D
var signals: Object


func before_test() -> void:
	mock_hurt_box = auto_free(mock(HurtBox3D))
	hit_box = auto_free(HitBox3D.new())
	signals = monitor_signals(hit_box)


func test_on_area_entered_damage() -> void:
	hit_box.action = Health.Action.DAMAGE
	hit_box.amount = 10
	
	hit_box._on_area_entered(mock_hurt_box)
	
	verify(mock_hurt_box, 1).damage(10)
	verify(mock_hurt_box, 0).heal(any_int())
	
	await assert_signal(signals).is_emitted("hurt_box_entered", [mock_hurt_box])
	await assert_signal(signals).is_emitted("action_applied", [mock_hurt_box])


func test_on_area_entered_heal() -> void:
	hit_box.action = Health.Action.HEAL
	hit_box.amount = 10
	
	hit_box._on_area_entered(mock_hurt_box)
	
	verify(mock_hurt_box, 0).damage(any_int())
	verify(mock_hurt_box, 1).heal(10)
	
	await assert_signal(signals).is_emitted("hurt_box_entered", [mock_hurt_box])
	await assert_signal(signals).is_emitted("action_applied", [mock_hurt_box])


func test_on_area_entered_hit_box() -> void:
	hit_box._on_area_entered(hit_box)
	
	await assert_signal(signals).is_emitted("hit_box_entered", [hit_box])


func test_on_area_entered_ignore() -> void:
	hit_box.ignore_collisions = true
	hit_box.action = Health.Action.DAMAGE
	hit_box.amount = 10
	
	hit_box._on_area_entered(mock_hurt_box)
	
	verify(mock_hurt_box, 0).damage(any_int())
	verify(mock_hurt_box, 0).heal(any_int())
	
	await assert_signal(signals).wait_until(50).is_not_emitted("unknown_area_entered", [any()])
	await assert_signal(signals).wait_until(50).is_not_emitted("hurt_box_entered", [any()])
	await assert_signal(signals).wait_until(50).is_not_emitted("hit_box_entered", [any()])
	await assert_signal(signals).wait_until(50).is_not_emitted("action_applied", [any()])


func test_on_area_entered_area3d() -> void:
	hit_box.action = Health.Action.DAMAGE
	hit_box.amount = 10
	
	var area: Area3D = auto_free(Area3D.new())
	
	hit_box._on_area_entered(area)
	
	verify(mock_hurt_box, 0).damage(any_int())
	verify(mock_hurt_box, 0).heal(any_int())
	
	await assert_signal(signals).is_emitted("unknown_area_entered", [area])
	
	await assert_signal(signals).wait_until(50).is_not_emitted("hurt_box_entered", [any()])
	await assert_signal(signals).wait_until(50).is_not_emitted("hit_box_entered", [any()])
	await assert_signal(signals).wait_until(50).is_not_emitted("action_applied", [any()])
