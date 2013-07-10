quest subquest_4 begin
        state start begin
                when login or levelup with pc.level >= 9 and pc.level <= 14 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20016)
                        if v != 0 then
                                target.vid("__TARGET__", v, "How is Deokbae.")
                        end
                end
                when __TARGET__.target.click or
                        20016.chat."How is Deokbae." with pc.level >= 9 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Blacksmith:")
                        say("")
                        say("Hey there, adventurer! I want to ask you for a favour.")
                        say("")
                        say("There is a guy named Deokbae. He is a lumberjack and a")
                        say("good friend of mine.")
                        say("")
                        say("He is a little bit boring, but he is one of")
                        say("the last hard working lumberjacks.")
                        say("")
                        wait()

                        say_title("Blacksmith:")
                        say("")
                        say("I haven't seen him for a long time and wrote a letter to")
                        say("ask him if he is okay.")
                        say("")
                        say("I would like you to deliver the letter.")
                        say("")
                        say_item_vnum(30131)
                        say("Today there are many dangers on the roads, so be careful")
 			say("and don't lose the letter!")
                        say("")
                        wait()
			local area = {"Jayang","Bokjung","Bakra"}
                        say_title("Blacksmith:")
                        say("")
                        say("Oh, you don't know how to get to the next village?")
                        say("")
                        say("Press 'M' to see the miniature Map.")
                        say("")
                        say("You get to the village by going to the blue dot named")
                        say(area[pc.get_empire()].." Area.")
                        say("")

                        local s=select("I will do it.","No, thank you.")
                        if 2==s then
                                say("Really cancel Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Blacksmith:")
                                        say("")
                                        say("Come back soon.")
                                        say("")
                                        return
                                end
                                say_title("Blacksmith:")
                		say("")
                                say("Well, thank you anyway...")
				say("")
                                clear_letter()
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Blacksmith:")
                        say("")
                        say("You have a long way to go! Take care of yourself.")
                        say("")
                        pc.give_item2(30131, 1)
                        say("")
                        say_item_vnum(30131)
                        set_state(deliver_letter)

                end
        end

        state deliver_letter begin
                when info or button begin
                        say_title("Information:")
                        say("")
                        say("Go and deliver the letter from the Blacksmith to Deokbae")
                        say("the Lumberjack. You can find him in the town of "..areaname[pc.get_empire()][2]..".")
                        say("")
                end

                when letter begin
                        send_letter("A letter from the Blacksmith.")

                        local v=find_npc_by_vnum(20015)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Find Deokbae the Lumberjack")
                        end
                end

                when __TARGET__.target.click or
                        20015.chat."A letter from the Blacksmith" begin
                        if pc.count_item(30131) >= 1 then
                                target.delete("__TARGET__")
				----"123456789012345678901234567890123456789012345678901234567890"|
                                say_title("Deokbae:")
                                say("")
                                say("Welcome. I have some good axes.")
                                say("")
                                say("Oh! You don't need an axe? Are you looking for me?")
                                say("Ah! Yeah sure! The Blacksmith. I know him.")
                                say("")
                                say("I am a lumberjack, and I sell pick-axes and other tools.")
                                say("Sometimes I order miscellaneous tools from him.")
                                say("That is how we became good friends. Did he send you?")
                                say("")
                                wait()

                                say_title("Deokbae:")
                                say("")
                                say("Thanks for delivering the letter. I really should have a")
                                say("drink with him at the Bachelor`s Bar.")
                                say("")
                                say("Send my  greetings to the Blacksmith.")
                                say("")
                                pc.remove_item("30131", 1)

                                set_state(return_to)

                        else
                                say_title("Deokbae the Lumberjack:")
                                say("")
                                say("A letter from the Blacksmith?")
                                say("")
                                say("Man that is a long time ago. Where is it?")
                                say("You didn't lose it on the way, did you?")
                                say("")
                                local s=select("Here it is.","Oh, it isn't here.")
                                if 2==s then
                                        say("You want to cancel this quest?")
					say("")
                                        local a=select("Yes","No")
                                        if 2==a then
                                                say_title("Deokbae:")
                                                say("")
                                                say("That's nice from you. Come back soon!")
                                                say("")
                                                return
                                        end
                                        say_title("Deokbae:")
                                        say("")
                                        say("You lost it? Get out of here... ")
                                        say("")
                                        clear_letter()
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Deokbae:")
                                say("")
                                say("Go back to the Blacksmith and get it.")
                                say("")
                                say("Don't lose the letter again.")
                                say("")
                                say("Be careful.")
                                say("")
                                set_state(information)

                        end
                end
        end

        state return_to begin
                when info or button begin
                        say_title("Information:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Go back to the Blacksmith and get your reward.")
                        say("")
                end

                when letter begin
                	send_letter("Return to the Blacksmith.")
                        local v=find_npc_by_vnum(20016)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Return to the Blacksmith.")
                        end
                end

                when 20016.chat."I have delivered the letter." begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Blacksmith:")
                        say("")
                        say("So, how is Deokbae?")
                        say("")
                        say("Hehe, he is still a friend. Thank you. and take this as a")
                        say("reward. It isn't much, but you will need it one day.")
                        say("")
                        say("Thank you again.")
                        say("")
			wait()
                        pc.give_exp2(8000)
                        set_quest_state("levelup","run")
                        pc.change_money(10000)
                        pc.give_item2(22010 , 1)

                        say_title("Reward:")
                        say("")
                        say_reward("You received 8.000 Experience Points" )
                        say_reward("You received 10.000 Yang.")
                        say_reward("You received a Return Scroll.")
                        say("")
			say("Return Scrolls are very useful. Right click on them to")
			say("save your current position. When you use them again, you")
			say("will be teleported back to this position. Neat, isn't it?")
			say("")
                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin

        end

        state __COMPLETE__ begin
        end
end
