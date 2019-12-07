all: armv7 arm64

armv7:
	arm-none-eabi-as -mthumb --fatal-warnings -o bin/ibss-flash-nor-shellcode.o src/ibss-flash-nor-shellcode.S
	arm-none-eabi-objcopy -O binary bin/ibss-flash-nor-shellcode.o bin/ibss-flash-nor-shellcode.bin
	rm bin/ibss-flash-nor-shellcode.o

	arm-none-eabi-as -mthumb --fatal-warnings -o bin/usb_0xA1_2_armv7.o src/usb_0xA1_2_armv7.S
	arm-none-eabi-objcopy -O binary bin/usb_0xA1_2_armv7.o bin/usb_0xA1_2_armv7.bin
	rm bin/usb_0xA1_2_armv7.o

	arm-none-eabi-as -mthumb --fatal-warnings -o bin/checkm8_armv7.o src/checkm8_armv7.S
	arm-none-eabi-objcopy -O binary bin/checkm8_armv7.o bin/checkm8_armv7.bin
	rm bin/checkm8_armv7.o

arm64:
	xcrun -sdk iphoneos clang src/usb_0xA1_2_arm64.S -target arm64-apple-darwin -Wall -o bin/usb_0xA1_2_arm64.o
	gobjcopy -O binary -j .text bin/usb_0xA1_2_arm64.o bin/usb_0xA1_2_arm64.bin
	rm bin/usb_0xA1_2_arm64.o

	xcrun -sdk iphoneos clang src/checkm8_arm64.S -target arm64-apple-darwin -Wall -o bin/checkm8_arm64.o
	gobjcopy -O binary -j .text bin/checkm8_arm64.o bin/checkm8_arm64.bin
	rm bin/checkm8_arm64.o

	xcrun -sdk iphoneos clang src/t8010_t8011_disable_wxn_arm64.S -target arm64-apple-darwin -Wall -o bin/t8010_t8011_disable_wxn_arm64.o
	gobjcopy -O binary -j .text bin/t8010_t8011_disable_wxn_arm64.o bin/t8010_t8011_disable_wxn_arm64.bin
	rm bin/t8010_t8011_disable_wxn_arm64.o

	xcrun -sdk iphoneos clang src/t8015_shellcode_arm64.S -target arm64-apple-darwin -Wall -o bin/t8015_shellcode_arm64.o
	gobjcopy -O binary -j .text bin/t8015_shellcode_arm64.o bin/t8015_shellcode_arm64.bin
	rm bin/t8015_shellcode_arm64.o
