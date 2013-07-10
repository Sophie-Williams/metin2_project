----------------------------------------------------
-- SUB QUEST
-- LV 25
-- Memories of Ah-Yu Husband
----------------------------------------------------
quest subquest_20  begin
           state start begin
                when login or levelup with pc.level >= 30  and pc.level <= 32  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Help Ah-Yu!")
                        end
                end


                when __TARGET__.target.click or
                        20003.chat."Memories of the husband"  begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Ah-Yu:")
                        say("")
                        say("Oh my god. Do not cry darling!")
                        say("")
                        say("Your mum is also in a bad mood. If you keep crying, I'm")
                        say("going to go mad. Please, stop crying.")
                        say("")
                        wait()
                        say_pc_name()
                        say("")
                        say("Normally you are always happy, what is")
                        say("up with you today?")
                        say("")
                        wait()
                        say_title("Ah-Yu:")
                        say("")
                        say("I am worried. My husband always took care of me.")
                        say("Then, he died in the war.")
                        say("")
                        say("Only my baby and the Javelins I have remind")
			say("me of him.")
                        say("")
                        wait()
                        say_title("Ah-Yu:")
                        say("")
                        say("While I went to work, someone stole the Javelins.")
                        say("The neighbours said the savages are guilty.")
                        say("Because of my baby I cannot search myself.")
                        say("")
                        say_item_vnum(30161)
                        say("Can you bring me the Javelins?")
                        say("You surely find them at the savages.")
                        say("")
                        local b=select("I search for them.", "I have no time.")
                        if 2==b then
                                say("You want to cancel the search?")
                                local q=select("Yes","No")
                                if 2==q  then
                                        say_title("Ah-Yu:")
                                        say("")
                                        say("It is okay.")
                                        say("Come back when you have time.")
                                        say("")
                                        return
                                end
                                say_title("Ah-Yu:")
                                say("")
                                say("You are a coward.")
                                say("You would run away anyway.")
                                say("When you meet the savages, you would run.")
					  say("Go away.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ah-Yu:")
                        say("")
                        say("Thank you for helping me.")
                        say("There are 3 Javelins to be found.")
                        say("")
                        set_state(for_husband_product)
                end
    end
    state for_husband_product begin
                when letter begin
                        send_letter("The Javelins")
                        if pc.count_item(30161) >= 3 then
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Ah-Yu")
                                end
                        end
                end

                when button or info begin
                        if pc.count_item(30161) >= 3 then
                                say_title("The three Javelins")
                                say("")
                                say("You found all three Javelins")
                                say("of Ah-Yu's husband .")
                                say("You should go back to Ah-Yu")
                                say("")
                                return
                        end
                        say_title("Find the Javelins")
                        say("")
                        say("Savage Infantrymen, Savage Minions,")
                        say("Savage Archers and Savage Generals own Javelins.")
                        say("Search for the Javelins of Ah-Yu's husband.")
                        say("")
                        say_reward("You should find the three Javelins")
                        say_reward("and bring them back to Ah-Yu.")
                        say_reward("(Number of Javelins: "..pc.count_item(30161).." )")
                        say("")

                end

                when 501.kill or 502.kill or  503.kill or 504.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30161")<3  then
                                pc.give_item2("30161", 1)
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Ah-Yu")
                                end
                        end
                end

                when 20003.chat."Find the Javelins" with pc.count_item(30161)==0 begin
                        say_title("Ah-Yu:")
                        say("")
                        say("Very likely the savages have")
                        say("the Javelins of my husband.")
                        say("Who knows. I hope they didn't sell")
                        say("them. Those are very good Javelins.")
                        say("")
                        say("Continue Search?")
                        local s=select("Continue", "Give up")
                        if 2==s then
                                say_title("Ah-Yu:")
                                say("")
                                say("You are a coward!")
                                say("Ok, then I have to go myself.")
                                say("")
                                say("You really want to give up the Search?")
                                say("")
                                local r=select("Yes.", "No.")
                                if 2==r then
				        say("")
                                        say("Ha,you underestimate me.")
                                        say("I can do this alone.")
                                        say("")
                                        return
                                end
				say("")
                                say("You gave up the search for")
                                say("the Javelins of Ah-Yu��s husband")
                                set_state(__GIVEUP__)
                                return
                        end
			say("")
                        say("Thank you.")
                        say("")
                end
                when __TARGET__.target.click or
                        20003.chat."Bring back the Javelin of the husband" with pc.count_item(30161)>0 begin
                        target.delete("__TARGET__")
                        if pc.count_item(30161)<3 then
                                say_title("Ah-yu:")
                                say("")
                                say("It is great that you have found one javelin.")
                                say("Could you maybe also look for the")
                                say("other two?")
                                say("They belong together.")
                                say("Thanks.")
                                say("")
                                local z=select("Try again","give up")
                                if 2==z then
				        say("")
                                        say("You gave up the search for the javelins")
                                        say("of Ah-Yu's husband.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say("Try again")
                                say("")

                        else
                                say_title("Ah-yu:")
                                say("")
                                say("Oh, there they are!")
                                say("I am very happy, thank you.")
                                say("This is not much Yang, but take it.")
                                say("")
                                say_reward("As a reward for the three Javelins,")
                                say_reward("You received 500.000 Experience")
                                say_reward("You received 40.000 Yang.")

                                pc.change_money(40000)
                                pc.give_exp2(500000)

                                pc.remove_item(30161, 3)
                                clear_letter()
                                set_state(__COMPLETE__)
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
