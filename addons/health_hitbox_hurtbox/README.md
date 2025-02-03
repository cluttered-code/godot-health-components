# Godot <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg" width="24" height="24"/>  Health, <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_box_2d/hit_box_2d.svg" width="24" height="24"/> HitBoxes, and <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg" width="24" height="24"/> HurtBoxes

[![Godot](https://img.shields.io/badge/Godot-4.3%2b-blue?logo=godot-engine)](https://godotengine.org/download)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue)](https://github.com/cluttered-code/godot-health-components/blob/main/addons/health_components/LICENSE)

## Health

![Health](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg) `Health` component tracks an entity's health and emits signals for various health realted changes.

### Signals

#### Primary

The signals used most often

<details>
<summary><code>damaged</code> emitted after damage is applied</summary>

#### Parameters
>| name  | type | description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |
>| amount | int | The amount of damage recieved |
>| applied | int | The amount of damage applied before death |

#### Code
```gdscript
signal damaged(owner: Node, amount: int, applied: int)
```
</details>

---

<details>
<summary><code>healed</code> emitted after healing is applied</summary>

#### Parameters
>| name  | type | description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |
>| amount | int | The amount of healing recieved |
>| applied | int | The amount of healing applied before full |

#### Code
```gdscript
signal healed(owner: Node, amount: int, applied: int)
```
</details>

---

<details>
<summary><code>died</code> emitted when damaged enough that health became zero</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal died(owner: Node)
```
</details>

---

<details>
<summary><code>revived</code> emitted when healing applied and health was zero</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal revived(owner: Node)
```
</details>

---

#### Secondary

Signals that you might want for advanced functionality

<details>
<summary><code>first_hit</code> emitted after damage is applied if health was full before the hit</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal first_hit(owner: Node)
```
</details>

---

<details>
<summary><code>not_damageable</code> emitted when attempting to damage an entity that cannot be damaged</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal not_damageable(owner: Node)
```
</details>

---

<details>
<summary><code>not_healable</code> emitted when attempting to heal an entity that cannot be healed</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal not_healable(owner: Node)
```
</details>

---

<details>
<summary><code>already_dead</code> emitted when attempting to damage an entity that is already dead</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal already_dead(owner: Node)
```
</details>

---

<details>
<summary><code>already_full</code> emitted when attempting to heal an entity that already has full health</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal already_full(owner: Node)
```
</details>

---

<details>
<summary><code>not_killable</code> emitted when attempting to apply enough damage to kill an entity that cannot be killed</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal not_killable(owner: Node)
```
</details>

---

<details>
<summary><code>not_revivable</code> emitted when attempting to heal an entity that is dead and cannot be revived</summary>

#### Parameters
>| Name  | Type | Description |
>|-------|------|-------------|
>| owner | Node | The `owner` of the `Health` Node |


#### Code
```gdscript
signal not_revivable(owner: Node)
```
</details>

---



## Hurtbox

![Hurtbox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg) `Hurtbox2D` or ![Hurtbox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg) `HurtBox3D` component requires a `Collision Shape` and is assigned a ![Health](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg) `Health` component to automatically apply damage and healing.

## Hitbox

![Hitbox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_box_2d/hit_box_2d.svg) `Hitbox2D` or ![Hitbox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hit_box_3d/hit_box_3d.svg) `HitBox3D` component requires a `Collision Shape` to interact with ![Hurtbox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg) `Hurtbox2D` or ![Hurtbox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg) `HurtBox3D` to apply `DAMAGE` or `HEAL` depending on type.

## Installation

### Asset Library Installation

1. Open the `AssetLib` tab in the Godot Editor.
2. Search for `Health`, `HitBox`, or `HurtBox` in the search bar.
3. Click the download button next to the Health, HitBoxes, and HurtBoxes plugin.
4. Once the installation is complete, go to `Project` -> `Project Settings` -> `Plugins`.
5. Find the `Health, HitBoxes, and HurtBoxes` plugin in the list and check the box to enable it.

## Usage

![Player Structure](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/images/character_structure.png "CharacterBody2D Structure")

1. Add a `Health` node to a Node that needs health (ie. `CharacterBody2D` or `StaticBody3D`)
2. Add a `HurtBox2D` node with a `CollisionShape2D` to the same Node.
3. Set the `HurtBox2D` Collision layer and mask.
4. Any Node With a `HitBox2D` set to the same layer as the mask in step #3 will automatically detect collisions.

**alternativly**: `RayCast2D` nodes can be used to detect collisions with `HurtBox2D` and directly call `damage()` or `heal()` functions to affect health.

## Issues

Submit issues to the [Github Issues Page](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/issues)
