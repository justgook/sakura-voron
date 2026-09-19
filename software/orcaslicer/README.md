# OrcaSlicer Happy Hare profile

This directory records the active macOS OrcaSlicer machine preset used for Sakura.

- OrcaSlicer version at capture: 2.4.2
- Active preset: `Sakura 0.4`
- Local installation path: `~/Library/Application Support/OrcaSlicer/user/default/machine/Sakura 0.4.json`
- Local pre-change backup: `~/Library/Application Support/OrcaSlicer-backups/pre-happy-hare-20260919-213755`

The preset configures four logical extruders for ViViD gates T0–T3, single-extruder multimaterial mode, Happy Hare print start/end metadata, native `T[next_extruder]` tool changes, and disables Orca's filament-change/tip-forming motion so Happy Hare owns filament handling.

The printer-side `PRINT_START` intentionally performs no extrusion. Orca runs `MMU_START_LOAD_INITIAL_TOOL` and then calls `PRIME_LINE`, ensuring the ViViD gear is synchronized before the first extrusion.

## Restore

Quit OrcaSlicer, then copy the tracked preset into the local machine preset directory:

```bash
cp 'Sakura 0.4.json' "$HOME/Library/Application Support/OrcaSlicer/user/default/machine/Sakura 0.4.json"
```

Keep the Happy Hare Moonraker file preprocessor enabled because `!referenced_tools!`, `!colors!`, and related placeholders are substituted during upload.
