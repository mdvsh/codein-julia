# minesweeper-julia

## 🎮 Make A Game Task 👨‍💻

>Part of my [games-in-julia](https://github.com/PseudoCodeNerd/games_in_julia) series.

## Deliverable

1. Minesweeper for the CLI.
    - [Source](./game.jl)

## Description

#### References
1. https://www.geeksforgeeks.org/cpp-implementation-minesweeper-game/ (Their CPP code really helped me get a head-start 🚀)
2. BitLife Game (Minesweeper occurs as a minigame in this.)
3. https://m.wikihow.com/Play-Minesweeper

ToDo:

* [ ] Run it online |  repl.it maybe ?

**Note**: Some steps of the game have been omitted in the below snippet for graphical/documentation reasons.

#### Demo

```
→ C:\Users\madhav\games_in_julia\minesweeper› julia minesweeper.jl
---------------------------------------------------------------------
BACKGROUND:

WWII has just ended. There are still uncountable mines scattered accross our oceans and seas
that pose a great threat to humanity and which must be removed.

Present Day :

HI HO Cadet ! Congratulations on completing your Millitary Training at our prestigious Institution of Defence.
You're now ready to be deployed on your first peacekeeping mission in Afghanistan
But first, tell me your grades in the academy... (Enter Grade: A+/A- | B+/B- )
B+

GLEAMING ! You meet the grade requirement and have been tasked with removing 9 mines at this strategic location.
 MAKE US PROUD !!!
---------------------------------------------------------------------
     1  2  3  4  5  6  7  8
 ========================================
1  |  -  -  -  -  -  -  -  -
2  |  -  -  -  -  -  -  -  -
3  |  -  -  -  -  -  -  -  -
4  |  -  -  -  -  -  -  -  -
5  |  -  -  -  -  -  -  -  -
6  |  -  -  -  -  -  -  -  -
7  |  -  -  -  -  -  -  -  -
8  |  -  -  -  -  -  -  -  -

Afghanistan
Clear the squares that don't have mines and flag the ones that do!
The number in a square indicates how many mines that square is touching, including corners.
The Minesweeper that you're commanding understands in this format :
Enter "m/f x y" to mine/flag  (x, y) [horizontal, vertical axis] respectively.

You can also desert the your post by typing the answer to life, the universe and everything. Good Luck !
Minesweeper Console | Enter Commands : m 1 1
     1  2  3  4  5  6  7  8
 ========================================
1  |  0  0  1  -  -  -  -  -
2  |  0  0  1  -  -  -  -  -
3  |  0  0  1  -  -  -  -  -
4  |  0  0  1  -  -  -  -  -
5  |  0  0  1  -  -  -  -  -
6  |  1  1  2  -  -  -  -  -
7  |  -  -  -  -  -  -  -  -
8  |  -  -  -  -  -  -  -  -

Afghanistan
Clear the squares that don't have mines and flag the ones that do!
The number in a square indicates how many mines that square is touching, including corners.
The Minesweeper that you're commanding understands in this format :
Enter "m/f x y" to mine/flag  (x, y) [horizontal, vertical axis] respectively.

You can also desert the your post by typing the answer to life, the universe and everything. Good Luck !
Minesweeper Console | Enter Commands : m 1 8
     1  2  3  4  5  6  7  8
 ========================================
1  |  0  0  1  -  -  -  -  -
2  |  0  0  1  -  -  -  -  -
3  |  0  0  1  -  -  -  -  -
4  |  0  0  1  -  -  -  -  -
5  |  0  0  1  -  -  -  -  -
6  |  1  1  2  -  -  -  -  -
7  |  -  -  -  -  -  -  -  -
8  |  1  -  -  -  -  -  -  -
Afghanistan
Clear the squares that don't have mines and flag the ones that do!
The number in a square indicates how many mines that square is touching, including corners.
The Minesweeper that you're commanding understands in this format :
Enter "m/f x y" to mine/flag  (x, y) [horizontal, vertical axis] respectively.

You can also desert the your post by typing the answer to life, the universe and everything. Good Luck !
Minesweeper Console | Enter Commands : m 7 4
     1  2  3  4  5  6  7  8
 ========================================
1  |  0  0  1  -  -  -  -  F
2  |  0  0  1  -  -  -  -  -
3  |  0  0  1  3  -  -  -  -
4  |  0  0  1  -  -  -  2  -
5  |  0  0  1  -  -  1  -  -
6  |  1  1  2  -  1  1  2  2
7  |  -  -  -  -  1  0  0  0
8  |  1  -  -  -  1  0  0  0

Afghanistan
Clear the squares that don't have mines and flag the ones that do!
The number in a square indicates how many mines that square is touching, including corners.
The Minesweeper that you're commanding understands in this format :
Enter "m/f x y" to mine/flag  (x, y) [horizontal, vertical axis] respectively.

You can also desert the your post by typing the answer to life, the universe and everything. Good Luck !
Minesweeper Console | Enter Commands : m 4 1
     1  2  3  4  5  6  7  8
 ========================================
1  |  0  0  1  *  -  -  -  F
2  |  0  0  1  -  *  -  -  -
3  |  0  0  1  3  *  -  -  -
4  |  0  0  1  *  -  -  2  -
5  |  0  0  1  -  -  1  *  *
6  |  1  1  2  -  1  1  2  2
7  |  -  *  -  *  1  0  0  0
8  |  1  -  *  -  1  0  0  0

Aww Snap. A MINE !!! Mission compromised...
You're being sent back since you suffered from broken ribs.
Your efforts are, (eh) Valued. Please see where you went wrong...
```



---

## Text based Minesweeper game in Julia

[Minesweeper](https://en.wikipedia.org/wiki/Minesweeper_(video_game)) is a popular game that is recognizable to anyone who has used Windows XP. If you haven't played it yet or want to refresh your memory, you can find the game online as well.

Create a ****8x8 and a 16x16 version**** of a minesweeper game that randomly generates 9 and 20 mines respectively and each turn asks the player for the location of the tile they want to uncover by asking them to enter the row and column of the tile. ****The current state of the minefield, which can be represented as a text grid, must be shown to the player at each turn.****

Each cell of the grid must contain either a number from 0-8 (indicating how many mines are adjacent to this tile) or an asterisk ("*", which represents a mine). Covered tiles can be represented by a blank space. Of course, only the cells the player already has uncovered should be visible.

The game ends when all "safe" tiles have been uncovered or the player steps on a mine.**Every game must end with the grid showing ALL THE TILES THAT HAVE BEEN UNCOVERED SO FAR and THE LOCATION OF ALL THE MINES.**

---