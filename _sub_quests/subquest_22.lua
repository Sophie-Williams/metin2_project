-------------------------------------------------
--SUB QUEST
--LV 35
--The Golden Axe of Deokbae
-------------------------------------------------
quest subquest_22 begin
        state start begin
                when login or levelup with pc.level >= 35  and pc.level <= 37 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20015)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "The Golden Axe of Deokbae")
                        end
                end


                when __TARGET__.target.click or
                        20015.chat."One Moment please.." begin
                        target.delete("__TARGET__")
                        say_title("The Lumberjack Deokbae:")
                        say("")
                        say("Oh no...oh no...")
                        say("I lost the axe.")
                        say("Maybe you know of what axe I am talking about?")
                        say("Ah yes..")
                        say("You know it?")
                        say("Yes, it is the Golden Axe")
                        say("I got from the Blacksmith.")
                        say("But - a Savage General stole it.")
                        say("")
                        wait()
                        say_title("The Lumberjack Deokbae:")
                        say("")
                        say("If the Blacksmith knows about this, he")
                        say("will go mad and won't repair my axes anymore...")
                        say("That's such a good axe.")
                        say("Can you bring it back to me?")
                        say("")
                        local s=select("Accept","Reject.")
                        if 2==s then
                                say("You want to stop the search?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("The Lumberjack Deokbae:")
                                        say("")
                                        say("Oh..")
                                        say("When you have time come again.")
                                        say("")
                                        return
                                end
                                say_title("The Lumberjack Deokbae:")
                                say("")
                                say("Too hard for you? Well nothing I can do then.")
                                say("But be careful, everywhere are savages.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("The Lumberjack Deokbae:")
                        say("")
                        say("Thanks.")
                        say("I only trust you!")
                        say("")

                set_state(hunt_for_goldaxe)
                end
        end




        state hunt_for_goldaxe begin
                when letter begin
                        send_letter("The Golden Axe of Deokbae")

                        if pc.count_item(30102)>0 then
                                local v=find_npc_by_vnum(20015)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Visit Deokbae")
                                end
                        end

                end
                when info or  button begin
                        if pc.count_item(30102)>0 then
                                say_title("You found the Golden Axe.")
                                say("")
                                say("You got the Golden Axe back from the savage.")
                                say("Deliver it to Deokbae.")
                                say("")
                                return
                        end
                        say_title("Search for the Golden Axe")
                        say("")
                        say("Get the Golden Axe back from the Savage Generals.")
                        say("")
                end



                when 504.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30102")==0  then
                                pc.give_item2("30102", 1)

                                local v=find_npc_by_vnum(20015)
                                if 0==v then
                                else
                                        target.vid("__TARGET__",v,"Visit Deokbae")
                                end
                        end
                end



                when 20015.chat."I found the Golden Axe!" with pc.count_item("30102")>=1 begin
                        target.delete("__TARGET__")
                        say_title("The Lumberjack Deokbae :")
                        say("")
                        say("Oh my, without your help I would have never")
                        say("see the axe again.")
                        say("Many thanks.")
                        say("Now I take better care of it.")
                        say("I'll carry it with me, always.")
                        say("")
                        pc.remove_item("30102",1)

                        say_reward("You received 400.000 Experience.")
                        pc.give_exp2(400000)

                        say_reward("You received 30.000 Yang.")
                        pc.change_money(30000)

                        set_state(__THEEND__)
                        clear_letter()
                end
        end


        state __GIVEUP__ begin
        end
        state __THEEND__ begin
                when enter begin
                        q.done()
                end
        end
end
