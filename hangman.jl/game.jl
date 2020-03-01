title = """

      ___           ___           ___           ___           ___           ___           ___     
     /__/\\         /  /\\         /__/\\         /  /\\         /__/\\         /  /\\         /__/\\    
     \\  \\:\\       /  /::\\        \\  \\:\\       /  /:/_       |  |::\\       /  /::\\        \\  \\:\\   
      \\__\\:\\     /  /:/\\:\\        \\  \\:\\     /  /:/ /\\      |  |:|:\\     /  /:/\\:\\        \\  \\:\\  
  ___ /  /::\\   /  /:/~/::\\   _____\\__\\:\\   /  /:/_/::\\   __|__|:|\\:\\   /  /:/~/::\\   _____\\__\\:\\ 
 /__/\\  /:/\\:\\ /__/:/ /:/\\:\\ /__/::::::::\\ /__/:/__\\/\\:\\ /__/::::| \\:\\ /__/:/ /:/\\:\\ /__/::::::::\\
 \\  \\:\\/:/__\\/ \\  \\:\\/:/__\\/ \\  \\:\\~~\\~~\\/ \\  \\:\\ /~~/:/ \\  \\:\\~~\\__\\/ \\  \\:\\/:/__\\/ \\  \\:\\~~\\~~\\/
  \\  \\::/       \\  \\::/       \\  \\:\\  ~~~   \\  \\:\\  /:/   \\  \\:\\        \\  \\::/       \\  \\:\\  ~~~ 
   \\  \\:\\        \\  \\:\\        \\  \\:\\        \\  \\:\\/:/     \\  \\:\\        \\  \\:\\        \\  \\:\\     
    \\  \\:\\        \\  \\:\\        \\  \\:\\        \\  \\::/       \\  \\:\\        \\  \\:\\        \\  \\:\\    
     \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/    


He doesn't know that your IQ may lead to his demise.

"""

hang_boi_stages = [
"""
  +---+
  |   |
      |
      |
      |
      |
=========
Hey Waddup Bruv ! How You Doin' ?
""",   
"""
  +---+
  |   |
  O   |
      |
      |
      |
=========
Bro WTH ! Why's there's a noose around mah Neck!?
""", 
"""
  +---+
  |   |
  O   |
  |   |
  |   |
      |
      |
=========
Dude Seriously ! What are you doing ????
""", 
"""
  +---+
  |   |
  O   |
 /|   |
  |   |
      |
      |
=========
Aww Crap ! You're trying to hang me! right ?
""",
"""
  +---+
  |   |
  O   |
 /|\\  |
  |   | 
      |
      |
=========
Bro You should've given up by now YO! SRSLY...
""",
"""
  +---+
  |   |
  O   |
 /|\\  |
  |   |
 /    |
      |
=========
Ok Ok! Go On! You are of no use.... You'll kill me I'm sure now!
""",
"""
  +---+
  |   |
  O   |
 /|\\  |
  |   | 
 / \\  |
      |
=========

________
||
||
------
||
||
||        in the CHATS!
"""

]

println(title)

chanceOn = 1

someoneWon = false

function show_boi()
    global chanceOn = chanceOn+1
    println(hang_boi_stages[chanceOn])
end

function initialize()
    println("Player 1, Enter Word (give a difficult one, rek PL2 !) : ")
    global word = string(readline())
    global word_lis = collect(word)
    
    println("""
    
    
    
















    
    
    """)  
    sleep(2)
    global guess_lis = fill('_', length(word_lis))
    global guessword = join(guess_lis) #using join method to bring elements of guess_lis in a string
end



function check()
    letFound = false
    println("Player 2, Guess a letter of this word (single character): ")
    user_inp = string(readline())
    user_inp = collect(user_inp)
    if length(user_inp) == 1#continuing if input is single character

    else
         println("Don't try to be SMORT! Enter single letter at a time.")
         user_inp = string(readline())
    end
   for i=1:length(word_lis)#checking and replacing for correct string.
        
       if word_lis[i]==user_inp[1]
            guess_lis[i] = word_lis[i]
            letFound = true
            println("Yeet! Correct Letter")
        end   
    
    end

    if letFound == false
       show_boi() 
    end

    guess = join(guess_lis)
    print(guess)
    println("")

end

initialize()

println(guessword) #printing the dashed/currently dashed word

while (someoneWon == false && chanceOn<7)

    check() #calling our function
    if word_lis == guess_lis
       someoneWon = true
       println("Ahh! You saved the Hang Boi! Great Job\n Player 2 Wins!")
       break
    end
    
    if chanceOn>=7
        print("F! Hang Boi is Ded. All because of you.\n Player 1 Wins!")
        break
    end

end

# 


