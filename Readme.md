## Activity Description
For this activity I will need you to build an application (in ruby, ruby/rails, python, C/C++, Java) that solves a maze provided by a user. The program should accept user input as text (or as a file) then process the input to ensure it follows the rules as described below. The user input will follow one of the two formats displayed below, choose the format you prefer. After the input is processed the program should then attempt to solve the maze, starting at the entrance 'E' and ending on the exit 'X'. For each entrance to the maze, return exactly one solution. Fastest path is not required but is preferred.
## Goals:
1. Make sure the maze is valid, this means that it adheres to provided rules as well as any rules you think might be important. (Maybe mazes should have to be solvable?) For each issue display the problem in a clear and concise way (crashing is not okay).
2. For each given entrance, find a path to an exit. Express this path in a clear and meaningful way.
###SUGGESTION: Do it visually or perhaps using an ordered list of steps 'Go south from room 1,1 to room 1,2') per
entrance
3. Find the quickest path to any exit for each entrance. Express this path in a clear and meaningful way.
4. Make your program readable, testable, runnable and maintainable. You might be asked to change your program later to
handle unexpected changes in the requirements.
5. Try to finish, if you need to forgo a rule/requirement to get a functional prototype done then do so.
## Input Formats
The formats listed below cover your choices for user input for your program. Your final submission is only expected to handle one and I will test your submission using your preferred format (please be sure to tell me which option you chose). The explanations for each format appear under their sample. Both samples are expressions of the same maze, look at both and compare.

## Input Sample, Format #1:
```
[E**|] [|***] [|*|*] [|***] [||**]
[*|*|] [*|||] [|**|] [*|**] [*|||]
[*||E] [|**|] [*|**] [*|||] [|X*|]
[|**|] [**|*] [****] [|***] [*|**]
[**||] [|||*] [**||] [*||*] [*|||]
```

Format #1 is a simple text block composed of 5 rows and 5 columns. Each row describes 5 rooms which exist east or west of one another. Each column describes 5 rooms which exist north or south of one another. Each room in a given row/column is described by four characters between the '[' and ']' brackets. The brackets will contain a combination of the following characters:
* 'E': for entrance
* 'X':forexit
* '*': for a doorway connecting to an adjacent room '|': for a wall

The order of the characters between each set of brackets indicates the direction of the wall the character applies to:

*[0]: What is on the north wall of the room
*[1]: What is on the east wall of the room
*[2]: What is on the south wall of the room
*[3]: What is on the west wall of the room

Such that if you had a room that was described as '[E**|]' that room would:
 *Have an entrance to the north
 *Have a hallway to the next room on the east: x,y -> 2,1 (the room to the right of this room in the current row) 
 *Have a hallway to the room below it: x,y -> 1,2 (the room below this room in the current column)
 *Have a wall on the west

## Maze/Input Rules:

1. Rooms must be valid.
2. The number ofentrances, exits, walls and doorways in a given room must addup to 4.
    * All rooms must have at least one door.
3. The maze must have at least one entry way.
    * Entries may only exist on the outer perimeter of the maze, no entrances in the middle of the maze 
4. The maze must have at least one exit.
5. There must be a solid perimeter around the maze.
    * No holes into the void (outside of the maze).
    * The perimeter can only be composed of walls, entrances and exits.
6. There may be more thanone entry, there may be more than one exit.
7. Mazes will usually follow the 5x5 room format but not always, you might see something like the input below:
```
  +E +--+--+--+--+
1 |              |
  +  +  +--+  +  +
2 |  |  |     |  |
  +--+  +  +--+  +
3 E  |     |  |  |
  +--+  +  +--+  +--+ X+
4 |              |  |  |
  +  +--+  +  +  +  +  +
5 |     |     |        |
  +--+--+--+--+--+--+--+
0  1  2  3  4  5  6  7

-- OR --

[E**|][|***][|*|*][|***][||**]
[*|*|][*|||][|**|][*|**][*|||]
[*||E][|**|][*|**][*|||][||*|]
[|**|][**|*][****][|***][*|**][||*|][X|*|]
[**||][|||*][**||][*||*][*|||][**|*][*||*]
```
(Both samples represent the same data)

##Sample Input/Output:
Below you will find a sample of input and output for the program, you are of course free to change this however you like. There are better ways of doing this.

```
Valid input has been received and is as follows:
--------------------------------------------------
[E**|] [|***] [|*|*] [|***] [||**]
[*|*|] [*|||] [|**|] [*|**] [*|||]
[*||E] [|**|] [*|**] [*|||] [|X*|]
[|**|] [**|*] [****] [|***] [*|**]
[**||] [|||*] [**||] [*||*] [*|||]
--------------------------------------------------

The maze will now be tested for validity.

Test 1: Are all the rooms valid?
    Yes, all rooms are valid.

Test 2: Are there entry points and are they valid?
    There is an entry in room: 1 and it is valid.
    There is an entry in room: 11 and it is valid.
    Yes, the entry point(s) are present and valid.

Test 3: Are there exit points and are they valid?
    There is an exit in room: 15 and it is valid.
    Yes, the exit point(s) are present and valid.

Test 4: Is the parameter valid?
    Yes, the perimeter is valid.

--------------------------------------------------
This is a valid maze.
--------------------------------------------------

The shortest path from the entry in room 0 to the exit in room 14 is as follows:
    Start in room: 1
    Then move to room: 2
    Then move to room: 3
    Then move to room: 4
    Then move to room: 9
    Then move to room: 8
    Then move to room: 13
    Then move to room: 18
    Then move to room: 19
    Then move to room: 20
    Finally ending in room: 15
For a total path length of: 11
--------------------------------------------------

The shortest path from the entry in room 10 to the exit in room 14 is as follows:
    Start in room: 11
    Then move to room: 6
    Then move to room: 1
    Then move to room: 2
    Then move to room: 3
    Then move to room: 4
    Then move to room: 9
    Then move to room: 8
    Then move to room: 13
    Then move to room: 18
    Then move to room: 19
    Then move to room: 20
    Finally ending in room: 15
For a total path length of: 13
--------------------------------------------------
```
