# Prelude 

(c) 2019 jim kong kracks

Prelude is a tool based on ipwndfu used to boot code on A7 devices using the checkm8 Bootrom exploit. The ideal end goal for this project is to have written a basic microkernel with primitive display and audio drivers, but that is going to take a lot of time and research to do.

**Read [disclaimer](#disclaimer) before using this software.*

## Quick start guide for Prelude

1. Use a cable to connect device to your Mac. Hold buttons as needed to enter DFU Mode.

2. First run ```./ipwndfu -p``` to exploit the device. Repeat the process if it fails, it is not reliable.

3. Run ```./ipwndfu --boot``` to boot code on an A7 device.

4. Run ```./ipwndfu --dump-rom``` to get a dump of SecureROM.

5. Run ```./ipwndfu --decrypt-gid KEYBAG``` to decrypt a keybag.

6. Run ```./ipwndfu --demote``` to demote device and enable JTAG.


## Features

* Hexdump memory.

* Dump SecureROM.

* Pwn some devices with checkm8.

* Encrypt or decrypt hex data on a connected device in pwned DFU Mode using its GID or UID key.

* Patch iBoot on A7 devices to boot our own code instead of iOS. (STILL IN PROGRESS)

## Dependencies

This tool should be compatible with Mac and Linux. It won't work in a virtual machine.

* libusb, `If you are using Linux: install libusb using your package manager.`

## Disclaimer

**This is BETA software.**

Backup your data.

This tool is currently in beta and could potentially brick your device. If something goes wrong, hopefully you will be able to restore to latest IPSW in iTunes and bring your device back to life, but we cannot provide any guarantees.

**There is NO warranty provided.**

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.

## Toolchain

You will not need to use `make` or compile anything to use ipwndfu. However, if you wish to make changes to assembly code in `src/*`, you will need to use an ARM toolchain and assemble the source files by running `make`.

If you are using macOS with Homebrew, you can use binutils and gcc-arm-embedded. You can install them with these commands:

```
brew install binutils
brew cask install https://raw.githubusercontent.com/Homebrew/homebrew-cask/b88346667547cc85f8f2cacb3dfe7b754c8afc8a/Casks/gcc-arm-embedded.rb
```

## Credit

axi0mX for checkm8 exploit and ipwndfu

walac for pyusb
