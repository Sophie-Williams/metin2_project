quest subquest_12 begin
        state start begin
                when login or levelup with pc.level >= 20  and pc.level <= 25 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum=11000
                        elseif pc.get_empire() == 2 then
                                vnum=11002
                        elseif pc.get_empire() == 3 then
                                vnum=11004
                        end

                        local v = find_npc_by_vnum(vnum)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Kill Mi-Jung of the White Oath.")
                        end
                end


                when __TARGET__.target.click or
                        11000.chat."Kill Mi-Jung of the White Oath." with pc.level >= 20 begin
                        target.delete("__TARGET__")

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Come here for a moment. You are a good fighter. I heard a")
                        say("lot about you from the Captain.")
                        say("")
                        say("Can you go after Mi-Jung of the White Oath?")
                        say("")
                        say("It is hard to protect the village and its villagers from")
                        say("the attacks of the White Oath Clan. If we kill Mi-Jung,")
                        say("one of their leaders, the situation could change for")
                        say("good. The safety of the village is in your hands. I trust")
                        say("that you will not fail!")
                        say("")

                        local s=select("Yes, I will do it.","I can not handle it.")
                        if 2==s then
                                say_title("Guardian:")
                                say("")
                                say("You really do not want to help us?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Guardian:")
                                        say("")
                                        say("It seems like it is not the right time.")
                                        say("")
                                        say("Come back later.")
                                        say("")
                                        return
                                end
                                say_title("Guardian:")
                                say("")
                                say("If you do not want to help, I have nothing to do.")
                                say("Then leave now...")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Guardian:")
                        say("")
                        say("Thank You!!! Now please go kill Mi-Jung!")
                        say("Before she and her clan attacks!!!")
                        say("")
                        set_state(hunt_mijung)

                end
                when __TARGET__.target.click or
                        11002.chat."Kill Mi-Jung of the White Oath." with pc.level >= 20 begin
                        target.delete("__TARGET__")

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Come here for a moment.")
                        say("")
                        say("You are a good fighter. I heard a lot about you from the")
                        say("Captain.")
                        say("")
                        say("Can you go after Mi-Jung of the White Oath?")
                        say("")
                        say("It is hard to protect the village and its villagers from")
                        say("the attacks of the White Oath Clan. If we kill Mi-Jung,")
                        say("one of their leaders, the situation will change.")
                        say("")
                        say("The safety of the village is in your hands. I trust that")
                        say("you will not fail!")
                        say("")

                        local s=select("Yes, I will do it.","I can not handle it.")
                        if 2==s then
                                say_title("Guardian:")
                                say("")
                                say("You really do not want to help us?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Guardian:")
                                        say("")
                                        say("It seems like it is not the right time.")
                                        say("")
                                        say("Come back later.")
                                        say("")
                                        return
                                end
                                say_title("Guardian:")
                                say("")
                                say("If you do not want to help, I have nothing to do.")
                                say("Then leave now...")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Guardian:")
                        say("")
                        say("Thank You!!! Now please go kill Mi-Jung!")
                        say("Before she and her clan attacks!!!")
                        say("")
                        set_state(hunt_mijung)

                end
                when __TARGET__.target.click or
                        11004.chat."Kill Mi-Jung of the White Oath." with pc.level >= 20 begin
                        target.delete("__TARGET__")

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Come here for a moment.")
                        say("")
                        say("You are a good fighter. I heard a lot about you from the")
                        say("Captain.")
                        say("")
                        say("Can you go after Mi-Jung of the White Oath?")
                        say("")
                        say("It is hard to protect the village and its villagers from")
                        say("the attacks of the White Oath Clan. If we kill Mi-Jung,")
                        say("one of their leaders, the situation will change.")
                        say("")
                        say("The safety of the village is in your hands. I trust that")
                        say("you will not fail!")
                        say("")

                        local s=select("Yes, I will do it.","I can not handle it.")
                        if 2==s then
                                say_title("Guardian:")
                                say("")
                                say("You really do not want to help us?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Guardian:")
                                        say("")
                                        say("It seems like it is not the right time.")
                                        say("")
                                        say("Come back later.")
                                        say("")
                                        return
                                end
                                say_title("Guardian:")
                                say("")
                                say("If you do not want to help, I have nothing to do.")
                                say("Then leave now...")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Guardian:")
                        say("")
                        say("Thank You!!! Now please go kill Mi-Jung!")
                        say("Before she and her clan attacks!!!")
                        say("")
                        set_state(hunt_mijung)

                end

        end

        state hunt_mijung begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Kill Mi-Jung.")
                        q.set_title ("Go and kill Mi-Jung!")
                        q.start()
                end

                when info or button begin
                        say_title("Kill Mi-Jung of the White Oath Clan.")
                        say("")
                        say("Go and kill Mi-Jung of the White Oath Clan.")
                        say("Then return to the Guardian.")
                        say("")
                end

                when 391.kill begin
                        set_state(hunt_reward)
                end
        end

        state hunt_reward begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Report to the Guardian.")
                        q.set_title ("Report to the Guardian.")
                        q.start()

                        local vnum=0

                        if pc.get_empire() == 1 then
                                vnum=11000
                        elseif pc.get_empire() == 2 then
                                vnum=11002
                        elseif pc.get_empire() == 3 then
                                vnum=11004
                        end

                        local v=find_npc_by_vnum(vnum)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Go to the Guardian.")
                        end
                end

                when info or button begin
                        say_title("Kill Mi-Jung of the White Oath Clan.")
                        say("")
                        say("Report to the Guardian to receive your reward!")
                        say("")
                end
				
                when __TARGET__.target.click or
                        11000.chat."Mi-Jung is dead!" or
                        11002.chat."Mi-Jung is dead!" or
                        11004.chat."Mi-Jung is dead!" begin
                        target.delete("__TARGET__")
                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Oh! You are really as good as I have heard.")
                        say("You are amazing. Thank you!")
                        say("")
                        say("The solution of the problems with the White Oath Clan")
                        say("has become easier. Well done!")
                        say("")

                        pc.give_exp2(130000)
                        pc.change_money(20000)
                        pc.give_item2("14040", 1)

                        say_title("Reward:")
                        say("")
                        say_reward("You received 130.000 Experience Points.")
                        say_reward("You received 20.000 Yang.")
                        say_reward("You received a Silver Bracelet.")
                        say("")

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
