----------------------------------------------------
-- SUB QUEST
-- LV 56
-- Supporting War Device
----------------------------------------------------

quest subquest_40 begin
        state start begin
                when login or levelup with pc.level >= 56  and pc.level <= 58 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20355)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Supporting War Devices")
                        end
                end

                when __TARGET__.target.click or
                        20355.chat."Supporting War Devices" with pc.level >= 56 begin
                        target.delete("__TARGET__")
                        say_title("Captain:")
                        say("")
                        say("As you see, the attacks of our enemies increase")
                        say("daily and we get alarming news from ")
                        say("Yu-Hwan.")
                        say("Shortly said: we don't have enough arrows to")
                        say("defeat them.")
                        say("")
                        wait()
                        say_title("Captain:")
                        say("")
                        say("As soon as they come, our archers")
                        say("should fire at them and stop them.")
                        say("I am worried!")
                        say("Especially the lack of")
                        say("arrows is a big problem.")
                        say("")
                        wait()
                        say_title("Captain:")
                        say("")
                        say("Why don't you go and get the ")
                        say("materials so that we")
                        say("can make arrows?")
                        say("")
                        say("You can get Arrowheads from ")
			say("the Angry Plagued Archers,")
                        say("you find them at the Ice Mountain.")
                        wait()
                        say_title("Captain:")
                        say("")
                        say("Those Arrowheads are toxic.")
                        say("The effect will help us to defeat the enemy.")
                        say("")
                        say("We need 3.000 Arrowheads")
                        say("to have enough arrows.")
                        say("")
                        say("It is a very difficult task,")
                        say("but you will surely do well.")
                        local b=select("I'll do it.", "That's too much, sorry.")
                        if 2==b then
                                say("You want to give up the Quest?")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("Is it too far to go to the ")
                                        say("Ice Mountain? Please reconsider..")
                                        say("")
                                        return
                                end
                                say_title("Captain:")
                                say("")
                                say("Hum, afraid of the Angry Plagued Archers?")
                                say("Seems I overestimated you,")
                                say("now I have no hope anymore.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Captain:")
                        say("")
                        say("I knew I could count on you.")
                        say("Thanks that you want to get those Arrowheads from")
                        say("the Angry Plagued Archers.")
                        say("It is difficult to get those")
                        say("but I am sure")
                        say("you'll make it.")
                        say("")
                        set_state(for_five_thousand_bow)
                end

        end
        state for_five_thousand_bow begin
                when letter begin
                        send_letter("Supporting War Devices")

                        if         pc.count_item("30157")>=3000 then
                                local v=find_npc_by_vnum(20355)
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Visit the Captain")
                                end
                        end

                end
                when button or info begin
                        if         pc.count_item("30157")>=3000 then
                                say_title("Supporting War Devices")
                                say("")
                                say("You have all 3000 Arrowheads")
                                say("Visit the Captain")
                                return
                        end
                        say_title("Supporting War Devices")
                        say("")
                        say("To defeat the enemy we need arrows, but")
                        say("we don't have enough Arrowheads.")
                        say("You can get these Arrowheads from")
                        say("the Angry Plagued Archers at")
                        say("the Ice Mountain.")
                        say("Defeat the Angry Plagued Archers and")
                        say("get 3.000 Arrowheads.")
                        say("")
                        say_item_vnum(30157)
                end

                when 20355.chat."Talk about the Angry Plagued Archers" with pc.count_item(30157) <3000 begin
                        say_title("Captain:")
                        say("")
                        say("It is a certain disease")
                        say("spread over the continent.")
                        say("Not even our doctors can")
                        say("explain it.")
                        say("The Arrowheads are still natural,")
                        say("but they get more and more toxic.")
                        say("Hey, what's up?")
                        say("")
                        local s=select("Nothing", "I just wonder about the disease.")
                        if 2==s then
                                say("Are you sure to give up?")
                                local a= select("Yes","No")
                                if 2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("Afraid to get the disease?")
                                        say("Calm down and come back.")
                                        say("")
                                        return
                                end
                                say("Are you sure to give up?")
                                say("Hmm, maybe it is too hard.")
                                say("I ask someone else..")
                                say("Ok, see you.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say("I see...")
                        say("You never give up, huh?")
                        say("Then, go!")
                end

                when 936.kill   begin
                        local s = number(1, 100)
                        if s <= 40 and pc.count_item("30157")<3000 then
                                pc.give_item2(30157, 50)
                        end


                end

                when __TARGET__.target.click  or
                        20355.chat."Give him the 3000 Arrowheads" with pc.count_item(30157)>=3000 begin
                        target.delete("__TARGET__")

                        say_title("Captain:")
                        say("")
                        say("Fantastic Work!")
                        say("Now we can prepare for")
                        say("the attack.")
                        say("Thanks to you!")
                        say("I will give order now to make the")
                        say("arrows. That was really well")
                        say("done.")
                        wait()
                        say_title("Captain:")
                        say("")
                        say("Here is a reward.")
                        say("Please take it.")
                        say("Next time I have an important matter")
                        say("you are the first I will call.")
                        say("I hope you will have a good journey")
                        say("further on.")
                        say("")

                        pc.remove_item(30157 , 3000)

                        say_reward("You received Enhance Add Scroll.")
                        pc.give_item2(71085)

                        say_reward("You received 6.000.000 Experience Points.")
                        pc.give_exp2(6000000)

                        say_reward("You received 200.000 Yang.")
                        pc.change_money(200000)
                        say("")

                        clear_letter()
                        set_state(COMPLETE)
                end
        end
        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
        state __GIVEUP__ begin
        end
end
