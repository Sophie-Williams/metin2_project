quest subquest_5 begin
        state start begin
                when login or levelup with pc.level >= 10 and pc.level <= 15 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20023)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "A favour for Mr.Soon.")
                        end
                end

                when __TARGETF__.target.click or
                        20023.chat." A favour for Mr.Soon" with pc.level >= 10 begin
                        target.delete("__TARGETF__")
                        say_title("Mr.Soon:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Bla, bla ... What the heck... Who are you?")
                        say("Never disturb me while I am reading! Just one minute!")
                        say("")
                        say("Sorry, I didn't want to yell at you. Sometimes I find")
                        say("something while reading that I don't understand and that")
                        say("is very frustrating.")
                        say("")

                     wait()

                         say_title("Mr.Soon:")
                         say("")
                         ----"123456789012345678901234567890123456789012345678901234567890"|
                         say("I am examining the Fan Weapons used by Shamans.")
                         say("")
                         say("I have trouble finding out which are the best and it is")
                         say("impossible for me to test them all. Uriel the Scholar could")
                         say("know about those fans. Can you ask him?")
                         say("")
                         say("I am interested in the following types of fans:")
                         say("")
                         say("Aquatic Fan, Heavenly Bird Fan, Triple Fan, Crane Wing Fan.")
                         say("")
                         wait()

                         say_title("Mr.Soon:")
                         say("")
                         say("I want him to list all fans according to their attack value.")
                         say("")
                        local s=select("I'll do"," I won't do")
                        if 2==s then
                                say("Really end Quest?")
                                local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Mr.Soon:")
                                                say("")
                                                say("That's good to hear.")
                                                say("Simply return later on.")
                                                return
                                        end
                                say_title("Mr.Soon:")
                                say("")
                                say("A shame... ")
                                say("")
                                say("So let me read on.")
				say("")
                                clear_letter()
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Mr.Soon:")
                        say("")
                        say("Really? Now I'm happy!")
                        say("")
                        say("That is going to be a good book.")
                        say("")

                        set_state(ask_to)

                end
        end

        state ask_to begin
                when info or button begin
                        say_title("Help for Mr.Soon.")
                        say("")
                        say("Go to Uriel and ask him for a list of fans.")
                        say("")
                end

                when letter begin
                        local v = find_npc_by_vnum(20011)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "A favour for Mr.Soon.")
                        end
                        send_letter("Help for Mr.Soon.")
                end



                when __TARGETF__.target.click or
                        20011.chat."Help for Mr.Soon" begin
                        target.delete("__TARGETF__")

                        say_title("Uriel:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What brings you to me? The bookworm sent you?")
                        say("")
                        say("He reads about everything, but sometimes I wish he would")
                        say("also learn from it. He is always disturbing me.")
                        say("")
                        say("Well, let me hear what he wants to know this time!")
                        say("")
                        wait()

                        say_title("Uriel:")
                        say("")
                        say("He wants me to list the fans according to their attack")
                        say("values? That's rather easy.")
                        say("")
                        say("Here it is: Heavenly Bird Fan, Triple Fan, Aquatic Fan")
                        say("and Crane Wing Fan.")
                        say("")
                        say("Okay?")
                        say("")

                        set_state(return_to)
                end
        end

        state return_to begin
                when letter begin
                        send_letter("Return to Mr.Soon.")
                        local v = find_npc_by_vnum(20023)
                        if v != 0 then
                                target.vid("__TARGETF__", v, "A favour for Mr.Soon.")
                        end
                end


                when info or button begin
                        say_title("Return to Mr.Soon")
                        say("")
                               ----"12345678901234567890123456789012345678901234567890"|
                        say("Return to Mr.Soon and tell him the information.")
                        say("")
                end

                when __TARGETF__.target.click or 20023.chat."List of fans" begin
                        target.delete("__TARGETF__")
                        say_title("Mr.Soon:")
                        say("")
                        say("So, could Uriel give a clear answer?")
                        say("")

                        local s = select(
                                                                "Aquatic, Heavenly, Crane Wing, Triple.",
                                                                "Heavenly, Triple, Aquatic, Crane Wing.",
                                                                "Heavenly Bird, Triple, Water, Crane Wing.",
                                                                "Oh no, I forgot it.")

                        if s == 2 then
                                say_title("Mr.Soon:")
                                say("")
                                say("Thanks a lot!")
                                say("")
                                say("Now I can read on. Thank you!")
                                say("")

                                pc.give_exp2(6000)
                                set_quest_state("levelup","run")
                                pc.change_money(2000)

                		say_title("Reward")
                		say("")
               			say_reward("You received 6.000 Experience Points.")
                                say_reward("You received 2.000 Yang.")
                                say("")

                                clear_letter()

                                set_state(__COMPLETE__)

                        elseif s==4 then
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Mr.Soon:")
                        say("")
                        say("I am not sure if that is correct.")
                        say("Please verify it.")
                        say("")
                        local s=select("Yes it is correct","I am not sure")
                        if 2==s then
                        say("End Quest?")
                        local a=select("Yes","No")
                        if  2==a then
                        say_title("Mr.Soon:")
                        say("")
                        say("Good to hear, come back later.")
                        say("")
                        return
                        end
                        say_title("Mr.Soon:")
                        say("")
                        say("That's not good to hear!")
                        say("Go away...")
                        say("")
                        set_state(__GIVEUP__)
        end
        say_title("Mr.Soon:")
        say("")
        say("Wonderful, then come back later. ")
        say("")
set_state(ask_to)

                        else
                                say_title("Mr.Soon:")
                                say("")
                                say("Are you sure that the order is correct?")
                                say("")
                                local s=select("Yes I am","no, not really.")
                                if 2==s then
                                        say("End Quest?")
                                        local a=select("Yes","No")
                                                if  2==a then
                                                        say_title("Mr.Soon:")
                                                        say("")
                                                        say("Good to hear.")
                                                        say("")
                                                        say("Come back later.")
                                                        say("")
                                                        return
                                                end
                                        say_title("Mr.Soon:")
                                        say("")
                                        say("Would have been too good.")
                                        say("")
                                        say("Go away...")
                                        say("")
                                        set_state(__GIVEUP__)
                                end
                                say_title("Mr.Soon:")
                                say("")
                                say("I don't think that's correct. Please ask him")
                                say("again and pay attention.")
                                say("")
                                set_state(ask_to)
                        end
                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end
