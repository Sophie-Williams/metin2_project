--------------------------------------------
--SUB QUEST
--LV 57
--Make soup food from hind legs of Tree Frog Leader
---------------------------------------------
quest subquest_26 begin
        state start begin
                when login or levelup with pc.level >= 57  and pc.level <= 59 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(9005)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Go to the Storekeeper")
                        end
                end

                when __TARGET__.target.click or
                        9005.chat."I don't feel good..." begin
                        target.delete("__TARGET__")
                        say_title("Storekeeper")
                        say("")
                        say("My body really isn't ")
                        say("what it used to be.")
                        say("When I was young I could get up early,")
                        say("work all night, each day a week.")
                        say("And drink alcohol...")
                        say("Now it is even troublesome to")
                        say("get up in the morning.")
                        say("If someone would get me some Frog's Legs Soup")
                        say("my energy would surely increase inside")
                        say("me.")
                        say("")
                        wait()
                        say_title("Storekeeper:")
                        say("")
                        say("What's that?")
                        say("When you drink a bowl of this")
                        say("you can work a whole week straight")
                        say("because you are full of energy.")
                        say("Octavio made this soup but")
                        say("he stopped doing this a while ago.")
                        say("")

                        local s=select("I go to Octavio","I am busy.")
                        if 2==s then
                                say("You want to give up the Quest?")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Storekeeper:")
                                                say("")
                                                say("Okay, when you are not busy.")
                                                say("Come back later if you want.")
                                                say("")
                                                return
                                        end
                                        say_title("Storekeeper")
                                        say("")
                                        say("It's your loss,")
                                        say("you miss the chance of a lifetime.")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                        end
                        say_title("Storekeeper")
                        say("")
                        say("I knew it!")
                        say("I knew you'd go to Octavio.")
                        say("If you get some, please share with me.")
                        say("")
                        set_state(ask_octavio)

                end


                end
        state ask_octavio begin
                when letter begin

                        send_letter("Go to Octavio ")

                        local v=find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET1__", v, "Octavio")
                        end

                end

                when info or button begin

                        say_title("Go to Octavio")
                        say("")
                        say("Ask Octavio for the Frog's Legs Soup")
                end


                when __TARGET1__.target.click or
                        20008.chat."Frog's Legs Soup?" begin
                        target.delete("__TARGET1__")
                        say_title("Octavio:")
                        say("")
                        say("Frog's Legs Soup... Yeah right I did that in the past.")
                        say("But not today. ")
                        say("Back then I wasn't afraid of the Tree Frog Leader,")
                        say("so I could get Frog's Legs easily.")
                        say("")
                        wait("")
                        say_title("Octavio:")
                        say("")
                        say("But now...")
                        say("I am old and tired.")
                        say("With that soup I could regain energy,")
                        say("but Tree Frog Leader aren't easy to kill.")
                        say("If you'd bring me the Frog's Legs for the soup, ")
                        say("I'll make the best Frog's Legs Soup in the world.")
                        say("")
                        local s=select("Sure I'll do it.", "No, I can't.")
                        if 2==s then
                                say("You want to give up the Quest?")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Octavio:")
                                                say("")
                                                say("You are busy?")
                                                say("When you change your mine come back.")
                                                say("")
                                                return
                                        end
                                        say_title("Octavio:")
                                        say("")
                                        say("My soup is well known.")
                                        say("If you knew it, you'd do it.")
                                        say("Ah well, goodbye.")
                                        say("")
                                        set_state(__GIVEUP__)
                        return
                        end
                        say_title("Octavio:")
                        say("")
                        say("Then hurry up")
                        say("I'll prepare everything for the")
                        say("Frog's Legs Soup")
                        say("")
                        set_state(accept)

                end


                end

        state accept begin

                when letter begin
                        if pc.count_item(30116)>0 then
                                send_letter("Get Frog's Legs")

                                local v=find_npc_by_vnum(20008)
                                if 0==v then
                                else
                                        target.vid("__TARGET__", v, "Octavio")
                                end

                        return
                  end
                  send_letter("You have Frog's Legs")

                end

                when info or button begin
                        if pc.count_item(30116)>0 then

                                say_title("You have Frog's Legs")
                                say("")
                                say("You have Frog's Legs")
                                say("Go back to Octavio")
                                say("")
                                return
                        end
                        say_title("Kill frogs to get the legs.")
                        say("")
                        say("Kill frogs to get the legs for Octavio. You ")
                        say("get them in the Dark Temple.")
                        say("")
                end


                when 20008.chat."I can't do this now." with pc.getf("subquest_26","frog_done")==1 begin


                        say_title("Octavio:")
                        say("")
                        say("What's up?")
                        say("When I was as young as you,")
                        say("I got 10 Frog's Legs a day.")

                        local s=select("Try again", "Give up")
                        if 2==s then
                                say("You want to give up the Quest?")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Octavio:")
                                                say("")
                                                say("You are tired?")
                                                say("Why don't you make a break")
                                                say("and try again later?")
                                                return
                                        end
                                        say_title("Octavio:")
                                        say("")
                                        say("I could have well used")
                                        say("the Frog's Legs Soup.")
                                        say("Ah well...")
                                        say("Bye.")
                                        set_state(__GIVEUP__)
                        return
                        end
                        say_title("Octavio:")
                        say("")
                        say("Then go and get it!")
                        say("I'll prepare the soup.")

                end

                when 1302.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30116")==0 then
                                pc.give_item2(30116, 1)

                                if pc.count_item("30116")>=1 then
                                        local v=find_npc_by_vnum(20008)
                                        if 0 != v then
                                                target.vid("__TARGET__",v,"Go to Octavio")
                                        end
                                end
                        end
                end



                when __TARGET__.target.click or
                        20008.chat."You have Frog's Legs." with pc.count_item(30116)>=1  begin
                        target.delete("__TARGET__")

                        say_title("Octavio:")
                        say("")
                        say("Oh! You got them!")
                        say("Now I can make the soup.")
                        say("Here, take this��")
                        say("You can't imagine how much energy you'll gain.")
                        say("Hahaha!")
                        say("")
                        wait()
                        say_title("Octavio:")
                        say("")
                        say("Make sure ")
                        say("that no one hears from this")
                        say("soup.")
                        say("Especially the Storekeeper...")
                        say("I rarely make this soup.")
                        say("Otherwise, all come and disturb me.")
                        say("")
                        pc.remove_item(30116,1)

                        say_reward("You received 50.000 Yang ")
                        pc.change_money(50000)

                        say_reward("You received 5.000.000 Experience Points.")
                        pc.give_exp2(5000000)
                        say("")


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
