.PHONY: all clean run

XEX_IMAGE = "bin/aomc.xex"
ATARI800 = atari800
C1541 = c1541

all: clean aomc.xex run


aomc.xex: src/atari800/aomc.asm
	64tass -Wall -Wno-implied-reg --atari-xex -o bin/aomc.xex -L bin/list-co1.txt -l bin/labels.txt src/atari800/aomc.asm
	# the original xex file has an incorrect end-byte which we need to patch here.
	dd if=bin/patch-atari-end-byte.bin of=bin/aomc.xex bs=1 seek=4 count=1 conv=notrunc
	md5sum bin/aomc.xex orig/aomc.xex

run: aomc.xex
	$(ATARI800) -verbose $(XEX_IMAGE)

clean:
	-rm $(XEX_IMAGE)
	-rm bin/*.txt
