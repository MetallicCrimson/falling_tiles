# Falling Tiles

## Description

Destroy the tiles, before they destroy you!  
Your task is to catch all the falling tiles by activating their column when they reach the white area.  
You can do that by pressing the key A, S, D, or F for column 1-4 respectively.  
If you miss one, or press a button when the white area is empty, you lose a life (and you gain invincibility for .5 seconds).  
The tiles are constantly getting faster.  
You can start the game with Enter, and pause/resume it with Space.  
Good luck!

![falling_tiles_github](https://github.com/MetallicCrimson/falling_tiles/assets/67794509/531c6274-748e-4385-8766-f3aec6ea95cb)

## Tech details

It was developed in Godot v4.2.1, in order to practice; I started doing it immediately after finishing the official 2D tutorial. It's supposed to be a small test game, and according to my expectations, it was done in a few hours (including messing around with Gimp, creating Windows icons).
Originally I made it so the player could just spam the buttons and secure the win. After I realized that might be a little too easy, I punished misclicks as well... but then it was too hard (a fail immediately took two lives: one for the misinput, one for the falling square getting through). After that, I got the idea of invincibility frames, which worked out nicely.

## Installation
No need to install,  [releases can be found here for Windows, Linux, and Mac.](https://github.com/MetallicCrimson/falling_tiles/releases/tag/v0.9) Just download the appropriate executable file, and have fun with it.

Note: I don't own a Mac (nor do I intend to), so I couldn't test that version. I've heard it can be really picky, especially because I'm not a certified Apple developer. If you encounter these problems, sorry; it might be better to just run the source code itself.
