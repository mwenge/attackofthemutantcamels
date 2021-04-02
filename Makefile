.PHONY: all clean run

XEX_IMAGE = "bin/aomc.xex"
ATARI800 = atari800

slipstream = wine slipstream

C1541 = c1541

all: clean aomc.xex run

aomc.xex: src/atari800/aomc.asm
	64tass -Wall -Wno-implied-reg --atari-xex -o bin/aomc.xex -L bin/list-co1.txt -l bin/labels.txt src/atari800/aomc.asm
	# the original xex file has an incorrect end-byte which we need to patch here.
	dd if=bin/patch-atari-end-byte.bin of=bin/aomc.xex bs=1 seek=4 count=1 conv=notrunc
	md5sum bin/aomc.xex orig/aomc.xex

runatari: aomc.xex
	$(ATARI800) -win-height 800 -win-width 1200 $(XEX_IMAGE)

aomc.p88: src/konix/AOTMC89.ASM
	cd src/konix; wine "..\..\assembler.exe" -o "..\..\bin\aomc.p88" -i AOTMC89.ASM
	md5sum bin/aomc.p88 bin/aomc-bench.p88

runkonix: aomc.p88
	$(slipstream) "bin\aomc.p88"

clean:
	-rm $(XEX_IMAGE)
	-rm bin/*.txt
