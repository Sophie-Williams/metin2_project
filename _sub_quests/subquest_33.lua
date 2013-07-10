----------------------------------------------------
-- SUB QUEST
-- LV  44
-- Bookworm��s Treasure Map
----------------------------------------------------

quest subquest_33 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=44  and pc.get_level() <= 46 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20023)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Go to the Bookworm.")
                        end
                end


                when __TARGET__.target.click or
                        20023.chat."Treasure Map of the Bookworm" with pc.level >= 44 begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Hey,")
                        say("I found strange information on old texts")
                        say("somewhere in this village could be treasure")
                        say("maps...Do you know the Protection Gods of")
                        say("the city?")
                        say("Lykos, Scrofa, Bera,")
                        say("Tigris.")
                        say("")
                        wait()
                        say_title("Mr.Soon:")
                        say("")
                        say("Those four god-like Monsters divided the map")
                        say("into four pieces and they protect it. It is")
                        say("an old fairytale so I am not sure...")
                        say("How about looking for proof?")
                        say("Please...")
                        say("I can't stand it..Please help me.")
                        say("")
                        local s=select("Accept","Cancel")
                        if 2==s then
                                say_title("Mr.Soon:")
                                say("")
                                say("You really want to cancel the Quest?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                            say_title("Mr.Soon:")
                                        say("")
                                        say("Not interested into Treasure Maps?")
                                        say("I will look through the old texts,")
                                        say("come back when you changed your mind.")
                                        say("")
                                        return
                                end
                                  say_title("Mr.Soon:")
                                say("")
                                say("You don't like such adventures?")
                                say("How shall I know get the Map Pieces?")
                                say("")
                                say("Oh well...Goodbye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                         say_title("Soon:")
                        say("")
                        say("Oh")
                        say("You will do it?")
                        say("You are a true friend.")
                        say("I trust in you that you'll find them.")
                        say("")
                        set_state(to_gain_map)
                end
        end

        state to_gain_map begin

                when letter begin
                        send_letter("The Treasure Map of the Bookworm")

                        if  pc.count_item(27988) ==4 then
                                local v = find_npc_by_vnum(20023)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Go to the Bookworm")
                                end
                                return
                        end

                end

                when info or button begin
                        if  pc.count_item(27988) >=4 then
                                say_title("Found Treasure Map")
                                say("")
                                say("I hunted the Animal Gods outside" )
                                say("the village and found all 4 parts of the Treasure Map.")
                                say("I'll carry them to Mr.Soon")
                                say("")
                                return
                        end
                        say_title("Hunting the Animal Gods")
                        say("")
                        say("Collect all 4 parts of")
                        say("the Treasure Map through hunting")
                        say("Lykos, Scrofa, Bera, Tigris." )
                        say("")
                        say_reward("(Found Piece of Treasure Map : "..pc.count_item(27988).." )")
                        say("")
                end


                when 191.kill begin
                        if        pc.getqf("kill_g1")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g1",1)
                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end
                when 192.kill begin
                        if        pc.getqf("kill_g2")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g2",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end

                when 193.kill begin
                        if        pc.getqf("kill_g3")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g3",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end

                when 194.kill begin
                        if        pc.getqf("kill_g4")==0 then
                                pc.give_item2(27988, 1)
                        end

                        pc.setqf("kill_g4",1)

                        if        pc.getqf("kill_g1")==1        and        pc.getqf("kill_g2")==1 and        pc.getqf("kill_g3")==1        and        pc.getqf("kill_g4")==1 then
                                set_state(hunt_reward)
                        end
                        return
                end
        end

        state hunt_reward begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("The Treasure Map")
                        q.set_title("The Treasure Map")
                        q.start()

                        local v = find_npc_by_vnum(20023)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Go to MrSoon")
                        end
                end

                when info or button begin
                        say_title("All Pieces of the Treasure Map collected")
                        say("")
                        say("Go back to Mr Soon and tell him you found ")
                        say("all Pieces of the Treasure Map")
                        say("")
                end

        when __TARGET__.click  or
                20023.chat."All Pieces of Treasure Map collected"  begin
                        target.delete("__TARGET__")
                        if pc.count_item(27988)>=4 then
                                say_title("Mr.Soon:")
                                say("")
                                say("Oh!")
                                say("Fantastic!")
                                say("Finally I have all pieces.")
                                say("I wouldn't have dreamed of this...")
                                say("Now connect the Pieces..")
                                say("for a whole map..")
                                say("wait a second...")
                                say("")
                                wait()
                                say_title("Mr.Soon:")
                                say("")
                                say("Hmm..There should be treasures?")
                                say("Strange, I can't believe it somehow...")
                                say("Do you want to go and see if there is ")
                                say("a treasure?")
                                say("Hmm, a childish game somehow...")
                                say("The Map says, the Treasure is near the Rock of")
                                say("the Old Man, you can look at it if you like")
                                say("It is maybe better to burn this Map...")
                                say("This childish Map..I will")
                                say("burn it...")
                                say("")
                                local s=select("I will try","Burn it.")
                                if 2==s then
                                        say_title("Soon:")
                                        say("")
                                        say("You really want to cancel the Quest?")
                                        say("")
                                        local a=select("Yes","No")
                                        if  1==s then
                                                    say_title("Mr.Soon:")
                                                say("")
                                                say("Yeah, really a dumb fairytale!")
                                                say("Burn it..")
                                                say("I am sorry that you went and")
                                                say("collected it.")
                                                say("Oh well, that's it, bye.")
                                                say("")
                                                pc.remove_item(27988,4)
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                           say_title("Mr.Soon:")
                                        say("")
                                        say("Why hesitating?")
                                        say("You already collected the Map...")
                                        say("Hurry, and don't forget the Map!")
                                        say("")
                                        set_state(to_gain_tresure)
                                        return

                                end
                                 say_title("Mr.Soon:")
                                say("")
                                say("Oh")
                                say("You will try it?")
                                say("It would be a surprise if you'd find the ")
                                say("Treasure. Good luck!")
                                say("Don't forget the Map!")
                                say("")
                                set_state(to_gain_tresure)
                                return
                        else
                                 say_title("Mr.Soon:")
                                say("")
                                say("The Map was divided into 4 parts.")
                                say("Get the other parts.")
                                say("")
                                local s=select("Try again","Give up")
                                if 2==s then
                                           say_title("Mr.Soon:")
                                        say("")
                                        say("You give up??")
                                        say("Oh well then, goodbye.")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                 say_title("Mr.Soon:")
                                say("")
                                say("I knew you'd go on.")
                                say("I trust in you!")
                                say("")
                end

        end
end
        state to_gain_tresure begin
                when letter begin
                        send_letter("Treasure Map of the Bookworm")

                        local v=find_npc_by_vnum(20009)  -----------old man
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"")
                                end

                end

                when info or button begin
                        say_title("Search for the Treasure")
                        say("")
                        say_pc_name()
                        say("Hmm, under the Rock near the Old Man...")
                        say("No idea.")
                        say("I should first ask the Old Man.")
                        say("Why is the way that far, damn.")
                        say("")
                end


                when __TARGET__.target.click or
                        20009.chat."Search for the Treasure" with pc.count_item(27988)>=4 begin
                         target.delete("__TARGET__")
                         say_title("Old Man")
                         say("")
                         say("What are you looking for?")
                         say("Show me the Map.")
                         say("Hmmmm..")
                         say("I think I know.")
                         say("Dig down there.")
                         say("")
                         wait("")
                         say_pc_name()
                         say("")
                         say("I dig there where the old man showed me.")
                         say("After an eternity of digging...")
                         say("I can see a Chest!")
                         say_item_vnum(70009)

                         pc.give_item2(70009, 1)

                         set_state(go_to_reward)
                 end

        end

        state go_to_reward begin
                when letter begin
                        send_letter("The Treasure is really existing!")

                        local v=find_npc_by_vnum(20023)
                                if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Go to Mr.Soon")
                                end

                end

                when info or button begin
                        say_title("Found the Treasure")
                        say("")
                        say("I went there where the Map of Mr.Soon")
                        say("led me and the Treasure really exist!")
                        say("I didn't think so.")
                        say("I should tell him.")
                        say("Off to Mr.Soon.")
                end


                when __TARGET__.click or
                        20023.chat."Found the Treasure"  begin
                        target.delete("__TARGET__")
                        if pc.count_item(70009)>=1 then
                                say_title("Mr.Soon:")
                                say("")
                                say("Oh! That is a surprise!")
                                say("Exactly this Treasure was mentioned in the")
                                say("old texts. Thanks!")
                                say("Here, take this as a sign of appreciation.")
                                say("")
                                pc.remove_item(70009,1)
                                pc.remove_item(27988,4)

                                say_reward("You received 1.800.000 Experience Points.")
                                pc.give_exp2(1800000)

                                say_reward("You received 50.000 Yang")
                                pc.change_money(50000)

                                if pc.job == 0 then
                                        pc.give_item2(12244, 1)
                                        say_reward("You received Ghost Mask Sallet+4.")
                                elseif pc.job == 1 then
                                        pc.give_item2(12524, 1)
                                        say_reward("You received Castle Helm+4.")
                                elseif pc.job == 2 then
                                        pc.give_item2(12384, 1)
                                        say_reward("You received Steel Hood+4.")
                                elseif pc.job == 3 then
                                        pc.give_item2(12664, 1)
                                        say_reward("You received Sunlight Hat+4.")
                                end

                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("Mr.Soon:")
                                say("")
                                say("You haven't found him yet, have you?")
                                say("")
                                return

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



