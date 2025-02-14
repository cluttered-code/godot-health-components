# Godot <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg" width="24" height="24"/>  Health, <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_box_2d/hit_box_2d.svg" width="24" height="24"/> HitBoxes, <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg" width="24" height="24"/> HurtBoxes, and <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_scan_2d/hit_scan_2d.svg" width="24" height="24"/> HitScans

[![Godot](https://img.shields.io/badge/Godot-4.3%2b-blue?logo=godot-engine)](https://godotengine.org/download)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue)](https://github.com/cluttered-code/godot-health-components/blob/main/addons/health_components/LICENSE)
[![Current Release](https://img.shields.io/github/release/cluttered-code/godot-health-hitbox-hurtbox.svg "Current Release")](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/releases/latest)

[![actions](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/actions/workflows/ci.yml/badge.svg)](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/actions/workflows/ci.yml)
<!-- [![Downloads](https://img.shields.io/github/downloads/cluttered-code/godot-health-hitbox-hurtbox/total.svg "Downloads")](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/releases) -->

## ![Health](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg) Health

`Health` component tracks an entity's health and emits signals for various health realted changes.

![Health inspector](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/images/health_inspector.png "Health Inspector")

## ![HurtBox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg) Hurtbox ![HurtBox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg)

`HurtBox2D` and `HurtBox3D` components require a `Collision Shape` so it can be detected and is assigned a ![Health](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/health/health.svg) `Health` component to apply damage and healing when hit.

![HurtBox2D Inspector](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/images/hurtbox_inspector.png "HurtBox2D Inspector")

## ![HitBox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_box_2d/hit_box_2d.svg) Hitbox ![HitBox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hit_box_3d/hit_box_3d.svg)

 `HitBox2D` and `HitBox3D` components require a `Collision Shape` to detect collisions with a ![HurtBox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg) `HurtBox2D` or ![HurtBox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg) `HurtBox3D` to apply `DAMAGE` or `HEAL`.

![HitBox2D Inspector](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/images/hitbox_inspector.png "HitBox2D Inspector")

## ![HitScan2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hit_scan_2d/hit_scan_2d.svg) HitScan ![HitScan3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hit_scan_3d/hit_scan_3d.svg)

`HitScan2D` and `HitScan3D` components require a `Collision Shape` to detect collisions with a ![Hurtbox2D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/2d/hurt_box_2d/hurt_box_2d.svg) `HurtBox2D` or ![Hurtbox3D](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/addons/health_hitbox_hurtbox/3d/hurt_box_3d/hurt_box_3d.svg) `HurtBox3D` to apply `DAMAGE` or `HEAL`.

![HitScan2D Inspector](https://raw.githubusercontent.com/cluttered-code/godot-health-hitbox-hurtbox/refs/heads/main/images/hitscan_inspector.png "HitScan2D Inspector")


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
