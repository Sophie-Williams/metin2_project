--------------------------------------------
--SUB QUEST
--LV 46
--Help the soldiers rest in peace
--------------------------------------------
quest subquest_42 begin
        state start begin
                when login or levelup with pc.level >= 46 and pc.level <= 48 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum= 20306
                        elseif pc.get_empire() == 2 then
                                vnum= 20326
                        elseif pc.get_empire() == 3 then
                                vnum=20346
                        end


                        local v=find_npc_by_vnum(vnum)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "For the Rest of the Dead")
                        end
                end

                when __TARGET__.target.click or
                 20306.chat."For the Rest of the Dead"  begin
                        target.delete("__TARGET__")
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        ---                                                   l
                        say("Terrible wars kill young men, more and")
                        say("more die.")
                        say("They are fighters on the frontline,")
                        say("fighting for themselves, their families,")
			say("their countries.")
                        say("But after death, some of them don't go")
                        say("to heaven and they stay in this world.")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("It is said that those got somehow ")
                        say("resistent against death during war.")
                        say("They still believe they have to")
                        say("defend their country.")
                        say("To calm them down is one of the tasks")
                        say("of our Shamans.")
                        say("They have a ceremony to calm them down.")
                        say("They need a special Esoteric Dogmata and")
                        say("Esoteric Symbol, but nowadays hard to find.")
                        say("Could you try to get it for us?")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("I heard that in the Dark Temple")
                        say("dark fighters have a Esoteric Dogmata and a ")
                        say("Esoteric Symbol. Please help me to calm")
                        say("down our comrades who died for ")
                        say("our country.")
                        say("I am sure, with your help the young dead")
                        say("warriors soon can be in heaven.")
                        say("")

                        local s=select("I'll help you.","I'm sorry, I can't do it now.")
                        if 2==s then
                                say("Cancel Quest?")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Teacher of the Dragon Force:")
                                        say("")
                                        say("Help us to calm down their souls")
                                        say("so they can rest in peace.")
                                        say("I'll wait here for you.")
                                        say("")
                                        return
                                end
                                say_title("Teacher of the Dragon Force:")
                                say("")
                                say("Sorry to hear this.")
                                say("I hear so many voices of the dead")
                                say("who can't rest...")
                                say("We have to calm them down.")
                                say("I'll ask someone else...")
                                say("Goodbye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("You are so brave.")
                        say("I am sure they can go to heaven,")
                        say("thanks to you.")
                        say("")
                        set_state(for_the_die)

                        end

                when __TARGET__.target.click or
                 20326.chat."For the Rest of the Dead"  begin
                        target.delete("__TARGET__")
                        say_title("For the Rest of the Dead")
                        say("")
                        ---                                                   l
                        say("Terrible wars kill young men, more and")
                        say("more die.")
                        say("They are fighters on the frontline,")
                        say("fighting for themselves, their families,") 
			say("their countries.")
                        say("But after death, some of them don't go")
                        say("to heaven and they stay in this world.")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("It is said that those got somehow ")
                        say("resistent against death during war.")
                        say("They still believe they have to")
                        say("defend their country.")
                        say("To calm them down is one of the tasks")
                        say("for our Shamans..")
                        say("They have a ceremony to calm them down.")
                        say("They need a special Esoteric Dogmata and")
                        say("Esoteric Symbol, but nowadays hard to find.")
                        say("Could you try to get it for us?")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("I heard that in the Dark Temple")
                        say("dark fighters have a Esoteric Dogmata and a ")
                        say("Esoteric Symbol. Please help me to calm")
                        say("down our comrades who died for ")
                        say("our country..")
                        say("I am sure, with your help the young dead")
                        say("warriors soon can be in heaven.")
                        say("")

                        local s=select("I'll help.","Sorry, too much to do.")
                        if 2==s then
                                say("You want to cancel the Quest?")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Teacher of the Dragon Force:")
                                        say("")
                                        say("Help us to calm down their souls")
                                        say("so they can rest in peace.")
                                        say("I'll wait here for you.")
                                        say("")
                                        return
                                end
                                say_title("Teacher of the Dragon Force:")
                                say("")
                                say("Sorry to hear this.")
                                say("I hear so many voices of the dead")
                                say("who can't rest...")
                                say("We have to calm them down..")
                                say("I ask someone else.")
                                say("Goodbye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("You are so brave.")
                        say("I am sure they can go to heaven,")
                        say("with your help.")
                        say("")
                        set_state(for_the_die)

                        end



                when __TARGET__.target.click or
                 20346.chat."For the Rest of the Dead"  begin
                        target.delete("__TARGET__")
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        ---                                                   l
                        say("Terrible wars kill young men, more and")
                        say("more die.")
                        say("They are fighters on the frontline,")
                        say("fighting for themselves, their families,") 
			say("their countries.")
                        say("But after death, some of them don't go")
                        say("to heaven and they stay in this world.")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("It is said that those got somehow ")
                        say("resistent against death.")
                        say("They still believe they have to")
                        say("defend their country.")
                        say("It is one of the tasks for our shamans to")
                        say("calm them down.")
                        say("They have a ceremony to calm then down.")
                        say("They need a special Esoteric Dogmata")
                        say("and Esoteric Symbol you won't find easy nowadays.")
                        say("Could you get it for us?")
                        say("")
                        wait()
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("I heard that in the Dark Temple")
                        say("dark fighters have a Esoteric Dogmata and a ")
                        say("Esoteric Symbol. Please help me to calm")
                        say("down our comrades who died for ")
                        say("our country.")
                        say("I am sure that those young warriors can")
                        say("soon go to heaven, thanks to you.")
                        say("")

                        local s=select("I'll help.","Sorry, I have no time.")
                        if 2==s then
                                say("You want to cancel this Quest?")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Teacher of the Dragon Force:")
                                        say("")
                                        say("Help us to calm down their souls.")
                                        say("They have to rest in peace.")
                                        say("I'll wait here for you!")
                                        say("")
                                        return
                                end
                                say_title("Teacher of the Dragon Force:")
                                say("")
                                say("I'm sorry to hear this.")
                                say("I hear so many voices of the dead")
                                say("who can't rest...")
                                say("We have to calm them down..")
                                say("I'll ask someone else.")
                                say("Goodbye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("You are so brave.")
                        say("I am sure they can go to heaven,")
                        say("with your help.")
                        say("")
                        set_state(for_the_die)

                        end

                end


        state for_the_die begin

                when letter begin

                        setskin(NOWINDOW)
                        makequestbutton("For the Rest of the Dead.")
                        q.set_title("For the Rest of the Dead.")
                        q.start()

                        if  pc.count_item("30147") >=1 and  pc.count_item("30148") >=1 then
                                        local vnum=0

                                        if pc.get_empire() == 1 then
                                                vnum= 20306
                                        elseif pc.get_empire() == 2 then
                                                vnum= 20326
                                        elseif pc.get_empire() == 3 then
                                                vnum= 20346
                                        end

                                        local v=find_npc_by_vnum(vnum)
                                        if 0!= v then
                                                target.vid("__TARGET__",v,"")
                                        end
                                end

                end


                when info or  button begin
                        if  pc.count_item("30147") >=1 and  pc.count_item("30148") >=1 then
                                say_title("Get the Dogmata and Symbol ")
                                say("")
                                say("Get Dogmata and Symbol")
                                say("to calm down the dead soldiers.")
                                say("Carry it to the Teacher of the Dragon Force")
                                say("")
                                return
                        end

                        say_title("Get the Esoteric Dogmata and the Esoteric Symbol")
                        say("")
                        say("We need a Esoteric Dogmata and a")
                        say("Esoteric Symbol to calm down the soldiers")
                        say("who dies during the war.")
                        say("You can get them from the Proud Dark Colonel,")
                        say("Proud Dark Rifleman and Elite Esoteric Tormentor.")
                        say("Get the Esoteric Dogmata and the Esoteric Symbol")
                        say("so that the dead can rest in peace.")
                        say("")

                end



                when 734.kill or 735.kill or 736.kill  begin
                        local s = number(1, 100)

                        if s <= 5 and pc.count_item(30147)==0 then
                                pc.give_item2(30147, 1)
                        end

                        local a = number(1, 100)
                        if a <= 5 and pc.count_item(30148)==0 then
                                pc.give_item2(30148, 1)
                        end


                end


                when __TARGET__.target.click or
                        20306.chat."You have the Esoteric Dogmata and the Esoteric Symbol" with pc.count_item("30147") >=1 and  pc.count_item("30148") >=1 begin

                        target.delete("__TARGET__")
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("That was great.")
                        say("Now we can calm down the dead soldiers.")
                        say("They did their best, now they can rest")
                        say("after their death.")
                        say("I will pay you for your help,")
                        say("because you helped our comrades.")
                        say("")
                        pc.remove_item("30147",1)
                        pc.remove_item("30148",1)

                        say_reward("You received 1.700.000 Experience Points.")
                        pc.give_exp2(1700000)
                        set_quest_state("levelup","run")


                        say_reward("You received 3 Diamonds.")
                        pc.give_item2(50621)
                        pc.give_item2(50621)
                        pc.give_item2(50621)

                        say_reward("You received 30.000 Yang.")
                        pc.change_money(30000)

                        clear_letter()
                        set_state(COMPLETE)

                end

                when __TARGET__.target.click or
                        20326.chat."You have the Esoteric Dogmata and the Esoteric Symbol." with pc.count_item("30147") >=1 and  pc.count_item("30148") >=1 begin

                        target.delete("__TARGET__")
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("Thanks to you.")
                        say("Now we can calm down our soldiers.")
                        say("They did their best, now they can")
                        say("rest after their death.")
                        say("I'll pay you for your help,")
                        say("because you helped our comrades.")
                        say("")
                        pc.remove_item("30147",1)
                        pc.remove_item("30148",1)

                        say_reward("You received 1.700.000 Experience Points.")
                        pc.give_exp2(1700000)
                        set_quest_state("levelup","run")


                        say_reward("You received 3 Diamonds.")
                        pc.give_item2(50621)
                        pc.give_item2(50621)
                        pc.give_item2(50621)

                        say_reward("You received 30.000 Yang.")
                        pc.change_money(30000)

                        clear_letter()
                        set_state(COMPLETE)

                end

                when __TARGET__.target.click or
                        20346.chat."You got the Esoteric Dogmata and the Esoteric Symbol." with pc.count_item("30147") >=1 and  pc.count_item("30148") >=1 begin

                        target.delete("__TARGET__")
                        say_title("Teacher of the Dragon Force:")
                        say("")
                        say("Thanks a lot.")
                        say("Now we can calm down the dead soldiers.")
                        say("They did their best, now they can rest")
                        say("after their death.")
                        say("I'll pay you for your help,")
                        say("because you helped our comrades.")
                        say("")
                        pc.remove_item("30147",1)
                        pc.remove_item("30148",1)

                        say_reward("You received 2.000.000 Experience Points.")
                        pc.give_exp2(2000000)
                        set_quest_state("levelup","run")


                        say_reward("You received 3 Diamonds.")
                        pc.give_item2(50621)
                        pc.give_item2(50621)
                        pc.give_item2(50621)

                        say_reward("You received 50.000 Yang.")
                        pc.change_money(50000)

                        clear_letter()
                        set_state(COMPLETE)

                end

end

        state __GIVEUP__ begin
        end

        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end


end
