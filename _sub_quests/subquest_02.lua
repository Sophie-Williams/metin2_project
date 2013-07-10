quest subquest_2 begin
        state start begin
                when login or levelup with pc.level >= 7 and pc.level <= 12 begin
                        set_state(information)
                end
        end
        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9003)

                        if v!= 0 then
                                target.vid("__TARGET__", v, "The Dinner.")
                        end
                end


                when __TARGET__.target.click begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("General Store:")
                        say("")
                        say("I am sure the you know the Armor Shop Dealer.")
                        say("")
                        say("He is my father.")
                        say("")
                        say("I want to prepare dinner for him, but I don't know what he")
                        say("wants to eat. Could you ask him what he would like to have?")
                        say("I will reward you for your time.")
                        say("")

                        set_state(ask_dinner)
                end
        end

        state ask_dinner begin
                when letter begin
                        local v=find_npc_by_vnum(9002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Find the Armor Shop Dealer.")
                        end
                end
                when letter begin
                        send_letter("Find the Armor Shop Dealer.")
                end
                when button or info begin
                        say_title("Information:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The General Store Keeper wants to know what her father, the")
                        say("Armor Shop Dealer, would like to have for dinner.")
                        say("")
                        say("Go to the Armor Shop Dealer and ask him.")
                        say("")
                end

                when __TARGET__.target.click begin
                        target.delete("__TARGET__")

                        say_title("Armor Shop Dealer:")
                        say("")
                        say("Welcome!")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I produce armour to protect you from attacks with daggers")
                        say("and swords... Ah! My daughter sent you about dinner?")
                        say("She is asking what I want for dinner?")
                        say("")
                        say("Let me think about it... Mmm, I'd like to have:")
                        say("a hotpot with venison, bear cabbage and two eggs.")
                        say("That's what I am really long for!")
                        say("")

                        set_state(report)
                end
        end

        state report begin
                when letter begin
                        local v = find_npc_by_vnum(9003)
                        if v!= 0 then
                                target.vid("__TARGET__", v, "The Dinner")
                        end
                end

                when letter begin
                        send_letter("The Dinner.")
                end

                when button or info begin
                        say_title("The Dinner.")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The Shopkeeper wants to know what her father, the Armor")
                        say("Shop Dealer, would like to have for dinner.")
                        say("")
                        say("Inform the General Store about what her father is")
                        say("longing for.")
                        say("")
                end

                when 9002.chat."The Dinner" begin

                        say_title("Armor Shop Dealer: ")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("All this talk about food makes me hungry.")
                        say("")
                        say("I am really longing for a hotpot with venison, bear cabbage")
                        say("and two eggs.")
                        say("")
                end


                when __TARGET__.target.click begin
                        target.delete("__TARGET__")

                        say_title("General Store:")
                        say("")
                        ---                                                   l
                        say("Did my father tell you what he would like to eat?")
                        say("")

                        local s = select(           ----"12345678901234567890123456789012345678901234567890"|
                                                        "Hotpot with pork, bear cabbage and an egg",
                                                        "Hotpot with venison, bear cabbage and an egg",
                                                        "Hotpot with venison, bear cabbage and two eggs",
                                                        "Oh ... I forgot what it was ...")

                        if s == 3 then
                                say_title("General Store:")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("Thank you, for informing me that fast.")
                                say("Please accept this for your trouble.")
                                say("")

                                say_title("Reward:")
                                say("")
                                say_reward("Experience Points: 800" )
                                say_reward("Yang: 1.500")
                                say("")

                                pc.give_exp2(800)
                                set_quest_state("levelup","run")
                                pc.change_money( 1500 )

                                clear_letter()
                                set_state(__COMPLETE__)
                        elseif s == 4 then
                                say("General Store:")
                                say("")
                                say("The name of that dish was very long, wasn't it?")
                                say("Could you please ask him again?")
                                say("")

                                set_state(ask_dinner)

                        else
                                say("General Store:")
                                say("")
                                say("He really said that?")
                                say("")
                                say("That is strange! He never liked that dish.")
                                say("Could you please ask him again?")
                                say("I do not think he wants that dish.")
                                say("")

                                set_state(ask_dinner)
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end
