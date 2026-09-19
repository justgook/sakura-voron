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
- Sensorless loading uses `extruder_homing_endstop: filament_compression` and the measured `toolhead_extruder_to_nozzle: 51.3`.
- `show_bypass: 1` exposes the virtual bypass for direct-to-extruder loading and testing.
- The Filametrix cutter remains disabled until its actuator bolt is installed and calibrated.
