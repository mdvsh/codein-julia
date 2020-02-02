#=
@about : Classic Minesweeper Game Implementation in Julia for GCI'19
@author : PseudoCodeNerd
@sdate : 04/01/2020

References :
1. https://www.geeksforgeeks.org/cpp-implementation-minesweeper-game/ [Mainly here, I basically tried to port their cpp code to Julia xD]
2. BitLife Game (Minesweeper occurs as a minigame in this.)
3. https://en.wikipedia.org/wiki/Minesweeper_(video_game)
4. https://m.wikihow.com/Play-Minesweeper

Revised the mechanism of Minesweeper from the 4th link. Here, number >= 0 on the cell refers to the number of mines around the cell.
A cell labelled internally as -1 is a mine.

P.S: Trying top-down approach in this program xD

Comments have been provided. However, I believe the function names are self-explainatory.

=#

using Random # for getting the deployment of the cadet
deploymentAread = ["Afghanistan", "Iraq", "Mexico", "Syria", "Pakistan","Libya", "Somalia" ]
location = rand(1:7)
over = false
cells_checked = 0

println("---------------------------------------------------------------------")
println("BACKGROUND:\n\nWWII has just ended. There are still uncountable mines scattered accross our oceans and seas 
that pose a great threat to humanity and which must be removed.\n\nPresent Day :")
println("\nHI HO Cadet ! Congratulations on completing your Millitary Training at our prestigious Institution of Defence. ")
println("You're now ready to be deployed on your first peacekeeping mission in ", deploymentAread[location])
print("But first, tell me your grades in the academy... (Enter Grade: A+/A- | B+/B- )\n")
grade = string(readline())
if grade == "A-" || grade == "A+"
    mines = 20
    size = 16
elseif grade == "B+" || grade == "B-"
    mines = 9
    size = 8
else
    println("You don't meet the pre-requisites for this deployment. ")
    exit()
end
println("\nGLEAMING ! You meet the grade requirement and have been tasked with removing ", mines," mines at this strategic location.\n MAKE US PROUD !!!")
println("---------------------------------------------------------------------")

order_recieved = """
Clear the squares that don't have mines and flag the ones that do!\nThe number in a square indicates how many mines that square is touching, including corners.
The Minesweeper that you're commanding understands in this format : 
Enter "m/f x y" to mine/flag  (x, y) [horizontal, vertical axis] respectively.
\nYou can also desert the your post by typing the answer to life, the universe and everything. Good Luck !
"""

# if you step on a mine, you'll be hurt!!!
listOf_casualities = [" fractured spine.", " broken nose.", " brain hemorrhage.", "STD ?!", " broken ribs.", " Death (F for Respect)", " depression."]
casuality = listOf_casualities[rand(1:7)]

#-------------------------------- Basic Mine Grid Building  + Functions --------------------------------

#defining the mine_map structure (thanks Mudit for clearing my confusion on how to implement this.)
map_view = Array{Union{String,Int32}}(undef, size, size)
map_view .= "-"
cells_checked = 0
mine_map = zeros(Int32,size,size)#the map is initially all zeros with -1 labels as mines.

#=
Count all the mines in the 8 adjacent 
cells 

    N.W   N   N.E 
      \   |   / 
       \  |  / 
    W----Cell----E 
         / | \ 
       /   |  \ 
    S.W    S   S.E 

Cell-->Current Cell (row, col) 
N -->  North        (row-1, col) 
S -->  South        (row+1, col) 
E -->  East         (row, col+1) 
W -->  West            (row, col-1) 
N.E--> North-East   (row-1, col+1) 
N.W--> North-West   (row-1, col-1) 
S.E--> South-East   (row+1, col+1) 
S.W--> South-West   (row+1, col-1) 

Source : geeksforgeeks
=#

#checking adjacent cells for mines. This helps number_cells which is responsible for displaying the number of mines the cell is in contact with.
function adjacent_cells(mine_map, coord_x, coord_y)
    adja_cells = [(coord_x, coord_y+1),(coord_x, coord_y-1),(coord_x-1, coord_y-1),(coord_x-1, coord_y),(coord_x+1, coord_y),(coord_x+1, coord_y+1),
    (coord_x+1, coord_y-1),(coord_x-1, coord_y+1)]
    cell_num = 0
    for cell in adja_cells
        #checking if mine here
        if (0<cell[1]<=size && 0<cell[2]<=size)
            if (mine_map[cell[2],cell[1]] == -1)
                cell_num +=1
            end
        end
    end
    return cell_num
end

function number_cells()
    for coord_y = 1:size
        for coord_x = 1:size
            if mine_map[coord_y, coord_x] != -1
                mine_map[coord_y, coord_x] = adjacent_cells(mine_map, coord_x, coord_y)
            end
        end
    end
end

#now we label and add the mines randomly to the mine_map
function deploy_mines()
    coord_x = rand(1:size)
    coord_y = rand(1:size)
    #callback to prevent adding mines on the same cell
    if mine_map[coord_y, coord_x] != -1
        mine_map[coord_y, coord_x] = -1
    else
        deploy_mines()
    end
end

for i in 1:mines
    deploy_mines()
end

number_cells()

#using recursion 
function empty_cell_action(coord_x, coord_y)
    global cells_checked += 1
    adja_cells = [(coord_x, coord_y+1),(coord_x, coord_y-1),(coord_x-1, coord_y-1),(coord_x-1, coord_y),(coord_x+1, coord_y),(coord_x+1, coord_y+1),
    (coord_x+1, coord_y-1),(coord_x-1, coord_y+1)]
    global map_view[coord_y, coord_x] = "0"

    for cell in adja_cells
        if (0<cell[1]<=size && 0<cell[2]<=size)

            if (mine_map[cell[2], cell[1]] == 0 && map_view[cell[2], cell[1]] == "-")
                empty_cell_action(cell[1], cell[2])

            elseif (mine_map[cell[2], cell[1]] != -1 && map_view[cell[2], cell[1]] == "-")
                map_view[cell[2], cell[1]] = mine_map[cell[2], cell[1]]
                global cells_checked += 1

            end

        end
    end
end

#this is the main function which ...blah blah you know what it does. Read the code.
function runner(coord_x, coord_y)
    if mine_map[coord_y, coord_x] == 0
        empty_cell_action(coord_x, coord_y)
    elseif mine_map[coord_y, coord_x] == -1
        #you lose cadet!
        global over = true
        final_map()
        println("Aww Snap. A MINE !!! Mission compromised...\nYou're being sent back since you suffered from", casuality, " \nYour efforts are, (eh) Valued. Please see where you went wrong...")
        exit()
    else 
        map_view[coord_y, coord_x] = mine_map[coord_y, coord_x]
        global cells_checked+=1
    end
end

function what_to_do_with_input(mine_or_flag, coord_x, coord_y)
    if mine_or_flag == "f"
        if map_view[coord_y, coord_x] == "-"
            map_view[coord_y, coord_x] = "F"
        end
    elseif mine_or_flag == "m"
        runner(coord_x,coord_y)
    end
end

#prints out the map in a playable format.. Inspired by geeksforgeeks article. Print everything as a string. 
function diaplay_mine_map(mine_map)
    play_area = "   "
    #printing column and rows using string formmatting and spaces

    #column
    for coord_x = 1:size 
        play_area *= "  $(coord_x)"
    end
    play_area *= "\n "
    #adding a divider beneath the column 
    for coord_x = 1:size 
        play_area *= "====="
    end 
    play_area *= "\n"

    #rows
    for coord_y = 1:size 
        if (coord_y < 10)
            play_area *= "$(coord_y)  |"
        else 
            play_area *= "$(coord_y) |"
        end 

        for coord_x = 1:size 
            face_value = mine_map[coord_y, coord_x]
            #if mine
            if face_value == -1
                play_area *= "  *"
            else 
                play_area *= "  $(face_value)"
            end
        end
        play_area *= ("\n")
    end 
    return play_area
end

function final_map()
    for coord_y in 1:size, coord_x in 1:size
        if (mine_map[coord_y, coord_x] == -1)
            map_view[coord_y, coord_x] = "*"
        end
    end
    println(diaplay_mine_map(map_view))
end



#FINAL
while (!over)
    println(diaplay_mine_map(map_view))
    print(deploymentAread[location],"\n",order_recieved)
    print("Minesweeper Console | Enter Commands : ")
    command = chomp(readline())
    commands = split(command)

    if (length(commands) == 3)
        coord_x = parse(Int32, commands[2])
        coord_y = parse(Int32, commands[3])
        what_to_do_with_input(commands[1], coord_x, coord_y)
        #winning condition 2
        if (cells_checked == (size*size) - mines)
            println("Well Done Cadet... or should I say Officer now!\nYou've successfully completed your first deployment and have been promoted...\nHIHO! Let's Go!")
            final_map()
            exit()
        end
    elseif (command == "42" || command == "Carl Sagan")
        final_map()
        println("Ahhh !I see you're a man of culture as well... Before you go, see where the mines were placed.\n Sayonara.")
        exit()
    else 
        println("Ah Crap! You've entered the wrong command cadet! You're being redeployed...")
        exit()
    end
end

# Indian Navy : Rulers of the Seas