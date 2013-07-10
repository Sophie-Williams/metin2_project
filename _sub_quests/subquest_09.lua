quest subquest_9 begin
        state start begin
                when login or levelup with pc.level >= 16 and pc.level <= 21 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20016)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Find a golden Axe.")
                        end
                end


                when __TARGET__.target.click or
                        20016.chat."Find a golden Axe for me." with pc.level >= 16 begin
                        target.delete("__TARGET__")

                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You remember my friend Deokbae? I had promised to make a")
                        say("magnificent axe for him; unfortunately, it was stolen by")
                        say("a White Oath Soldier. Can you get me back that axe?")
                        say("")
                        say("A White Oath Soldier should have it. You should be able")
                        say("to recognize that axe, not many of them exist.")
                        say("")
			say("I will reward you for your trouble!")
                        say("")

                        local s=select("Accept","Cancel")
                        if 2==s then
                                say_title("Blacksmith:")
                                say("")
                                say("Do you not want to help me? Really?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Blacksmith :")
                                        say("")
                                        say("I want that axe desperately!")
                                        say("We meet again? Yes?")
                                        say("")
                                        return
                                end
                                say_title("Blacksmith:")
                                say("")
                                say("Ah!! true shame.")
                                say("Now get out of here.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Blacksmith:")
                        say("")
                        say("Thank you for your assistance.")
                        say("Be careful, that Clan is dangerous.")
                        say("")
                        set_state(hunt_for_goldenaxe)

                end
        end

        state hunt_for_goldenaxe begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Find the golden Axe.")
                        q.set_title("Find the golden Axe.")
                        q.start()
                end

                when info or button begin
                	if pc.count_item("30102") == 0 then
				say_title("Find the golden Axe.")
				say("")
				say("Search for the White-Oath Soldier who stole the golden")
				say("Axe and bring it back to the Blacksmith.")
				say("")
				say_item_vnum(30102)
				say("")
			else
				say_title("You found the Axe.")
				say("")
				say("Bring the Golden Axe back to the Blacksmith!")
				say("")
			end
                end

                when 301.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30102")==0  then
                                pc.give_item2("30102", 1)
                                send_letter("You found the Axe." )

                                local v=find_npc_by_vnum(20016)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Return to the Blacksmith.")
                                end
                        end
                end

                when 20016.chat."Here is the golden Axe" begin
                        target.delete("__TARGET__")
                        if pc.count_item("30102") >= 1 then
                                say_title("Blacksmith:")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("")
                                say("Thank you very much.")
                                say("")
                                say("Now I do not have to worry about what Deokbae would")
                                say("say of his axe being lost!")
                                say("")

                                pc.remove_item("30102", 1)

                                pc.give_exp2(50000)
                                set_quest_state("levelup","run")
                                pc.change_money(10000)
				pc.give_item2(50037,1)
                                say_title("Reward:")
                                say("")
                                say_reward("You received 50.000 Experience Points.")
                                say_reward("You received 10.000 Yang.")
                                say_reward("You received Hexagonal Box.")
                                say("")

                                q.done()
                                set_state(__COMPLETE__)
                                return
                        end --if
                end  --when
        end  --state
        state __GIVEUP__ begin
        end

        state __COMPLETE__ begin
        end
end
