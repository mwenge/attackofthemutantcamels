# Attack of the Mutant Camels (1983) by Jeff Minter
<img src="https://user-images.githubusercontent.com/58846/114308225-0528b000-9adb-11eb-8a9c-7a6ba7b1a4a9.png" height=300><img src="https://user-images.githubusercontent.com/58846/114308352-78cabd00-9adb-11eb-968a-5694c20e899e.gif" height=300>
This is the source code for different versions of Attack of the Mutant Camels by Jeff Minter.

## Playing the Games
[C64:](https://mwenge.github.io/attackofthemutantcamels/c64/) (Ctrl key is 'Fire', Arrow Keys to move.)

[Vic20:] (https://mwenge.github.io/attackofthemutantcamels/vic20/) (Ctrl key is 'Fire', Arrow Keys to move.)

[Atari800:](https://mwenge.github.io/attackofthemutantcamels/atari800/?disk_filename=amc.atr) (Alt key is 'Fire', Arrow Keys to move.)

## Building the C64 Source Code
<img src="https://user-images.githubusercontent.com/58846/114308473-13c39700-9adc-11eb-9753-3e131a3192e9.png" height=300><img src="https://user-images.githubusercontent.com/58846/114308808-f8a55700-9adc-11eb-8eec-8f9adda6bee7.gif" height=300>
### Requirements
* [VICE][vice] - The most popular C64 emulator
* [64tass][64tass] - An assembler for 6502 source code.

### Setup
On Ubuntu you can install [VICE] as follows:
```
sudo apt install vice
```

### Compiling
To compile and run:

```sh
$ make
```

To just compile the game and get a binary (`gridrunner.prg`) do:

```sh
$ make amc.prg
```
## Building the Atari-8 bit Source Code
<img src="https://user-images.githubusercontent.com/58846/114308225-0528b000-9adb-11eb-8a9c-7a6ba7b1a4a9.png" height=300><img src="https://user-images.githubusercontent.com/58846/114308352-78cabd00-9adb-11eb-968a-5694c20e899e.gif" height=300>
### Requirements
* [Atari800 Emulator][atari800] - An Atari 400/8000 emulator
* [64tass][64tass] - An assembler for 6502 source code.

### Compiling
To compile and run:

```sh
$ make runatari
```

To just compile the game and get a binary (`gridrunner.xex`) do:

```sh
$ make aomc.xex
```

# Attack of the Mutant Camels (Konix 1989) by Jeff Minter
<img src="https://s.uvlist.net/n/y2020/06/202907.jpg" height=300>

This is the [source code] for the 1989 work-in-progress of Attack of the Mutant Camels for the Konix Multisystem by Jeff Minter. 


The code is released with the kind permission of its original author - Jeff Minter

### Current Status
The game compiles and plays. Interesting findings, some analysis of the game logic and an overview of the code's structure [can be found here](https://github.com/mwenge/AOTMC89/tree/master/src).


### Build Requirements
* [Wine][wine]

[wine]: https://www.winehq.org/
[commented source code]:https://github.com/mwenge/AOTMC89/blob/master/src/

### Build Instructions
To compile and run it do:

```sh
$ make runkonix
```
The compiled game is written to the `bin` folder. 

To just compile the game and get a binary (`aomc.p88`) do:

```sh
$ make aomc.p88
```

This repository is forked from https://github.com/SavourySnaX/AOTMC89.
