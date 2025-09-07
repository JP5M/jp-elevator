# JP Elevator Script

> **Author:** JP5M  
> A configurable FiveM elevator system for GTA V, supporting multiple buildings, floors, and interaction systems. Built with [ox_lib](https://overextended.dev/ox_lib/).

## Features

- Multiple elevators and buildings, each with custom floors
- Configurable floor names, descriptions, and teleport locations
- Supports both `ox_target` and `sleepless_interact` targeting systems
- Optional screen fade and sound effects for immersive transitions
- Easy-to-edit configuration file (config.lua)

## Configuration

Edit config.lua to customize elevators, floors, and behavior:

- **screenFade**: Enable/disable fade in/out effect when teleporting
- **sound**: Enable/disable elevator sound
- **fadeDuration**: Duration of fade effect in milliseconds
- **interact**: Target system to use (`ox_target` or `sleepless_interact`)
- **targetLabel**: Label shown for elevator interaction
- **elevators**: List of elevator groups/buildings
  - Each elevator has a `name`, `id`, and a list of `floors`
  - Each floor has a `label`, `description`, `coords` (teleport location), and `interaction` (target location)

Example (from config.lua):

```lua
{
    name = "Medical Department",
    id = "medical_department",
    floors = {
        {
            label = "Achte Etage",
            description = "Management & Konferenzräume",
            coords = vector4(-1829.3250, -336.9168, 84.0602, 143.8193),
            interaction = vector3(-1827.6355, -336.3678, 84.059)
        },
        -- more floors...
    }
}
```

## Installation

1. Place the `jp-elevator` folder in your server's resources directory.
2. Ensure you have [ox_lib](https://overextended.dev/ox_lib/) installed and started before this resource.
3. Add `ensure jp-elevator` to your `server.cfg`.

## Usage

- Approach an elevator interaction point (as defined in config.lua).
- Use the interaction key (as configured by your target system) to open the elevator menu.
- Select your desired floor; you will be teleported with optional fade and sound effects.

## Web Assets

- The web folder contains `index.html` and `sound.mp3` for UI and sound effects.

---
