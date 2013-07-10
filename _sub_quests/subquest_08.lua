quest subquest_8 begin
        state start begin
                when login or levelup with pc.level >= 15 and pc.level <= 20 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20003)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Rice Cake?")
                        end
                end


                when __TARGET__.target.click or
                        20003.chat."Rice cake?" with pc.level >= 15 begin
                        target.delete("__TARGET__")

                        say_title("Ah-Yu:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Excuse me, if you have some time, could you please help me?")
                        say("")
                        say("As you hear my baby cries and he does not stop.")
                        say("I don't know what to do.")
                        say("")
                        say("My baby loves Rice Cake and I think a Rice Cake would help.")
                        say("I'm sure the Weapon Shop Dealer knows where to get some.")
                        say("Would you ask him for me?")
                        say("")

                        local s=select("Accept","Reject")
                        if 2==s then
                                say("Really cancel Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Ah-Yu:")
                                        say("")
                                        say("You are busy?")
                                        say("Please come back again.")
                                        say("Do not cry my little one.")
                                        say("")
                                        return
                                end
                                say_title("Ah-Yu:")
                                say("")
                                say("Ok...")
                                say("Thank you for your time.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ah-Yu:")
                        say("")
                        say("You really want to do me a favour?")
                        say("Thank you very much!")
                        say("")
                        set_state(ask_for_ricecake)

                end
        end

        state ask_for_ricecake begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Visit the Weapon Shop Dealer")
                        q.set_title("Visit the Weapon Dealer")
                        q.start()

                        local v=find_npc_by_vnum(9001)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v, "Visit the Weapon Shop Dealer.")
                        end

                end

                when info or button begin
                        say_title("Visit the Weapon Shop Dealer")
                        say("")
                        say("Ask the Weapon Shop Dealer about Rice Cake.")
                        say("")
                end

                when __TARGET__.target.click or
                        9001.chat."Give me a Rice Cake." begin
                        target.delete("__TARGET__")
                        say_title("Weapon Shop Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What? Rice Cake? Why do you need that? Is that some weapon")
                        say("I don't know about? I don't understand...?")
                        say("")
                        say("Ah, Rice Cake, something to eat! You should ask Octavio,")
                        say("he knows everything you can possibly know about food.")
                        say("")

                        set_state(ask_for_ricecake2)
                end
        end

        state ask_for_ricecake2 begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Octavio.")
                        q.set_title("Go to Octavio.")
                        q.start()

                        local v= find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Go to Octavio.")
                        end

                end

                when info or button begin
                        say_title("Go to Octavio.")
                        say("")
                        say("Ask Octavio about Rice Cake. He is in the "..areaname[pc.get_empire()][0].." village.")
                        say("")
                end

                when __TARGET__.target.click or
                        20008.chat."May I have a Rice Cake." begin
                        target.delete("__TARGET__")
                        say_title("Octavio:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Hmm, you want some Rice Cake? I don't have any right now.")
                        say("")
                        say("But you can get some from the Rice Cake seller Yu-Rang")
                        say("in the "..areaname[pc.get_empire()][2].." village.")
                        say("")
                        local s=select("Thanks, I will go there."," I have no time for that.")
                        if 2==s then
                                say("Cancel?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Octavio:")
                                        say("")
                                        say("You have a long way to go. See you later!")
                                        say("")
                                        return
                                end
                                say_title("Octavio:")
                                say("")
                                say("What did you say?")
                                say("")
                                say("Oh that is a shame...")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Octavio:")
                        say("")
                        say("Very nice of you. Have a good trip.")
                        say("")
                        set_state(ask_for_ricecake3)
                end
        end

        state ask_for_ricecake3 begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Yu-Rang")
                        q.set_title("Go to Yu-Rang")
                        q.start()

                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Go to Yu-Rang.")
                        end

                end

                when info or button begin
                        say_title("Go to Yu-Rang")
                        say("")
                        say("Ask Yu-Rang for Rice Cake.")
                        say("You will find her in the next village.")
                        say("")
                end

                when __TARGET__.target.click or
                        20012.chat."Give me some Rice Cake." begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("")
                        say("Can I help you? Oh! Rice Cake. Sure, I can give you some!")
                        say("")
                        say("But... A girl named Taurean often comes here and teases me.")
                        say("I do not know why she teases me and runs away. If you talk")
                        say("to Taurean for me, I will give you some Rice Cake.")
                        say("")
                        say("Okay?")
                        say("")

                        set_state(ask_for_ricecake4)
                end
        end

        state ask_for_ricecake4 begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Taurean.")
                        q.set_title("Go to Taurean.")
                        q.start()

                        local v=find_npc_by_vnum(20014)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Go to Taurean.")
                        end

                end

                when info or button begin
                        say_title("Go to Taurean.")
                        say("")
                        say_reward("Go to Taurean to get ")
                        say_reward("Rice Cake from Yu-Rang .")
                        say("")
                end


                when __TARGET__.target.click or
                        20014.chat."Why are you teasing Yu-Rang?" begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Who am I teasing? Oh, the girl selling Rice Cake?")
                        say("")
			say("I just wanted to play, you know what I mean? It isn't what")
			say("you think! I didn't want to tease her!")
			say("")
                        say("I was bored and it looked like she did not have much to do,")
                        say("so I just wanted to... entertain her!")
                        say("")
                        say("I will not do it again, I promise!")
                        say("")

                        set_state(report_to_girl)
                end
        end

        state report_to_girl begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Return to Yu-Rang")
                        q.set_title("Return to Yu-Rang")
                        q.start()

                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v, "Return to Yu-Rang.")
                        end

                end

                when info or button begin
                        say_title("Return to Yu-Rang")
                        say("")
                        say("Go back to Yu-Rang and get the Rice Cake.")
                        say("")
                end


                when __TARGET__.target.click or
                        20012.chat."Give me a Rice Cake." begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say("")
                        say("Hehe, so you talked with Taurean?")
                        say("")
                        say("Thank you. Here is some Rice Cake. Enjoy your meal.")
                        say("")

                        set_state(reward_go)
                end
        end

        state reward_go begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Ah-Yu")
                        q.set_title("Go to Ah-Yu")
                        q.start()

                        local v=find_npc_by_vnum(20003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Deliver the Rice Cake.")
                        end

                end

                when info or button begin
                        say_title("Go to Ah-Yu")
                        say("")
                        say("Go to Ah-Yu and deliver the Rice Cake.")
                        say("You will find her in the "..areaname[pc.get_empire()][1].." village.")
                        say("")
                end

                when __TARGET__target.click or 20003.chat."Here is some Rice Cake" begin
                        target.delete("__TARGET__")
                        say_title("Ah-Yu:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("You brought me the Rice Cake! That's excellent.")
                        say("Oh! My baby stoped crying. Thank you so much!")
                        say("")

                        pc.give_exp2(36000)
                        set_quest_state("levelup","run")
                        pc.change_money(15000)

                        say_title("Reward:")
                        say("")
                        say_reward("You received 36.000 Experience Points." )
                        say_reward("You received 15.000 Yang .")
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
