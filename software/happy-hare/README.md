# Happy Hare deployment

- Upstream: https://github.com/moggieuk/Happy-Hare
- Version: v4.0.0
- Install path: `/home/voron/Happy-Hare`
- Base commit: see `UPSTREAM_COMMIT`
- Local patches: fix generated ViViD NFC reader names for the default `unit0` name and indexed-selector buzz testing.

The active checkout is on local branch `sakura-vivid`, with both patches applied.

## Printer-specific settings

The active generated configuration includes these post-install settings:

- `toolhead_switch_pin: ^EBB:gpio13` — normally-closed HGX gear-spread filament switch; validated `Open` when empty and `TRIGGERED` with filament.
- `show_bypass: 1` — exposes the virtual bypass for direct-to-extruder loading and testing.
- The Filametrix cutter remains disabled until its actuator bolt is installed and calibrated.
