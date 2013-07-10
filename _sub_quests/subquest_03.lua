----------------------------------------------------
-- SUB QUEST
-- LV 8
-- The Medicine
----------------------------------------------------

quest subquest_3 begin
        state start begin
                when login or levelup with pc.level >= 8 and pc.level <= 13 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20018)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "The Medicine.")
                        end
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        say_title("Baek-Go:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Can you help me? Since the Metin Stones started falling")
                        say("an unknown disease has broken out.")
                        say("")
                        say("Many doctors work hard on it, but there is an ingredient")
                        say("missing to produce a medicine. Outside the village there")
                        say("are wild animals and we can't move freely there.")
                        say("")
                        wait()

                        say_title("Baek-Go:")
                        say("")
                        say("Can you get me the ingredient for the remedy?")
                        say("I ask you because you are an adventurer. I need")
                        say("the liver of a Blue Wolf for the remedy.")
                        say("")
                        say_item_vnum(30029)
                        say("Please, bring me one.")
                        say("")

                        set_state(hunt_for_wolf)
                end
        end

        state hunt_for_wolf begin
                when letter begin
                        send_letter("The Remedy")
                end
                when button or info begin
                        say_title("The Remedy")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Since the Metin Stones started falling an unknown disease")
                        say("has broken out. To be able to produce the medicine,")
                        say("Baek-Go needs the liver of a Blue Wolf.")
                        say("")
                        say_item_vnum(30029)
                        say("Get a Wolf Liver for Baek-Go.")
                        say("")
                end

            when 20018.chat."How do I get the liver?" with pc.count_item(30029) == 0 begin
                        say_title("Baek-Go:")
                        say("")
                        say("The only way to get the liver of a Blue Wolf is to find")
                        say("and kill one.")
                        say("")
                        say_item_vnum(30029)
                        say("I feel sorry for the Blue Wolf, but we need the liver.")
                        say("")
                end


                when 104.kill begin
                        local s = number(1, 100)
                        if s <= 5 then
                                pc.give_item2("30029", 1)
                                set_state(go_back_to_doctor)
                        end
                end

        end

    state go_back_to_doctor begin
                when letter begin
                        send_letter("Go back to Baek-Go.")
                        local v = find_npc_by_vnum(20018)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "Go back to Baek-Go.")
                        end
                end
                when button or info begin
                        say_title("Return to Baek-Go.")
                        say("")
                        say("You found the Wolf Liver, bring it to Baek-Go.")
                        say("")
                        say("He is waiting for you in "..areaname[pc.get_empire()][1]..".")
                        say("")
                end

                when __TARGET__.target.click begin                        
                        if pc.count_item(30029) > 0 then
                        	target.delete("__TARGET__")
				say_title("Baek-Go:")
				say("")
				say("Thank you. We are in debt with you!")
				say("")
				say("With this ingredient we can now produce the remedy.")
				say("The patients will praise you!")
				say("")
				wait()
				say_title("Baek-Go:")
				say("")
				say("Here, take this as a reward.")
				say("You will surely need this one day.")
				say("")
				say_title("Reward")
				say("")
				say_reward("Experience Points: 3.000")
				say_reward("Yang: 5.000")
				say_reward("Item: Bear Gall")
				say("")

				pc.remove_item(30029)
				pc.give_exp2(3000)
				set_quest_state("levelup","run")

				pc.change_money(5000)
				pc.give_item2(30010, 1)

				clear_letter()
				set_state(__COMPLETE__)
                        else
				say_title("Baek-Go:")
				say("")
				say("I hope you didn't lose the Wolf Liver?")
				say("")
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end
