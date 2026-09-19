# BTT ViViD firmware

These are BTT board-specific Klipper application images from
`BIGTREETECH_MMS` commit `193541eff18b0925495fe02a8d1da9c43675816d`.
They use the factory-installed 8 KiB Katapult bootloader and USB interface.
BTT recommends these images instead of generic manual builds because the
STM32F042 buffer has restricted flash and the vendor images preserve the
board-specific behavior and USB identity.

Installed versions:

- ViViD STM32G0B1: `v0.13.0-661-gf38accea2`
- Buffer STM32F042: `v0.13.0-661-g945713133`

Flashing tool: Arksine Katapult commit
`ec59b9bb9ad6c2ec8d4dc6831fbc77f0b308e29e`; host package
`python3-serial` is required.

Stop Klipper before flashing. Example:

```sh
sudo systemctl stop klipper
python3 ~/katapult/scripts/flashtool.py -f firmware.bin -d /dev/serial/by-id/device
sudo systemctl start klipper
```

Pre-flash state snapshot:
`~/migration-backups/pre-vivid-firmware-20260919-135255`.
Flash logs and working copies:
`~/migration-build/vivid-btt-20260919`.
