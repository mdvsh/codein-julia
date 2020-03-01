#=
@about : Classic Tic-Tac-Toe Game Implementation in Julia for GCI'19 (Two-Player)
@author : PseudoCodeNerd
@sdate : 1/01/2020

Me and soumitra started the code at the same time and raced to see
who would finish first.

Might be untidy. FAIR WARNING.
=#

println("TicTacToe\nWelcome, Player One is X. Player Two is O.\n\nLet's Start.")
println("--------------------------------")

game_board = [" ", " ", " ",
                " ", " ", " ",
                " ", " ", " "]

function display()
    println("+-----------+")
    println("Board move grid:\n 1 2 3\n 4 5 6\n 7 8 9")
    println("+-----------+")
    println("| ", game_board[1], " | ", game_board[2], " | ", game_board[3], " |")
    println("+-----------+")
    println("| ", game_board[4], " | ", game_board[5], " | ", game_board[6], " |")
    println("+-----------+")
    println("| ", game_board[7], " | ", game_board[8], " | ", game_board[9], " |")
    println("+-----------+")
end

function temp_row_check(c, one, two, three)
    if c == game_board[one] == game_board[two] == game_board[three]
        return true
    end
end

display()

function main_check(a)
    if temp_row_check(a,3,6,9) == true
        return true
    elseif temp_row_check(a,1,4,7) == true
        return true
    elseif temp_row_check(a,2,5,8) == true
        return true
    elseif temp_row_check(a,1,2,3) == true
        return true
    elseif temp_row_check(a,4,5,6) == true
        return true
    elseif temp_row_check(a,7,8,9) == true
        return true
    elseif temp_row_check(a,1,5,9) == true
        return true
    elseif temp_row_check(a,3,5,7) == true
        return true
    else
        return false
    end 
end

let
play = true
playerOneTurn = true

function check_for_draw()
    avalPos = []
    for i in 1:9
        if game_board[i] != "X" && game_board[i] != "O"
            push!(avalPos, i)
        end
    end
    if length(avalPos) == 0 && main_check("X") == false && main_check("Y") == false 
       return true
    else
        return false 
    end 
end

while play == true
    if playerOneTurn
        print("Player One, Enter (X)")
    else
        print("Player Two, Enter (O)")
    end
    println("\nEnter the position : ")
    uspos = string(readline())
    uspos = parse(Int,uspos)
    if game_board[uspos] != "X" && game_board[uspos] != "O" && check_for_draw() == false
        if playerOneTurn
            game_board[uspos] = "X"
        else
            game_board[uspos] = "O"
        end
        playerOneTurn = (!playerOneTurn)
        if main_check("X") == true
            display()
            println("Player One wins! Congratulations")
            break
        elseif main_check("O") == true
            display()
            print("Player Two wins! Congratulations")
            break
        end
        if check_for_draw() == false
            display()
            if main_check("X") == true
                println("Player One wins! Congratulations")
                break
            elseif main_check("O") == true
                print("Player Two wins! Congratulations")
                break
            end
        else
            print("GG! It's a draw.")
            break
        end
    else
        println("Sorry, try again.")
    end
end
end