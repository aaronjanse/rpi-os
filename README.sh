aarch64-none-elf-as -c boot.S -o boot.o

aarch64-none-elf-gcc -ffreestanding -c kernel.c -o kernel.o -O2 -Wall -Wextra

aarch64-none-elf-gcc -T linker.ld -o myos.elf -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
aarch64-none-elf-objcopy myos.elf -O binary kernel8.img

aarch64-none-elf-gcc -ffreestanding -c kernel.c -o kernel.o -O2 -Wall -Wextra

qemu-system-aarch64 -M raspi3 -serial stdio -kernel kernel8.img
