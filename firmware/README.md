# Klipper firmware definitions

Firmware must be built from the Klipper commit recorded in `KLIPPER_COMMIT`.

- `skr-pro-uart.config`: BTT SKR Pro, STM32F407, 32 KiB bootloader, USART1 PA10/PA9 at 250000 baud.
- `ebb-rp2040-usb.config`: EBB RP2040 over USB, 16 KiB (0x100) bootloader, Generic 03H flash.
- `eddy-duo-rp2040.config`: BTT Eddy Duo RP2040 over USB, 16 KiB (0x100) bootloader, Generic 03H flash.

Build without changing Klipper `.config`:

```sh
make clean KCONFIG_CONFIG=/path/to/device.config
make olddefconfig KCONFIG_CONFIG=/path/to/device.config
make -j2 KCONFIG_CONFIG=/path/to/device.config
```
