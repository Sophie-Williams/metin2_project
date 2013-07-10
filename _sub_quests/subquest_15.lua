quest subquest_15 begin
        state start begin
                when login or levelup or enter with pc.get_level() >= 23  and pc.get_level() <= 28 begin
                        set_state( information )
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
                                target.vid("__TARGET__", v, "Kill Eun-Jung of the White Oath Clan.")
                        end
                end


                when __TARGET__.target.click or
                        11000.chat."Kill Eun-Jung of the White Oath Clan." or
                        11002.chat."Kill Eun-Jung of the White Oath Clan." or
                        11004.chat."Kill Eun-Jung of the White Oath Clan." with pc.level >= 23 begin
                        target.delete("__TARGET__")

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Come here for a moment. You seem to be fearless. I have")
                        say("heard a lot about you from the Captain.")
                        say("")
                        say("The White Oath Clan is even worse than before.")
                        say("")
                        wait()

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You have already defeated a leader of the White Oath")
                        say("Clan; but we are still in danger!")
                        say("")
                        say("The damage caused by the White Oath Clan didn't become")
                        say("less. Their anger from the loss of a leader made them")
                        say("even worse than before.")
                        say("")
                        wait()

                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("To end this, we have to kill Captain Eun-Jung. The rest")
                        say("of them should be easy.")
                        say("")
                        say("Go and kill Eun-Jung!")
                        say("")
                        say("Our fate is in your hands!")
                        say("")
                        local s=select("I will do it.","No, thank you.")
                        if 2==s then
                                say("Cancel Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Guard")
                                        say("")
                                        say("You will come back later right?")
                                        say("You are the right person for this.")
                                        say("")
                                        return
                                end
                                say_title("Guardian:")
                                say("")
                                say("You can not do it?")
                                say("I am disappointed to hear this.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Guardian:")
                        say("")
                        say("I knew you would help us!")
                        say("")
                        say("Kill Eun-Jung, we can handle the rest.")
                        say("")
                        say("Good luck!")
                        say("")
                        set_state(hunt_eunjung)
                end
        end

        state hunt_eunjung begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Kill Eun-Jung.")
                        q.set_title("Kill Eun-Jung.")
                        q.start()
                end

                when button or info begin
                        say_title("Kill Eun-Jung")
                        say("")
                        say("Kill Eun-Jung of the White Oath Clan!")
                        say("")
                        say("She is causing us many troubles.")
                        say("")
                end

                when 392.kill begin
                        set_state(hunt_reward)
                end
        end

        state hunt_reward begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Report to the Guardian.")
                        q.set_title("Report to the Guardian.")
                        q.start()
                end

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
                                target.vid("__TARGET__", v, "Go back to the Guardian.")
                        end
                end

                when info or button begin
                        say_title("You kill Eun-Jung")
                        say("")
                        say("Go back to the Guardian and inform him")
                        say("about Eun-Jung.")
                        say("")
                end

                when __TARGET__.target.click or
                        11000.chat."I have killed Eun-Jung!" or
                        11002.chat."I have killed Eun-Jung!" or
                        11004.chat."I have killed Eun-Jung!" begin
                        target.delete("__TARGET__")
                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You are fantastic! You are even better then expected.")
                        say("")
                        say("We could not do anything against those leaders of ")
                        say("the White Oath Clan and you defeated them easily.")
                        say("")
                        wait()
                        say_title("Guardian:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("It is impressive. You shall receive an adequate reward.")
                        say("")
                        say("Please take this and we hope you will work with us in the")
                        say("future for the peace of the empire!")
                        say("")
                        say("Now that you are an accomplished adventurer, you should")
                        say("start looking for a Guild to join. Good luck!")
                        say("")
                        local s = select("Tell me more about guilds.","So what is the reward?")
                        if s == 1 then
                        	say_title("Guardian:")
                        	say("")
                        	----"123456789012345678901234567890123456789012345678901234567890"|
                        	say("If you want to achieve something, doing everything by")
                        	say("yourself isn't easy. That's why adventurers gather in")
                        	say("Guilds so they can help each other.")
                        	say("")
                        	say("Guilds are shown next to the player's name. Find a guild")
                        	say("you like and ask to join it! You lose nothing by asking")
                        	say("and it can make your adventures more exciting.")
                        	say("")
                        	wait()
                        end
                        pc.give_exp2(150000)
                        pc.change_money(25000)
                        
                        helmet = {12224,12364,12504,12644}
                        pc.give_item2(helmet[pc.get_job()+1], 1)
                        say_title("Reward:")
                        say("")
                        say_reward("You received 150.000 Experience Points")
                        say_reward("You received 25.000 Yang.")
                        say_reward("You received "..item_name(helmet[pc.get_job()+1])..".")
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
