----------------------------------------------------
-- SUB QUEST
-- LV 55
-- Ver?er Balso"s Portion
----------------------------------------------------

quest subquest_39 begin
        state start begin
                when login or levelup or enter with pc.level >= 55 and pc.level <= 57 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20020)

                        if v != 0 then
                                target.vid("__TARGET2__", v, "Delivery of Balso the Traitor")
                        end
                end


                when __TARGET2__.target.click or
                        20020.chat."The Cure for Balso" with pc.level >= 55 begin
                        target.delete("__TARGET2__")

                        say_title("Balso:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Thanks that you brought me that medicine the last")
                        say("time. But there is a problem...")
                        say("The medicine doesn't help anymore.")
                        say("I think it went bad. *cough*")
                        say("I need treatment.")
                        say("")
                        wait()
                        say_title("Balso:")
                        say("")
                        say("I know that there is a doctor living in")
                        say("the next village. Can you go to him and explain")
                        say("how I feel, so that he can tell you what can be done?")
                        say("As you see, I can't leave the village in that state")
                        say("at all. I am very thankful you helped")
                        say("me last time and be sure that")
                        say("I will also reward you this")
                        say("time.")
                        say("")
                        local s=select("Accept","Cancel")
                        if 2==s then
                                say("You want to make the Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Balso")
                                        say("")
                                        say("When you know how to help")
                                        say("me, we meet again.")
                                        return
                                end
                                say_title("Balso:")
                                say("")
                                say("Seems I have to live on this way..")
                                say("See you.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Balso")
                        say("")
                        say("Thanks. Be careful.")
                        say("")
                        set_state(ask_to_backgo)



                end
        end

        state ask_to_backgo begin
                when info or button begin
                        say_title("State of Balso")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Balsos state went worse. I will")
                        say("search Dr. Baek-Go.")
                        say("I want to talk to him about Balso��s ")
                        say("state so that I can help him maybe.")
                        say("")
                end

                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Baek-Go")
                        q.set_title("Go to Baek-Go.")
                        q.start()

                        local v=find_npc_by_vnum("20018")
                        if 0== v then
                        else
                                target.vid("__TARGET2__",v,"Go to Baek-Go")
                        end
                end

                when __TARGET2__.target.click or
                        20018.chat."Balso bad state" begin
                        target.delete("__TARGET2__")
                        say_title("Baek-Go: ")
                        say("")
                        say("Oh, it's you, how are you?")
                        say("Hmm, there is a patient with a disease?")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("And you want to know how to heal him. How ")
                        say("was he treated?")
                        say("WHAT??? He ate the medicine?")
                        say("Aha...")
                        say("It is dangerous when you don't know what")
                        say("you take against a disease.")
                        say("")
                        wait()
                        say_title("Baek-Go:")
                        say("")
                        say("I know about a herb that")
                        say("regenerates the body.")
                        say("It helped many people, this herb is")
                        say("the best medicine for such, it")
                        say("cleans the body from poison and gives")
                        say("health back.")
                        say("The search for it is very dangerous though..")
                        wait()
                        say_title("Baek-Go:")
                        say("")
                        say("The herb grows in the Ape Dungeon.")
                        say("I heard the Rock Ape has it.")
                        say("He thinks it is simply something to eat.")
                        say("I can make the medicine when you")
                        say("bring me the herb.")
                        say("")
                        local b=select("Ok I will get it.", "I can't do this.")
                        if 2==b then
                                say("You want to do this task?")
                                local a=select("Yes, sure.","No.")
                                if  2==a then
                                        say_title("Baek-Go:")
                                        say("")
                                        say("Well, then later when you have more time.")
                                        say("Many people are ill, only few search for")
                                        say("medicine.")
                                        say("")
                                        return
                                end
                                say_title("Baek-Go:")
                                say("")
                                say("Hmm, a shame.")
                                say("No one is brave enough.")
                                say("I am worried about the future, don't know")
                                say("how all shall go on.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Baek-Go:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Oh, thanks, get that herb fast from the Rock Ape!")
                        say("It will be hard work to get that herb,")
                        say("but you will help many people.")
                        say("Thanks for your help.")
                        say("")
                        set_state(hunt_monkey_boss)

                        end
                end

        state hunt_monkey_boss begin
                when letter begin
                        if pc.count_item(50059)>0 then
                                setskin(NOWINDOW)
                                makequestbutton("Search the Herb in the Joklor Dungeon")
                                q.set_title("Search the Herb in the Joklor Dungeon")
                                q.start()

                                local v=find_npc_by_vnum("20018")
                                if 0== v then
                                else
                                        target.vid("__TARGET2__",v,"Return to Baek-Go")
                                end

                                return
                        end
                        setskin(NOWINDOW)
                        makequestbutton("You have the herb from the Joklor Dungeon.")
                        q.set_title("You have the herb from the Joklor Dungeon.")
                        q.start()
                end
                when button or info begin
                        if pc.count_item(50059)>0 then
                                say_title("Search the Herb in the Joklor Dungeon")
                                say("")
                                say("The cure for the disease of Balso.")
                                say("Carry the herb to Dr. Baek-Go so that he can make")
                                say("medicine for Balso.")
                                say("")
                                return
                        end
                        say_title("How do I get that herb...")
                        say("")
                        say("for Balso��s disease?")
                        say("I need that herb urgently!")
                        say("I can get it from the Rock Ape.")
                        say("He lives in the deepest part of the dungeon.")
                        say_item_vnum(50059)
                        say("")
                end
                when __TARGET2__.target.click or
                        20018.chat."Herb of the Rock Ape" with pc.count_item(50059) ==0 begin
                        say_title("Baek-Go:")
                        say("")
                        say("It seems we will have an epidemic,")
                        say("but we don't know what's the cause.")
                        say("But the academic organisation told us")
                        say("that a cure is possible")
                        say("with the herb.")
                        say("What's up with you?")
                        say("")
                        local s=select("Nothing, I am just wondering.", "I can't get herbs.")
                        if 2==s then
                                say_title("Baek-Go:")
                                say("")
                                say("Oh, you really want to give up..")
                                say("Well, you can't do more.")
                                say("What shall I do without the herb..")
                                say("")
                                say("This herb could be a true help.")
                                local s=select("Refuse help", "I will help.")
                                if 1==s then
                                        say_pc_name()
                                        say("")
                                        say("For me there isn't any possibility to get")
                                        say("the herb of the Rock Ape..")
                                        say("That was it then...")
                                        wait()
                                        say_title("Baek-Go: ")
                                        say("")
                                        say("You refuse to help people who have a disease,")
                                        say("that is terrible!")
                                        say("Go!")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_pc_name()
                                say("")
                                say("Hmm , I don't want to be rewarded for what I do..")
                                say("The love for my country makes me go.")
                                say("My mind is made up, I will help!")
                                say("I really don't want a reward.")
                                say("")
                                return
                        end
                        say_title("Baek-Go:")
                        say("")
                        say("Well then, for what do you wait? Thanks.")
                        say("")
                        return
                end

                when 5161.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("50059")==0 then
                                pc.give_item2(50059, 1)

                        end
                end


                when __TARGET2__.target.click or
                        20018.chat."Herb of the Ape" with pc.count_item(50059)>=1 begin
                        target.delete("__TARGET__")

                        say_title("Baek-Go:")
                        say("")
                        say("You really made it and got the herb!")
                        say("This will defeat the mysterious illness.")
                        say("Wait, I will now make this medicine.")
                        say("Ah, well, very good, very good.")
                        say("")
                        wait()
                        say_title("Baek-Go :")
                        say("")
                        say("Here you have the medicine.")
                        say("Hurry to get to the patient and give it to")
                        say("him, and tell him I pray he will be soon healthy.")
                        say("Please also tell him that it is always better to ")
                        say("only take medicine from a doctor, ")
                        say("and not anything else when not having")
                        say("medical knowledge.")
                        say("")
                        pc.remove_item(50059,1)
                        pc.give_item2(30152,1)
                        set_state(go_to_patient)
                end
        end

        state go_to_patient begin
                when letter begin
                        send_letter("Give Balso the Medicine.")

                        local v=find_npc_by_vnum(20020)
                        if v != 0 then
                                target.vid("__TARGET2__",v,"Balso")
                        end
                end

                when info or button begin
                        say_title("Balso's Medicine")
                        say("")
                        say("Carry the Medicine to Balso.")
                        say("")
                end

                when __TARGET2__.target.click or 20020.chat."Here is the Medicine," with pc.count_item(30152) > 0  begin
                        target.delete("__TARGET2__")
                        say_title("Balso:")
                        say("")
                        say("You bring me the medicine?")
                        say("So there is some progress in medical researches.")
                        say("Sorry for troubling you. I shouldn't have trusted")
                        say("the folk medicine. However, I have to ")
                        say("arrange myself with taking this")
                        say("medicine.")
                        say("")
                        wait()
                        say_title("Balso:")
                        say("")
                        say("Thanks you helped me out of this.")
                        say("It is okay that I will have to fight for")
                        say("my life. I know, it's just something small,")
                        say("but it comes from the heart.")
                        say("If I make it, I won't")
                        say("forget you.")
                        say("")
                        pc.remove_item(30152,1)
                        say_reward("You received 85.000 Yang")
                        pc.change_money(85000)

                        say_reward("You received 3.500.000 Experience Points.")
                        pc.give_exp2(3500000)
                        
                        say_reward("You received a Quest Potion.")
                        pc.give_item2(71035)
                        set_state(COMPLETE)
                        clear_letter()
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
