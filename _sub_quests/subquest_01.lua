quest subquest_1 begin
        state start begin
                when login or levelup with pc.level >= 6 and pc.level <= 11 begin
                        set_state(information)
                end
        end

        state information begin
                when login or enter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Get an empty Bottle.")
                        end
                end

                when __TARGET__.target.click or 9003.chat."Excuse me..." begin
                        target.delete("__TARGET__")

                        say_title("General Store:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Excuse me, if you aren't busy at the moment, could you do")
                        say("me a favour? I need an empty Bottle for my red Potions.")
                        say("")
                        say_item_vnum(30130)
                        say("I am busy in my shop and cannot get it myself.")
                        say("If you fetch me that Bottle I will reward you.")
                        say("")
                        local s=select("Accept.","Reject")
                        if 2==s then
                                say("Do you want to cancel this task?")
                                say("")

                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("General Store:")
                                        say("")
                                        say("Thanks for helping me.")
                                        say("")
                                        return
                                end

                                say_title("General Store:")
                                say("")
                                say("Have a nice day.")
                                say("And come here again one day.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("General Store:")
                        say("")
                        say("You can get the Bottle from Yonah the Potter.")
                        say("Thank you.")
                        say("")
                        set_state(to_yeonnahwan)
                end
        end

        state to_yeonnahwan begin
                when letter begin
                        local v = find_npc_by_vnum(20005)
                        if v!= 0 then
                                target.vid("__TARGETS__", v, "Search for Yonah the Potter.")
                        end
                        send_letter("Go to Yonah the Potter.")

                end

                when button or info begin
                        say_title("Go to Yonah the Potter.")
                        say("")
                        say("The General Store needs an empty bottle from Yonah the")
                        say("Potter for her Potions.")
                        say("")
                        say_item_vnum(30130)
                        say("")
                end

                when __TARGETS__.target.click begin
                        target.delete("__TARGETS__")
                        say_title("Yonah:")
                        say("")
                        say("Argh! Dang! I cannot stop coughing! How can I work this way?")
                        say("Can I help you somehow?")
                        say("")
                        say("Ah, the General Store must have sent you. I do sell empty")
                        say("bottles, but you cannot have one for free.")
                        say("")
                        say_item_vnum(30130)
                        wait()
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Yonah:")
                        say("")
                        say("I am asthmatic. I was told Walnut would be a good remedy.")
                        say("")
                        say("If you get me one, I will give you a bottle.")
                        say("")
                        say_item_vnum(30020)
                        say("You can get Walnut from the wild boars outside the village.")
                        say("As soon as the farmers plant Walnut, the boars dig them out")
                        say("and eat them.")
			say("")
                        wait()
                        set_state(hunt_for_peach)
                end
        end

        state hunt_for_peach begin
                when letter begin
                        send_letter("Get the Walnut.")
                end

                when button or info begin
                        say_title("Get the Walnut!")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The General Store needs an empty bottle from Yonah the")
                        say("Potter. Yonah, who is an asthmatic, will give you an")
                        say("empty bottle if you bring him a Walnut.")
                        say("")
                        say_item_vnum(30020)
                        say("You can find the nut if you hunt down Wild Boars.")
	                say("")
                end

        	when 20005.chat."Wher do I get a Walnut?" with pc.count_item(30020) == 0 begin
                        say_title("Yonah:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You can get Walnut from the wild boars outside the village.")
                        say("As soon as the farmers plant Walnut, the boars dig them")
                        say("out and eat them.")
                        say("")
                        say("Cough, cough. Thanks in advance.")
                        say("")

                end

                when 108.kill begin
                        local s = number(1, 5)
                        if s == 1 then
                                pc.give_item2(30020, 1)
                                set_state(go_back_to_yonah)
                        end
                end
        end
    state go_back_to_yonah begin
                when letter begin
                        send_letter("Go back to Yonah.")
                        local v = find_npc_by_vnum(20005)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Return to Yonah.")
                        end
                end
                when button or info begin
                        say_title("Go back to Yonah.")
                        say("")
                        say("You found the Walnut! Bring it to Yonah.")
                        say("")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        if pc.count_item(30020) >= 1 then

				say_title("Yonah:")
				say("")
				say("Oh, you got it?!")
				say("")
				say("Thank you. Now I can ease my asthma and get back to work.")
				say("")
				wait()
				say_title("Yonah:")
				say("")
				say("Here is an Empty Bottle.")
				say("Bring it to the General Store.")
				say("")
				say_item_vnum(30130)
				say("")

				pc.remove_item(30020, 1)
				pc.give_item2(30130, 1)

				set_state(going_to_reward)
                        end
                end
    end

        state going_to_reward begin
                when letter begin
                        send_letter("Deliver the Empty Bottle.")

                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Deliver the Empty Bottle.")
                        end

                end
                when info or button begin
                        say_title("Deliver the Empy Bottle.")
                        say("")
                        say("The General Store needs an Empty Bottle from")
                        say("the Potter. Carry it to her.")
                        say("")
                        say_item_vnum(30130)
                        say("")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        if pc.count_item(30130) > 0 then
                                say_title("General Store: ")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Thank you.")
                                say("")
                                say("I hope you did not have too much trouble.")
                                say("I will give this for your efforts.")
                                say("")
                                say("Again, thank you very much!")
                                say("")
                                wait()
                                say_title("Reward:")
                                say("")
                                say_reward("Experience Points: 5.000" )
                                say_reward("Yang: 2.500")
                                say_reward("Item: Purple Potion(S)")
                                say("")
                                pc.remove_item(30130)
                                pc.give_exp2(5000)
                                pc.give_item2()
                                set_quest_state("levelup","run")
                                pc.change_money(2500)
                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("General Store: ")
                                say("")
                                say("You still don't have an empty Bottle?")
                                say("")
                                say_item_vnum(30130)
                                say("")

                                wait()
                                say_title("General Store:")
                                say("")
                                say("Do you want to hunt down wild boars again, to")
                                say("get another Empty Bottle,")
				say("or do you want to cancel the task?")
                                local s=select("Return to hunting","I give up")
                                if s==2 then
                                        say("Do you really want to cancel?")
                                        say("")
                                	local a=select("Yes","No")
                                	if 2==a then
                                        	say_title("General Store:")
                                        	say("")
                                        	say("Thanks for helping me.")
                                        	say("")
                                        	return
                                        end
                                	say_pc_name()
                                	say("")
                                	say("That's too hard for me.")
                                	say("I am sorry.")
                                	say("")
                                	clear_letter()
                                	set_state(__GIVEUP__)
                                	return
                                end
                        	set_state(hunt_for_peach)
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
