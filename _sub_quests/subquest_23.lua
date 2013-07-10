-------------------------------------------------------
--SUB QUEST
--LV 36
--Search for Mirine��s Brother
-------------------------------------------------------
quest subquest_23 begin
    state start begin
                when login or levelup with pc.level >= 36  and pc.level <= 38 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v= find_npc_by_vnum(20006)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Please search for my older brother")
                        end
                end

                when __TARGET__.target.click or
                        20006.chat."The girls cries"  begin
                    target.delete("__TARGET__")
                        say_title("Mirine:")
                        say("")
                        say("Moment, please..")
                        say("You once gave me the letter from my ")
                        say("brother, didn't you?")
                        say("I was very grateful.")
                        say("But there is now again no contact to him.")
                        say("My brother is still away.")
                        say("He is searching for herbs.")
                        say("")
                        wait()
                        say("")
                        say_title("Mirine:")
                        say("")
                        say("I am worried about him as")
                        say("he has not contacted me.")
                        say("Sorry, but - could you maybe")
                        say("look again for my brother?")
                        say("Maybe Yu-Hwan knows something.")
                        say("")
                        local s=select("Accept", "Reject")
                        if 2==s then
                                say("You want to give up?")
                                local a=select("Yes","No")
                                        if 2==a then
                                                say_title("Mirine:")
                                                say("")
                                                say("..Sobs..")
                                                say("I wait...Come back please.")
                                                say("")
                                                return
                                        end
                                        say_pc_name()
                                        say("")
                                        say("I have no time.")
                                        say("You want to help the girl anyway?")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_pc_name()
                                say("")
                                say("To help that poor girl is nice")
                                say("and isn't much work.")
                                say("Then let's go!")
                                say("")
                                set_state(to_yuhwan)

                end
        end
    state to_yuhwan begin
                when letter begin
                        send_letter("Search for Yu-Hwan!")

                        local v= find_npc_by_vnum(20017)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Go to Yu-Hwan")
                        end

                end
                when button or info begin
                        say_title("Go to Yu-Hwan")
                        say("")
                        say("The older brother of Mirine vanished")
                        say("again. He didn't give a life-sign for")
                        say("a while.")
                        say("The letter you brought her recently was")
                        say("the last contact. Go to Yu-Hwan and search the older")
                        say("brother of Mirine.")
                        say("")
                end


                when __TARGET__.target.click or
                        20017.chat."Have you seen the older brother?" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Hwan:")
                        say("")
                        say("Mirine sent you?")
                        say("She's very worried about her brother.")
                        say("What can I do...")
                        say("I haven't seen him")
                        say("myself a long time.")
                        say("I can't really remember either.")
                        say("I have no contact to him now.")
                        say("That's why I am also worried...")
                        say("Maybe something happened to him.")
                        say("I heard that the Hunter Yang-Shin saw him.")
                        say("Ask him best, maybe he has a clue.")
                        say("")
                        set_state(to_hunter)
                end
        end


        state to_hunter begin
                when letter begin
                        send_letter("Search for the Hunter!")

                        local v= find_npc_by_vnum(20019)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Go to the Hunter Yang-Shin")
                        end

                end
                when button or info begin
                        say_title("Go to the Hunter Yang-Shin")
                        say("")
                        say("To search the older brother of,")
                        say("visit the Hunter Yang-Shin.")
                        say("")
                end


                when __TARGET__.target.click or
                        20019.chat."Have you seen the brother of Mirine?" begin
                        target.delete("__TARGET__")
                        say_title("Yang-Shin:")
                        say("")
                        say("The older brother of Mirine??")
                        say("Last time I met him he was")
                        say("collecting herbs.")
                        say("He went to the Dragon Valley.")
                        say("There are many ghosts and it")
                        say("is very dangerous there.")
                        say("")
                        wait()
                        say_title("Yang-Shin:")
                        say("")
                        say("Even the bravest hunters don't go to the Dragon")
                        say("Valley. There he went")
                        say("to find herbs.")
                        say("If he didn't send a life-sign yet,")
                        say("surely something happened.")
                        say("Go to the Dragon")
                        say("Valley, there you can find him.")
                        say("")
                        local s=select("I search for him", "Give up")
                        if 2==s then
                                say("Give up search?")
                                say("")
                                local a=select("Yes","No")
                                if 2== a then
                                        say_pc_name()
                                        say("")
                                        say("Not even for a reward.")
                                        say("Come back when you have time.")
                                        say("")
                                        return
                                end
                                say_pc_name()
                                say("")
                                say("Only because there wasn't any contact")
                                say("after the older brother of")
                                say("Mirine went to the Dragon Valley")
                                say("there mustn't have happened anything.")
                                say("Only because the girl asked you")
                                say("you needn't go there.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_pc_name()
                        say("")
                        say("Not only the Dragon Valley is ")
                        say("dangerous, additionally the ")
                        say("ghosts are terrible.")
                        say("Mirine therefore desperately asked you.")
                        say("You decided yourself to ")
                        say("search for the brother,")
                        say("I'll go then.")
                        say("")
                        set_state(to_danger_place)
                end
        end

         state to_danger_place begin
                when letter begin
                        send_letter("Search for the older brother in the Dragon Valley!")

                        local v= find_npc_by_vnum(20356)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Search for the older brother in the Dragon Valley")
                        end

                end
                when button or info begin
                        say_title("Search for the older brother in the Dragon Valley.")
                        say("")
                        say("After been seen by Yu-Hwan and the Hunter, the older")
                        say("brother of Mirine")
                        say("teleported to the Dragon Valley to find")
                        say("better herbs.")
                        say("Go to the Dragon Valley to")
                        say("search for the older brother of Mirine.")
                        say("You can teleport to the Dragon Valley.")
                        say("")
                end


                when __TARGET__.target.click or
                        20356.chat."The Body!" begin
                        target.delete("__TARGET__")
                        say_pc_name()
                        say("")
                        say("There is a fresh body.")
                        say("It looks like a thin man.")
                        say("He carries a necklace with ")
                        say("a pendant. There could be a connection between")
                        say("the older brother and this necklace.")
                        say("I'll give this to Mirine")
                        pc.give_item2(16082)
                        pc.give_item2(30155)
                        set_state(to_mirinae)
                end
        end



         state to_mirinae  begin
                when letter begin
                        send_letter("Go to Mirine")

                        local v= find_npc_by_vnum(20006)
                        if v!= 0 then
                                target.vid("__TARGET__",v,"Go to Mirine")
                        end

                end
                when button or info begin
                        say_title("Go to Mirine")
                        say("")
                        say("After you found the body in the Dragon Valley,")
                        say("go to Mirine and give her the necklace")
                        say("with the pendant you found.")
                        say("")
                end


                when __TARGET__.target.click or
                        20006.chat."Maybe this is your brother..." with pc.count_item(16082)>0 and pc.count_item(30155)>0 begin
                        target.delete("__TARGET__")
                        say_title("Mirine:")
                        say("")
                        say("You have a message from my older brother?")
                        say("Oh that necklace...")
                        say("That's the necklace he always wore, ")
                        say("I have nearly the same.")
                        say("We always wore these necklaces.")
                        say("But...my brother isn't here anymore...")
                        say("Only the necklace came back...")
                        say("")
                        wait()
                        say_title("Mirine:")
                        say("")
                        say("My poor brother...")
                        say("Everything because of the war.")
                        say("If there wasn't this war")
                        say("we'd be still happy...")
                        say("Because of the war we didn't have much money.")
                        say("My older brother sold the herbs and")
                        say("there we got money from, so we could")
                        say("eat. My brother always worked hard.")
                        say("Because of me my brother is now dead.")
                        say("")
                        wait()
                        say_title("Mirine:")
                        say("")
                        say("Thanks you for bringing me this,")
                        say("because now I know what has happened.")
                        say("If you wouldn't have helped me")
                        say("I would never have known what happened to")
                        say("him.")
                        wait()
                        say_title("Mirine:")
                        say("")
                        say("I'll take good care of the pendant of my older")
                        say("brother, the necklace is for you as a")
                        say("thanks. It can surely help you.")
                        say("")
                        say("Thanks for your help.")
                        say("He is surely in heaven now, don't you think so?")
                        say("")
                        pc.remove_item(30155,1)

                        say_reward("You reveived 600.000 Experience.")
                        say_reward("You received 35.000 Yang.")
                        pc.give_exp2(600000)
                        pc.change_money(35000)

                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__  begin
                when enter begin
                        q.done()
                end
        end
end
