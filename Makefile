.PHONY: all clean run

D64_IMAGE = "bin/amc.prg"
XEX_IMAGE = "bin/aomc.xex"
ATARI800 = atari800
X64 = x64

slipstream = wine slipstream

C1541 = c1541

all: clean run

amc.prg: src/c64/amc.asm
	64tass -Wall -Wno-implied-reg --cbm-prg -o bin/amc.prg -L bin/list-co1.txt -l bin/labels.txt src/c64/amc.asm
	md5sum bin/amc.prg orig/amc.prg

aomc.xex: src/atari800/aomc.asm
	64tass -Wall -Wno-implied-reg --atari-xex -o bin/aomc.xex -L bin/list-co1.txt -l bin/labels.txt src/atari800/aomc.asm
	md5sum bin/aomc.xex bin/aomc-bench.xex

runatari: aomc.xex
	$(ATARI800) -win-height 800 -win-width 1200 $(XEX_IMAGE)

aomc.p88: src/konix/AOTMC89.ASM
	cd src/konix; wine "..\..\assembler.exe" -o "..\..\bin\aomc.p88" -i AOTMC89.ASM
	md5sum bin/aomc.p88 bin/aomc-bench.p88

run: amc.prg
	$(X64) -verbose $(D64_IMAGE)

runkonix: aomc.p88
	$(slipstream) "bin\aomc.p88"

clean:
	-rm $(XEX_IMAGE)
	-rm bin/*.txt
