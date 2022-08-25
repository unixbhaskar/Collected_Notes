Do you have the uncompressed vmlinux? You will need that. I think there is an extract-vmlinux script in the kernel source tree to get the uncompressed ELF image out of the compressed vmlinuz file.

Once you've got vmlinux, you'll need to grab the contents of the __initramfs_start symbol. This is located in the .init.data section.

First, find out where the address where that section will be loaded:

$ readelf --section-headers vmlinux | grep --fixed-strings --word-regexp --after-context=1 .init.data
  [41] .init.data        PROGBITS         ffffffff83806000  02c06000
       00000000001d11f0  0000000000000000  WA       0     0     8192

So this section has address 0xffffffff83806000. Next, get the addresses of the two symbols:

$ readelf --syms vmlinux | grep __initramfs
123124: ffffffff839d6fe8     0 NOTYPE  GLOBAL DEFAULT   41 __initramfs_start
129553: ffffffff839d71e8     0 NOTYPE  GLOBAL DEFAULT   41 __initramfs_size

If I have a look at the contents of the __initramfs_size symbol (an unsigned long, so 64 bits on my system), I get:

$ objcopy --only-section=.init.data --output-target=binary vmlinux vmlinux.init.data
$ od --format=u8 --skip-bytes=$(( 0xffffffff839d71e8 - 0xffffffff83806000 )) vmlinux.init.data
7210750                  512
7210760

I have taken the address of the address of the __initramfs_size symbol and subtracted the base address of the .init.data section to get the offset of that symbol within that section.

This tells me that this kernel's built-in ramfs is 512 bytes in size, which is actually the smallest possible size for it. I can then extract that with:

$ dd if=vmlinux.init.data of=vmlinux.ramfs ibs=1 skip=$(( 0xffffffff839d6fe8 - 0xffffffff83806000 )) count=512 status=none
$ file vmlinux.ramfs
vmlinux.ramfs: ASCII cpio archive (SVR4 with no CRC)
$ cpio --list --verbose <vmlinux.ramfs
drwxr-xr-x   2 root     root            0 Jun 17 00:51 dev
crw-------   1 root     root       5,   1 Jun 17 00:51 dev/console
drwx------   2 root     root            0 Jun 17 00:51 root
1 block
