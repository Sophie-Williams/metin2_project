----------------------------------------------------
-- SUB QUEST
-- LV 49
-- Octavio��s Recipe
----------------------------------------------------

quest subquest_41 begin
        state start begin
                when login or levelup with pc.level >= 49 and pc.level <= 51 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20008)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Octavio's Recipe")
                        end
                end


                when __TARGET__.target.click or
                        20008.chat."Octavio's Recipe" with pc.level >= 49 begin
                        target.delete("__TARGET__")

                        say_title("Octavio:")
                        say("")
                        say("Hey, how are you?")
                        say("Hmm, I am reading a book Yu-Gil gave me lately.")
                        say("There is a recipe I think is interesting")
                        say("'Spider Eyes Special' ,very rare and very")
                        say("valuable. I have never seen such before,")
                        say("that's why I am a bit anxious.")
                        say("Have you ever heard about the dish made from")
			say("Mosquito Eyes?")
                        say("That's a famous dish, but from")
                        say("another country. I think that dish here could")
                        say("compete with it...")
                        say("")
                        wait()
                        say_title("Octavio:")
                        say("")
                        say("But, how shall I get Eye of a Spider?")
                        say("I need your help once again. Please")
                        say("get me some. You can find Spiders in the")
                        say("Sahara Desert. 100 will do to get us")
                        say("a really nice meal.")
                        say("")
                        wait()
                        say_title("Octavio:")
                        say("")
                        say("We will need that many, ")
                        say("we really want to enjoy it, don't we?")
                        say("Hmm, hmm. Okay, I stay here and you get those")
                        say("Eyes. I nearly can't hold myself back,")
                        say("I want to cook this recipe...")
                        say("")
                        say_item_vnum("30162")
                        say("")
                        local s=select("Accept.","Reject.")
                        if 2==s then
                                say("You want to cancel this Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Octavio:")
                                        say("")
                                        say("I really long to cook this recipe.")
                                        say("If you want to do me a favour, ")
                                        say("visit me please.")
                                        say("")
                                        return
                                end
                                say_title("Octavio:")
                                say("")
                                say("Hmm, from where do I get these Eyes..")
                                say("Ok..See you.")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Octavio:")
                        say("")
                        say("Thanks, I knew you would do me this favour.")
                        say("For this I will cook you")
                        say("a great meal.")
                        say("")
                        set_state(hunt_for_oku)
                end
        end

        state hunt_for_oku begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Octavio's Recipe")
                        q.set_title("Octavio's Recipe")
                        q.start()

                        if pc.count_item("30162") >= 100 then
                                local v = find_npc_by_vnum(20008)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Octavio's Recipe")
                                end
                                return
                        end
                end

                when info or button begin

                        if pc.count_item("30162") >= 100 then
                                say_title("I have the Eye of a Spider.")
                                say("")
                                say("I have all those 100 Eyes")
                                say("for Octavio's new recipe.")
                                say("Off to him.")
                                say("")
                                return
                        end

                        say_title("Getting Spidereyes.")
                        say("Octavio wants to try out his new receipt")
                        say("Spidereyes Special.")
                        say("He needs 100 Spidereyes.")
                        say("You can get those from:")
                        say("Baby Spiders, Poison Spiders, Claw Spiders,")
                        say("Soldier Spiders and Red Poison Spiders")
                        say("in the Sahara Desert")
                        say_item_vnum("30162")
                        say("")
                end
                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill begin
                        local s = number(1, 100)
                        if s <= 7 and pc.count_item("30162")<100  then
                                pc.give_item2("30162", 3)
                                if pc.count_item("30162")>=100 then
                                        local v=find_npc_by_vnum(20008)
                                        if 0==v then
                                        else
                                                target.vid("__TARGET__",v,"Return to Octavio")
                                        end
                                end
                        end
                end

                when __TARGET__.target.click or
                        20008.chat."I have all Eyes." begin
                        target.delete("__TARGET__")
                        if pc.count_item("30162") >= 100 then
                                say_title("Octavio:")
                                say("")
                                say("Hmm, hmm. Let me look. Exactly 100 Eyes.")
                                say("So, want to start?")
                                say("Wait, it won't take long.")
                                say("Hmm, finished! Let's try it.")
                                say("")
                                wait()
                                say_title("Octavio:")
                                say("")
                                say("Hmm, hmm, magnificent.")
                                say("Not too sweet, but fragrant. What a")
                                say("breathtaking taste!")
                                say("I knew it would be wonderful!")
                                say("Hmmm...Without you that would have never")
                                say("been made. Thanks so much.")
                                say("And that's for you. Take it.")
                                say("And don't look that horrified,")
                                say("try it!")
                                say("")
                                pc.remove_item("30162",100)

                                say_reward("You received 3.000.000 Experience Points.")
                                pc.give_exp2(3100000)
                                set_quest_state("levelup","run")

                                say_reward("You received 40.000 Yang.")
                                pc.change_money(40000)
                                clear_letter()
                                set_state(COMPLETE)
                                return

                        else
                                say_title("Octavio:")
                                say("")
                                say("Not enough Eyes..")
                                say("Please hurry!")
                                say("")
                                local s=select("Try again","Give up")
                                if 2==s then
                                        say_title("Octavio:")
                                        say("")
                                        say("I long for cooking this...")
                                        say("Well, nevermind. Thanks and see you.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Octavio:")
                                say("")
                                say("Thanks.")
                                say("You are very brave,")
                                say("")
                        end
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
