#=
                      __                                                                      .__                                  
_______  ____   ____ |  | __         ___________  ______   ___________            ______ ____ |__| ______ _________________  ______
\_  __ \/  _ \_/ ___\|  |/ /  ______ \____ \__  \ \____ \_/ __ \_  __ \  ______  /  ___// ___\|  |/  ___//  ___/  _ \_  __ \/  ___/
 |  | \(  <_> )  \___|    <  /_____/ |  |_> > __ \|  |_> >  ___/|  | \/ /_____/  \___ \\  \___|  |\___ \ \___ (  <_> )  | \/\___ \ 
 |__|   \____/ \___  >__|_ \         |   __(____  /   __/ \___  >__|            /____  >\___  >__/____  >____  >____/|__|  /____  >
                   \/     \/         |__|       \/|__|        \/                     \/     \/        \/     \/                 \/ 

=#

commands = ["R", "P", "S"]
AI = rand(["Mrs. Julia Random", "Viral Shah", "T.H.U.R.S.D.A.Y.", "King Julien", "Dormammu", "Soumi Boi", "Vizzini", "Doctor Evil"])
score_sheet = [0,0]
over = false

println("Rocks, Paper and Scissors | The Game | Best of 5\n")
println("----------------------------------")

round = 1

while !over
    println("Rules\n\nRock beats Scissors\nPaper beats Rock\nScissors (cut?) Paper\nexit to quit.\n")
    println("---------------------------------------------------")
    println("Enter R for rock, S for scissors and P for paper.\n\n")
    println("WELCOME TO THE ARENA\n")
    println("HUMAN RPS CHAMPION v/s $AI\n")

    println("Puny Little Human : ")

    user_inp = string(readline())

    if user_inp in commands
        
    elseif user_inp == "exit"
        game_on = false
        exit()
    elseif user_inp != (x for x in commands)
        println("Enter Valid Command : ")
        user_inp = string(readline())
    end

    println(user_inp == "R" ? "Puny Little Human : Rock " : "")
    println(user_inp == "P" ? "Puny Little Human : Paper " : "")
    println(user_inp == "S" ? "Puny Little Human : Scissors " : "")

    println("----- AI is thinking -----\n")
    sleep(1)

    BIG_BRAIN_MOMENT = rand(["R", "P", "S"])

    println(BIG_BRAIN_MOMENT == "R" ? "$AI : Rock " : "")
    println(BIG_BRAIN_MOMENT == "P" ? "$AI : Paper " : "")
    println(BIG_BRAIN_MOMENT == "S" ? "$AI : Scissors " : "")

    #user winning cases
    BIG_BRAIN_MOMENT == "P" && user_inp == "R" ? score_sheet[2] +=1 : ""
    BIG_BRAIN_MOMENT == "S" && user_inp == "P" ? score_sheet[2] +=1 : ""
    BIG_BRAIN_MOMENT == "R" && user_inp == "S" ? score_sheet[2] +=1 : ""

    #AI winning cases
    user_inp == "P" && BIG_BRAIN_MOMENT == "R" ? score_sheet[1] +=1 : ""
    user_inp == "S" && BIG_BRAIN_MOMENT == "P" ? score_sheet[1] +=1 : ""
    user_inp == "R" && BIG_BRAIN_MOMENT == "S" ? score_sheet[1] +=1 : ""



    println("----------------------------------")

    println("| HUMAN  | $AI")
    println("|    $(score_sheet[1])   |    $(score_sheet[2])")
    println("----------------------------------")
    global round +=1
    println("Advancing to Round $round")

    println(score_sheet[1] == 5 ? "PUNY LITTLE HUMAN WON!" 
    : score_sheet[2] == 5 ? "$AI WON!" : "")

    score_sheet[1] == 5 || score_sheet[2] == 5 ? exit() : sleep(1)

    
end

#=
                      __                                                                      .__                                  
_______  ____   ____ |  | __         ___________  ______   ___________            ______ ____ |__| ______ _________________  ______
\_  __ \/  _ \_/ ___\|  |/ /  ______ \____ \__  \ \____ \_/ __ \_  __ \  ______  /  ___// ___\|  |/  ___//  ___/  _ \_  __ \/  ___/
 |  | \(  <_> )  \___|    <  /_____/ |  |_> > __ \|  |_> >  ___/|  | \/ /_____/  \___ \\  \___|  |\___ \ \___ (  <_> )  | \/\___ \ 
 |__|   \____/ \___  >__|_ \         |   __(____  /   __/ \___  >__|            /____  >\___  >__/____  >____  >____/|__|  /____  >
                   \/     \/         |__|       \/|__|        \/                     \/     \/        \/     \/                 \/ 

=#


# inserting comments just to increase my lines of *cough* code *cough*