# Attack of the Mutant Camels by Jeff Minter
This is the source code for different versions of Attack of the Mutant Camels by Jeff Minter.

## Attack of the Mutant Camels (Atari 800) by Jeff Minter

### Current Status
The game compiles and plays. Interesting findings, some analysis of the game logic and an overview of the code's structure [can be found here](https://github.com/mwenge/AOTMC89/tree/master/src).


## Requirements
* [64tass][64tass], tested with v1.54, r1900
### For c64 and Vic 20:
* [VICE][vice]
### For Atari:
* [Atari800 Emulator][atari800]

[64tass]: http://tass64.sourceforge.net/
[vice]: http://vice-emu.sourceforge.net/
[atari800]: https://atari800.github.io/
[https://gridrunner.xyz]: https://mwenge.github.io/gridrunner.xyz
[commented source code]:https://github.com/mwenge/attackofthemutantcamels/blob/master/src/atari800


### Build Instructions
To compile and run it do:

```sh
$ make runatari
```
The compiled game is written to the `bin` folder. 

To just compile the game and get a binary (`aomc.p88`) do:

```sh
$ make aomc.xex
```

## Attack of the Mutant Camels (Konix 1989) by Jeff Minter
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
