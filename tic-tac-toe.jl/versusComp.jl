#=
@about : Classic Tic-Tac-Toe Game Implementation in Julia for GCI'19 (Single Player)
@author : PseudoCodeNerd
@sdate : 1/01/2020
Basic AI Developed. Computer ain't dumb !
=#

println("TicTacToe\nWelcome, You are X. The computer is O.\n\nLet's Start.")
println("--------------------------------")

game_board = [" ", " ", " ",
                " ", " ", " ",
                " ", " ", " "]
temporary_board = [" ", " ", " ",
                " ", " ", " ",
                " ", " ", " "]

function temp_row_check(c, one, two, three)
    if c == temporary_board[one] == temporary_board[two] == temporary_board[three]
        return true
    end
end

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

function check_freepos(freepos)
    for i in freepos
        temporary_board[i] = "O"
        if main_check("O") == true
            return true
            break 
        else 
            return false
            break
        end 
        temporary_board[i] = " "
    end
end

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

function check_row(c, one, two, three)
    if c == game_board[one] == game_board[two] == game_board[three]
        return true
    end
end

display()

function check_all(a)
    if check_row(a,3,6,9) == true
        return true
    elseif check_row(a,1,4,7) == true
        return true
    elseif check_row(a,2,5,8) == true
        return true
    elseif check_row(a,1,2,3) == true
        return true
    elseif check_row(a,4,5,6) == true
        return true
    elseif check_row(a,7,8,9) == true
        return true
    elseif check_row(a,1,5,9) == true
        return true
    elseif check_row(a,3,5,7) == true
        return true
    else
        return false
    end 
end

play = true

function ai_move()
    check1 = false
    check2 = false 
    freepos = []
    m = 0

    for i in 1:9
        if game_board[i] != "X" && game_board[i] != "O"
            push!(freepos, i)
        end 
    end 

    for i in 1:9
        temporary_board[i] = game_board[i]
    end 

    for i in freepos
        temporary_board[i] = "X"
        if main_check("X") == true
            m = i
            check1 = true
            check2 = true
            break
        else 
            check1 = false 
        end
        temporary_board[i] = " "
    end

    if check1 == false 
        for i in freepos 
            temporary_board[i] = "O"
            if main_check("O") == true
                return Int(i)
                break
            else 
                return freepos[rand(1:length(freepos))]
            end
            break
        temporary_board[i] = " "
        end
    else
        if check_freepos(freepos) == true
            for i in freepos
                temporary_board[i] = "O"
                if main_check("O") == true
                    return Int(i)
                    break
                else
                    return freepos[rand(1:length(freepos))]
                break
                temporary_board[i] = " "
                end 
            end
        else
            return Int(m)
        end
    end      
end

function play_game()
    freepos = []
    for i in 1:9
        if game_board[i] != "X" && game_board[i] != "O"
            push!(freepos, i)
        end
    end
    if length(freepos) == 0 && check_all("O") == false && check_all("X") == false
        return true
    else
        return false
    end
end

while play == true
    println("Enter the position : ")
    uspos = string(readline())
    uspos = parse(Int,uspos)
    if (game_board[uspos] != "X" && game_board[uspos] != "O" && play_game()) == false
        game_board[uspos] = "X"
        if check_all("X") == true
            display()
            println("You win! Congratulations")
            break
        elseif check_all("O") == true
            display()
            print("F.\nYou lose.")
            break
        end
        if play_game() == false
            oppos = ai_move()
            game_board[oppos] = "O"
            display()
            if check_all("X") == true
                println("You win! Congratulations")
                break
            elseif check_all("O") == true
                print("F.\nYou lose.")
                break
            end
        else
            display()
            print("GG! It's a draw.")
            break
        end
    else
        println("Sorry, try again.")
    end
end    
