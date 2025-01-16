# <img src="https://raw.githubusercontent.com/cluttered-code/godot-health-components/refs/heads/main/addons/health_components/health/health.svg" width="24" height="24" />  Godot Health, HitBoxes, and HurtBoxes

[![Godot](https://img.shields.io/badge/Godot-4.3%2b-blue?logo=godot-engine)](https://godotengine.org/download)
[![LICENSE](https://img.shields.io/badge/license-MIT-blue)](https://github.com/cluttered-code/godot-health-components/blob/main/addons/health_components/LICENSE)

## Installation Guide

### Asset Library Installation

1. Open the `AssetLib` tab in the Godot Editor.
2. Search for `Health`, `HitBox`, or `HurtBox` in the search bar.
3. Click the download button next to the Health, HitBoxes, and HurtBoxes plugin.
4. Once the installation is complete, go to `Project` -> `Project Settings` -> `Plugins`.
5. Find the `Health, HitBoxes, and HurtBoxes` plugin in the list and check the box to enable it.

## Usage

1. Add a `Health` node to a Node that needs health (ie. `CharacterBody2D` or `StaticBody3D`)
2. Add a `HurtBox2D` node with a `CollisionShape2D` to the same Node.
3. Set the `HurtBox2D` Collision layer and mask.
4. Any Node With a `HitBox2D` set to the same layer as the mask in step #3 will automatically detect collisions.

**alternativly**: `RayCast2D` nodes can be used to detect collisions with `HurtBox2D` and directly call `damage()` or `heal()` functions to affect health.


## Issues

Submit issues to the [Github Issues Page](https://github.com/cluttered-code/godot-health-hitbox-hurtbox/issues)
