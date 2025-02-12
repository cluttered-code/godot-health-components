# GdUnit generated TestSuite
class_name HealthTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://addons/health_hitbox_hurtbox/health/health.gd'

var health: Health
var signals: Object

func before_test() -> void:
	health = auto_free(Health.new())
	health.entity = self
	signals = monitor_signals(health)


func test_current_default() -> void:
	assert_int(health.current).is_equal(Health.DEFAULT_MAX)


func test_current_42() -> void:
	health.current = 42
	assert_int(health.current).is_equal(42)


func test_current_0() -> void:
	health.current = 0
	assert_int(health.current).is_equal(0)


func test_current_negative() -> void:
	health.current = -25
	assert_int(health.current).is_equal(0)


func test_current_max() -> void:
	health.current = health.max
	assert_int(health.current).is_equal(health.max)


func test_current_gt_max() -> void:
	health.current = health.max + 1
	assert_int(health.current).is_equal(health.max)


func test_max_default() -> void:
	assert_int(health.max).is_equal(Health.DEFAULT_MAX)


func test_max_raise() -> void:
	health.max += 1
	assert_int(health.max).is_equal(Health.DEFAULT_MAX + 1)


func test_max_1() -> void:
	health.max = 1
	assert_int(health.max).is_equal(1)


func test_max_0() -> void:
	health.max = 0
	assert_int(health.max).is_equal(1)


func test_max_negative() -> void:
	health.max = -25
	assert_int(health.max).is_equal(1)


func test_max_reduces_current() -> void:
	health.max = 42
	assert_int(health.current).is_equal(42)
	assert_int(health.max).is_equal(42)


func test_is_dead_default() -> void:
	assert_bool(health.is_dead()).is_false()


func test_is_dead_true() -> void:
	health.current = 0
	assert_bool(health.is_dead()).is_true()


func test_is_dead_not_killable() -> void:
	health.killable = false
	health.current = 0
	assert_bool(health.is_dead()).is_false()


func test_is_alive_default() -> void:
	assert_bool(health.is_alive()).is_true()


func test_is_alive_false() -> void:
	health.current = 0
	assert_bool(health.is_alive()).is_false()


func test_is_alive_not_killable() -> void:
	health.killable = false
	health.current = 0
	assert_bool(health.is_alive()).is_true()


func test_is_full_default() -> void:
	assert_bool(health.is_full()).is_true()


func test_is_full_false() -> void:
	health.current -= 1
	assert_bool(health.is_full()).is_false()


func test_percent_full() -> void:
	assert_float(health.percent()).is_equal(1.0)


func test_percent_half() -> void:
	health.current /= 2
	assert_float(health.percent()).is_equal(0.5)


func test_percent_0() -> void:
	health.current = 0
	assert_float(health.percent()).is_equal(0.0)


func test_percent_decimal() -> void:
	health.current = 1
	health.max = 3
	assert_float(health.percent()).is_equal_approx(0.333333, 0.000001)


func test_damage() -> void:
	health.current -= 10
	health.damage(20)
	assert_int(health.current).is_equal(Health.DEFAULT_MAX - 30)
	await assert_signal(signals).is_emitted("damaged", [self, 20, 20])
	await assert_signal(signals).wait_until(100).is_not_emitted("first_hit", [self])


func test_damage_first_hit() -> void:
	health.damage(42)
	
	assert_int(health.current).is_equal(Health.DEFAULT_MAX - 42)
	await assert_signal(signals).is_emitted("damaged", [self, 42, 42])
	await assert_signal(signals).is_emitted("first_hit", [self])


func test_damage_death() -> void:
	health.current -= 10
	health.damage(Health.DEFAULT_MAX)
	assert_int(health.current).is_equal(0)
	await assert_signal(signals).is_emitted("damaged", [self, Health.DEFAULT_MAX, 90])
	await assert_signal(signals).is_emitted("died", [self])
	await assert_signal(signals).wait_until(100).is_not_emitted("first_hit", [self])


func test_damage_one_shot() -> void:
	health.damage(Health.DEFAULT_MAX)
	assert_int(health.current).is_equal(0)
	await assert_signal(signals).is_emitted("damaged", [self, Health.DEFAULT_MAX, Health.DEFAULT_MAX])
	await assert_signal(signals).is_emitted("first_hit", [self])
	await assert_signal(signals).is_emitted("died", [self])
