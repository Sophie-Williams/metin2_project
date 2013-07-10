quest subquest_16 begin
        state start begin
                when login or levelup or enter with pc.level >= 25 and pc.level <= 30 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20355)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Search for the armoured cavalry")
                        end
                end


                when __TARGET__.target.click or
                        20355.chat."About the armoured cavalry" with pc.level >= 25 begin
                        target.delete("__TARGET__")

                        say_title("Captain:")
                        
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
			say("I have a new task for you.")
			say("")
                        say("You orders to find information about the armoured cavalry.")
                        say("")
                        say("It was once the most important part of the army of Cao Cao,")
                        say("the King and Consolidator of the continent.")
                        say("")
                        say("The armoured cavalry was feared by other nations")
                        say("because of its remarkable speed and attack power.")
                        say("")
                        wait()

                        say_title("Captain:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("With your collected information, we can strengthen our")
                        say("military power.")
                        say("")
                        say("Visit Yu-Hwan the Musician first.")
                        say("I am sure he has quite some information about it.")
                        say("")
                        local s=select("I will do it.","I have no time.")
                        if 2==s then
                                say("Do you really want to cancel the Quest?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("See you.")
                                        say("")
                                        return
                                end
                                say_title("Captain:")
                                say("")
                                say("I sure wished to command a regiment of cavalry")
                                say("like in the ancient times...")
                                say("")
				say("Be careful.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Captain:")
                        say("")
                        say("Thank you.")
                        say("")
                        say("Be careful on your assignment.")
			say("")
                        set_state(ask_to_yuhwan)



                end
        end

        state ask_to_yuhwan begin
                when info or button begin
                        say_title("The armoured cavalry.")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Captain says that Yu-Hwan, the Musician in the next")
                        say("village, has information about the armoured cavalry.")
                        say("")
                        say("Go to Yu-Hwan to get the information.")
                        say("")
                end

                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("The armoured cavalry.")
                        q.set_title("Go to Yu-Hwan the Musician.")
                        q.start()

                        local v=find_npc_by_vnum("20017")
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Go to Yuhwan.")
                        end
                end

                when 20017.chat."The armoured cavalry" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("(Sings) Life is so wonderful - Love is so wonderful..")
                        say("")
                        say("Oh, you again! What do you want? You come visit me quite")
                        say("often lately!")
                        say("")
                        say("Information about the armoured cavalry?")
                        say("")
                        say("Why do you ask for those tough guys?")
                        say("")
                        wait()

                        say_title("Yu-Hwan: ")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Well, the best way to unite a continent is to have the")
                        say("strongest army.")
                        say("")
                        say("The armoured cavalry was very strong indeed.")
                        say("")
                        say("With their Iron Armours, their defence and their speed,")
                        say("they defeated everyone. It was the best army in the hands")
                        say("of Cao Cao, the mighty warlord.")
                        say("")
                        say("Most countries perished when being attacked by it.")
                        say("")
                        wait()

                        say_title("Yu-Hwan: ")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("If you could get now an Armoured cavalry, like in those")
                        say("days, there would not be many countries which could defend")
                        say("themselves against it.")
                        say("")
			say("To get an Armoured cavalry, strong Iron Armours and hard")
                        say("hard training are neededed. You should ask the Peddler and")
                        say("Uriel. Visit them, then you will learn more.")
                        say("")
                        say("(Sings) La, la, la la, la, la, la...")
                        say("")
                        set_state(ask_to_peddler)
                end
        end

        state ask_to_peddler begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to the Peddler.")
                        q.set_title("The Armoured cavalry.")
                        q.start()

                        local v=find_npc_by_vnum("20010")
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Peddler")
                        end
                end

                when info or button begin
                        say_title("The Armoured cavalry")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Yu-Hwan the Musician says that the Peddler and Uriel the")
                        say("wise have information about the Armoured cavalry.")
                        say("")
                        say("Let's first listen to what the Peddler can tell us.")
                        say("")
                end


                when 20010.chat."The Armoured cavalry" begin
                        target.delete("__TARGET1__")
                        say_title("Peddler")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What do you want from a simple Peddler like me?")
                        say("")
                        say("Nowadays, it is hard to survive and all because of those")
                        say("Metin Stones!")
                        say("")
                        say("The Iron Armours of the Armoured cavalry?")
                        say("")
                        wait()
                        
                        say_title("Peddler: ")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Those are special Armours whose production needs unique")
                        say("knowledge. They were the best ever made!")
                        say("")
                        say("Normal knives and arrows could not go through this perfect")
                        say("Armour. Of course, such an Armour is heavy and not easy")
                        say("to deal with.")
                        say("")
                        say("Only the best soldiers could wear it.")
                        say("")
                        wait()
                        
                        say_title("Peddler:")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
        		say("This armour was something special!")
        		say("")
                        say("You wouldn't believe the amount of money it took to make")
                        say("such a cavalry armour. Nowadays, this armour can even be")
                        say("made out of Metin Stones.")
                        say("")
                        say("With this new kind of armour! It`s no longer just a dream")
                        say("to have a cavalry like in those days.")
                        say("")
                        wait()

                        say_title("Peddler:")
                        say("")
                        say("I talk too much...")
                        say("")
                        say("I have to go now...")
                        say("")
                        set_state(ask_to_uriel)
                end
        end
        state ask_to_uriel begin
                when letter begin
                        local v=find_npc_by_vnum("20011")
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Uriel")
                        end

                        setskin(NOWINDOW)
                        makequestbutton("Go to Uriel")
                        q.set_title("The Armoured cavalry")
                        q.start()
                end

                when info or button begin
                        say_title("The Armoured cavalry:")
                        say("")
                        say("Now go to the next village and talk with Uriel." )
                        say("")
                end



                when 20011.chat."The Armoured cavalry" begin
                        target.delete("__TARGET1__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Uriel: ")
                        say("")
                        say("Ah! What is the reason for our meeting? The Armoured")
                        say("cavalry? Of course I know something about it.")
                        say("")
                        say("This army will be always remembered as the best in history.")
                        say("")
                        wait()

                        say_title("Uriel: ")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Because of the hard training, the Armoured cavalry was")
                        say("superior. Only the best could finish the training.")
                        say("")
                        say("I don't know many people who could finish the training")
                        say("nowadays. But that doesn't mean it's impossible.")
                        say("")
                        wait()
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Uriel: ")
                        say("")
                        say("I will give you some detailed information about the")
                        say("training so you know about it. I know that terrible wars")
                        say("are around, but I am not sure if it is a good idea to")
                        say("raise once again such a fearsome army.")
                        say("")
                        set_state(ask_to_guard)
                end
        end

        state ask_to_guard begin
                when info or button begin
                        say_title("Information:")
                        say("")
                        say("Go to the captain and tell him everything")
                        say("you learned about the Armoured cavalry.")
                        say("")
                end

                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to the Captain")
                        q.set_title("Go to the Captain")
                        q.start()

                        local v=find_npc_by_vnum("20355")
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"The Armoured cavalry")
                        end
                end

                when 20355.chat."Report about the Armoured cavalry" begin
                        target.delete("__TARGET__")
                        say_title("Captain:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Have you found out some useful information?")
                        say("")
                        say("Oh! That is really interesting.")
                        say("Ah, those are the secrets of the  Armoured cavalry. Hmmm...")
                        say("")
                        wait()

                        say_title("Captain:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("This extremely important knowledge should help us to unite")
                        say("the three kingdoms.")
                        say("")
                        say("You have worked hard. You are surely tired, take a rest.")
                        say("")
                        wait()

                        say_title("Captain:")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You have been everywhere to get this information.")
                        say("")
                        say("This is a little reward for your troubles.")
                        say("")
                        wait()
                        say_title("Reward:")
                        say("")
                        say_reward("You received 180.000 Experience Points.")
                        say_reward("You received 40.000 Yang.")
                        say_reward("You received Leather Boots +4.")
                        say("")
                        pc.give_exp2(180000)
                        pc.change_money(40000)
                        pc.give_item2(15084, 1)

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
