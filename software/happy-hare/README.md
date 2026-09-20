# Happy Hare deployment

- Upstream: https://github.com/moggieuk/Happy-Hare
- Version: v4.0.0
- Install path: `/home/voron/Happy-Hare`
- Base commit: see `UPSTREAM_COMMIT`
- Local patches: fix generated ViViD NFC reader names, indexed-selector buzz testing, and OrcaSlicer 2.4.2 repeated purge matrices.

The active checkout is on local branch `sakura-vivid`, with all three patches applied.

## Printer-specific settings

The active generated configuration includes these post-install settings:

- The HGX gear-spread switch on `EBB:gpio13` is intentionally disabled because repeated calibration showed an unstable trigger point (about 7.4 mm variation).
- Sensorless loading uses `extruder_homing_endstop: filament_compression` and the validated `toolhead_extruder_to_nozzle: 71.3`. The prior 51.3 mm value stopped short of reliable HGX capture; 71.3 mm parks without purging and an additional 5 mm extrudes immediately.
- ViViD synchronization is enabled for printing, purging, and tip forming (`sync_to_extruder`, `sync_purge`, and `sync_form_tip`). Without it, the HGX could consume buffer slack or retain filament while ViViD moved independently.
- The standard `toolhead_unload_safety_margin: 10` is retained; with the corrected path this gives an 81.3 mm release distance, validated without opening the HGX idler.
- `show_bypass: 1` exposes the virtual bypass for direct-to-extruder loading and testing.
- The Filametrix cutter remains disabled until its actuator bolt is installed and calibrated.
