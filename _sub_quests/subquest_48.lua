--------------------------------------------------
-- SUB QUEST
-- LV  58
-- Secret Information from the Spy
----------------------------------------------------

quest subquest_48  begin
        state start begin
                when login or levelup with pc.level >= 58 and pc.level <= 60 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Go to the Captain")
                        end
                end

                when __TARGET__.target.click or
                        20355.chat."Find the Spy"  begin
                        target.delete("__TARGET__")
                        say_title("Captain:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("As all our neighbour countries are enemies,")
                        say("it is important to have friends there")
                        say("who go undercover and help us")
                        say("to get information so that we can defend from")
                        say("attacks. It is extremely important")
                        say("that the cover of those spies never gets blown,")
                        say("because we then could never react to attacks")
                        say("on time.")
                        say("")
                        wait()
                        say_title("Captain:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("You surely know Yu-Hwan the Musician??")
                        say("He is a spy as well for us and has his cover as a ")
                        say("musician. One spy alone doesn't help,")
                        say("we have several all over the world.")
                        say("Some are even as fishers in the")
                        say("first village.")
                        say("")
                        wait()
                        say_title("Captain:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("As I can't get into contact with them")
                        say("without blowing their cover, I'm in need")
                        say("for help from fearless soldiers")
                        say("like you.")
                        say("Would you please go to the fisherman and get me")
                        say("the information I urgently need")
                        say("to protect our kingdom?")
                        say("")
                        local r=select("Accept", "Reject")
                        if 2==r then
                                say("Are you sure you don't want to help??")
                                local a=select("Yes" ,"No")
                                if 2==a then
                                        say_title("Captain:")
                                        ----"12345678901234567890123456789012345678901234567890"|
                                        say("")
                                        say("You first want to prepare?")
                                        say("Then come by later.")
                                        say("But please hurry up,")
                                        say("it is really urgent!")
                                        return
                                end
                                say_title("Captain:")
                                say("")
                                say("What's up with you?")
                                say("last time you made fantastic work on ")
                                say("our side! I can't believe that you")
                                say("simply leave us behind.")
                                say("But your choice, nothing we can do..")
                                say("Bye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Captain:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Yeah!")
                        say("I knew I could rely on you.")
                        say("Good luck and take care.")
                        say("")
                        set_state(go_to_otherland)

                end
        end
        state go_to_otherland begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Meet the Spy")
                        q.set_title("Meet the Spy")
                        q.start()


                end

                function is_other_vil()
                        local empire = pc.get_empire()
                        local map_num= pc.get_map_index()

                        local is_village = 0

                        if empire == 1 and map_num == 41 then is_village = 1 end
                        if empire == 2 and map_num ==  1 then is_village = 1 end
                        if empire == 3 and map_num == 21 then is_village = 1 end
                        return is_village
                end

                when info or button begin
                        local empire = pc.get_empire()

                        if empire==1 then
                                say_title("Search for the Spy")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("The Spies covering as fisherman can be found in")
                                say("the village Pyoungmu of the Elgoria kingdom.")
                                say("They collect secret information about")
                                say("other countries. Try to get in contact")
                                say("with them. As soon as you have some information,")
                                say("go to the Captain and tell him")
                                say("what you were told.")
                                say("")

                        elseif  empire ==2 then
                                say_title("Search for the Spy")
                                say("")
                                say("The Spies covering as fisherman can be found in")
                                say("the village Youngan of the Pandemonia kingdom.")
                                say("They collect secret information about")
                                say("other countries. Try to get in contact")
                                say("with them. As soon as you have some information,")
                                say("go to the Captain and tell him")
                                say("what you were told.")
                                say("")

                        elseif  empire ==3 then
                                say_title("Search for the Spy")
                                say("")
                                say("The Spies covering as fisherman can be found in")
                                say("the Village Joan of the Asmodia Kingdom.")
                                say("They collect secret information about")
                                say("other countries. Try to get in contact")
                                say("with them. As soon as you have some information,")
                                say("go to the Captain and tell him")
                                say("what you were told.")
                                say("")

                        end
        end



                when __TARGET__.target.click or
                         9009.chat."What are you doing"  with subquest_48.is_other_vil() ==1  begin
                         target.delete("__TARGET__")
                         say_title("Fisherman:")
                         say("")
                         ----"12345678901234567890123456789012345678901234567890"|
                         say("Psst, be quiet!! You chase away")
                         say("all fish. Why are you here anyway?")
                         say("You are that loud and clumsy, you are")
                         say("surely not here for fishing.")
                         say("")
                         wait()
                         say_title("Fisherman:")
                         say("")
                         ----"12345678901234567890123456789012345678901234567890"|
                         say("Ah, I understand.")
                         say("I have expected you for a while, you are late.")
                         say("It wasn't easy to get this information")
                         say("without being caught. You have to know ")
                         say("that enemies are everywhere and they want ")
                         say("that we betray ourselves.")
                         say("")
                         wait()
                         say_title("Fisher:")
                         say("")
                         ----"12345678901234567890123456789012345678901234567890"|
                         say("So, let's do this fast, ")
                         say("before someone sees us. Here you have the")
                         say("documents. Get on your way immediately and")
                         say("give them to the Captain only.")
                         say("")
                         wait()
                         ----"12345678901234567890123456789012345678901234567890"|
                         say_title("Fisherman")
                         say("")
                         say("One second! I have something for you.")
                         say("A little present.")
                         say("So, now leave. Bye.")
                         wait()
                         say_title("Information:")
                         say("")
                         say_reward("Because you are very nosy, you open")
                         say_reward("the package to see what the Fisherman gave")
                         say_reward("you.")
                         say("")
                         wait("")
                        say_pc_name()
                        say("")
                        say("Ooh, great!")
                        say("Grilled Rudd!")
                        say("")
                        say_item_vnum(27873)
                        say_reward("You received 3 grilled Rudd.")
                        pc.give_item2(27873,3)
                        set_state(back_to_boss)

                        end
        end


state back_to_boss begin
        when letter begin
                        send_letter("Return to the Captain")

                        if subquest_48.is_my_vil()==1  then
                                local v=find_npc_by_vnum(20355)
                                if 0==v then
                                else
                                        target.vid("__TARGET__", v, "The Captain")
                                end
                        end

                end
                when info or button begin
                        local empire = pc.get_empire()

                        if empire==1 then  --Pandemonia
                                say_title("Search for the Spy")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("")
                                say("You have received from the spy in the Village Pyoungmu")
                                say("of the Elgoria kingdom who hides as a fisherman")
                                say("the important information the ")
                                say("Captain awaits impatiently.")
                                say("Now go back to your kingdom")
                                say("and deliver the information to the Captain.")
                                say("")

                        elseif  empire ==2 then --Asmodia
                                say_title("Search for the Spy")
                                say("")
                                say("You have received from the spy in the Village Youngan")
                                say("of the Pandemonia kingdom who hides as a fisherman")
                                say("the important information the ")
                                say("Captain awaits impatiently")
                                say("Now go back to your kingdom")
                                say("and deliver the information to the Captain.")
                                say("")

                        elseif  empire ==3 then  --Elgoria
                                say_title("Search for the Spy")
                                say("")
                                say("You have received from the spy in the Village Joan")
                                say("of the Asmodia kingdom who hides as a fisherman")
                                say("the important information the ")
                                say("Captain awaits impatiently")
                                say("Now go back to your kingdom")
                                say("and deliver the information to the Captain.")
                                say("")
                        end

                end

                        function is_my_vil()
                        local empire = pc.get_empire()
                        local map_num= pc.get_map_index()

                        local is_village = 0

                        if empire == 1 and map_num == 1 then is_village = 1 end
                        if empire == 2 and map_num == 21 then is_village = 1 end
                        if empire == 3 and map_num == 41 then is_village = 1 end
                        return is_village
                end



                when __TARGET__.target.click or
                         20355.chat."Successful Mission"  with subquest_48.is_my_vil() ==1 begin
                         target.delete("__TARGET__")
                         say_title("Captain:")
                         say("")
                         ----"12345678901234567890123456789012345678901234567890"|
                         say("Those are the documents? Great!")
                         say("Thanks.")
                          say("Now we know about the plans of our enemy and can")
                         say("make important arrangement against them.")
                         say("Now we have nothing to fear anymore.")
                         say("")

                         say_reward("You received 50.000 Yang .")
                         pc.change_money(50000)

                         say_reward("You received 5.500.000 Experience Points.")
                     	pc.give_exp2(5500000)
                     	say_reward("You received Diamond Buddah Scroll.")
                     	pc.give_item2(71113,5)
                        set_quest_state("levelup","run")

                         clear_letter()
                    set_state(__COMPLETE__)
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
