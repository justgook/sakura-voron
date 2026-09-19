# OrcaSlicer Happy Hare profile

This directory records the active macOS OrcaSlicer machine preset used for Sakura.

- OrcaSlicer version at capture: 2.4.2
- Active preset: `Sakura 0.4`
- Local installation path: `~/Library/Application Support/OrcaSlicer/user/default/machine/Sakura 0.4.json`
- Local pre-change backup: `~/Library/Application Support/OrcaSlicer-backups/pre-happy-hare-20260919-213755`
- Connection-fix backup: `~/Library/Application Support/OrcaSlicer-backups/pre-moonraker-url-fix-20260919-214933`
- Host type: native `moonraker`
- Moonraker API: `http://10.10.10.156:7125`
- Device UI: `http://10.10.10.156`
- Original app backup: `~/Library/Application Support/OrcaSlicer-backups/OrcaSlicer-2.4.2-before-local-network-fix.app`

The preset configures four logical extruders for ViViD gates T0–T3, single-extruder multimaterial mode, Happy Hare print start/end metadata, native `T[next_extruder]` tool changes, and disables Orca's filament-change/tip-forming motion so Happy Hare owns filament handling.

The printer-side `PRINT_START` intentionally performs no extrusion. Orca runs `MMU_START_LOAD_INITIAL_TOOL` and then calls `PRIME_LINE`, ensuring the ViViD gear is synchronized before the first extrusion.

## Restore

Quit OrcaSlicer, then copy the tracked preset into the local machine preset directory:

```bash
cp 'Sakura 0.4.json' "$HOME/Library/Application Support/OrcaSlicer/user/default/machine/Sakura 0.4.json"
```

Keep the Happy Hare Moonraker file preprocessor enabled because `!referenced_tools!`, `!colors!`, and related placeholders are substituted during upload.

## macOS local-network fix

OrcaSlicer 2.4.2 lacks the local-network usage metadata required by this macOS release. `patch-macos-local-network.sh` adds the metadata and ad-hoc signs the installed app while preserving its runtime flags and entitlements. Run it only while OrcaSlicer is closed and after granting the terminal App Management permission.

## OrcaSlicer 2.4.2 purge matrices

With four logical extruders, OrcaSlicer 2.4.2 emits four identical copies of its 4×4 purge matrix. Happy Hare patch `0003-accept-repeated-orcaslicer-purge-matrices.patch` safely collapses identical copies. Oversized non-identical matrices remain errors.
