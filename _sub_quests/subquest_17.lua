---------------------------------------------------
-- SUB QUEST
-- LV 27
-- Looking for Ari-Young"s Husband
---------------------------------------------------
quest subquest_17 begin
        state start begin
                when login or levelup with pc.level >= 27  and pc.level <=30 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20021)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "The story of Ariyoung��s husband")
                        end
                end

                when __TARGET__.target.click or
                        20021.chat."The story of Ariyoung��s husband"  begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Much time has passed since I heard something about my")
                        say("husband. I am worried, I hope nothing happened to him.")
                        say("")
                        say("I do not think it is useful to be worried, but my heart")
                        say("beats so hard! I cannot calm down.")
                        wait()
                        say_title("Ariyoung:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Perhaps the General Dealer has heard something about my")
                        say("husband. She has many customers.")
                        say("")
                        local s=select("I will visit her","I have no time")
                        if 2==s then
                        	say("")
                                say("You want to cancel this Quest?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Ariyoung:")
                                        say("")
                                        say("If you reconsider it, please return.")
                                        say("")
                                        say("Please!")
                                        say("")
                                        return
                                end
                                say_title("Ariyoung:")
                                say("")
                                say("You have no time? Okay then... Bye..")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung:")
                        say("")
                        say("Thank you for your kindness. God, where is my husband...?")
                        say("")
                        set_state(to_itemmall_owner)

                end

        end

        state to_itemmall_owner begin
                when letter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Talk to the General Dealer")
                        end

                        send_letter("Talk to the General Dealer")
                end
                when info or button begin
                        say_title("Talk to the General Dealer")
                        say("")
                        say("Go to the General Dealer and ask him about")
                        say("Ariyoung's husband.")
                        say("")
                end



                when __TARGET__.target.click or
                        9003.chat."The story of Ariyoung's husband"  begin
                        target.delete("__TARGET__")
                        say("General Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("She does not know what has happened? He is in a place")
                        say("where no one returns from...")
                        say("")
                        say("When he came back to the village one day he was assaulted")
                        say("by the Black Wind Gang and got killed.")
                        say("")
                        wait()
                        say("General Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I am afraid she will be very sad when you tell her.")
                        say("")
                        say("They have loved each other so much...")
                        say("But you should tell her.")
                        say("")
                        set_state(find_ariyoung)
                end
        end
        state find_ariyoung begin
                when letter begin
                        local v=find_npc_by_vnum(20021)
                        if 0!=v then
                                target.vid("__TARGET__",v,"Return to Ariyoung")
                        end

                        send_letter("Return to Ariyoung")
                end

                when info or  button begin
                        say_title("Ariyoung")
                        say("")
                        say("Tell Ariyoung about the death of her husband.")
                        say("")
                end

                when __TARGET__.target.click or
                        20021.chat."The fate of your husband" begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What... what are you saying?!")
                        say("")
                        say("He... he was killed by the Black Wind Gang? Oh... no...")
                        say("he is dead... I do not know what to do without him *cry*")
                        say("")
                        wait()
                        say_title("Ariyoung")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Would you please bring me the body of my husband? Please,")
                        say("then I can say at least Good Bye.")
                        say("")
                        say("If that is not possible, anything from him will do it...")
                        say("")
                        say("The Goo-Pae`s of the Black Wind Gang surely have something.")
			say("Please look for it.")
                        say("")
                        local s=select("Yes, I help you.","Sorry, I have no time.")
                        if 2==s then
                                say("")
                                say("You want to cancel this Quest?")
                                say("")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Ariyoung")
                                        say("")
                                        say("If you reconsider it, please return.")
                                        say("Please...")
                                        say("")
                                        return
                                end
                                say_title("Ariyoung")
                                say("")
				----"12345678901234567890123456789012345678901234567890"|
				say("")
                                say("You did not find anything? Anyway, thank you.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung")
                        say("")
                        say("I can not say how grateful I am.")
                        say("I will pray for you.")
                        say("")
                        set_state(hunt)
                end
        end

        state hunt begin
                when letter begin
                        send_letter("Kill Goo-Pae")
                end
                when info or  button begin
                        say_title("Kill Goo-Pae")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Kill some Goo-Pae to find a keepsake of Ariyoung's husband.")
                        say("")
                end
                when 20021.chat."The fate of Ariyoung's husband" begin
                        say_title("Ariyoung")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("How did it go? Could you gather anything from my husband?")
                        say("")
                        say("He was everything for me. I do not know, but...")
			say("")
                        local s=select("Yes, I will find something.","Sorry, I have no time.")
                        if 2==s then
                                say_title("Ariyoung")
                                say("")
                                say("You want to cancel this Quest?")
                                say("")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Ariyoung")
                                        say("")
					----"123456789012345678901234567890123456789012345678901234567890"|
                                        say("Goo-Pae of the Black Wind Gang is strong.")
                                        say("Relax a bit.")
                                        say("Thank you for your help.")
                                        say("")
                                        return
                                end
                                say_title("Ariyoung")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Thank God another hero will bring me back a remembrance")
                                say("of my husband. Thanks all the same.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Ariyoung")
                        say("")
                        say("Oh you are so kind!")
                        say("Please, bring me anything from my husband.")
                        say("")
                end

                when 493.kill begin
                        local s = number(1, 100)
                        if s <= 20 and pc.count_item("30101")==0 then
                                pc.give_item2("30101")
                                set_state(discover_ring)
                        end
                end

        end
        state discover_ring begin
                when letter begin
                        send_letter("You found Ariyoung's Wedding Ring")

                        local v=find_npc_by_vnum(20021)
                        if 0!=v then
                                target.vid("__TARGET__",v,"Go to Ariyoung")

                        end
                end
                when info or button begin
                        say_title("You found a Wedding Ring.")
                        say("")
                        say_item_vnum(30101)
                        say("Deliver the Wedding Ring to Ariyoung.")
                        say("")
                end

                when __TARGET__.target.click or
                        20021.chat."Give Ariyoung the Wedding Ring" with pc.count_item("30101")>= 1  begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("That.. ring.. it is my Wedding Ring! Now, my husband shall")
                        say("rest in peace.")
                        say("")
                        say("I will bury this ring together with a letter from me...")
                        say("From now on I will live alone. At least I have my Wedding")
                        say("Ring back. That is a nice feeling.")
                        say("")
                        say("I can not thank you enough.")
                        say("")
                        pc.remove_item("30101")
                        set_state(reward)
                        
                end
        end
        state reward begin
                when letter begin
                        send_letter("Quest finished!")
                end
                when info or button begin
                        say_title("Quest finished!")
                        say("")
                        say("Your deeds for Ariyoung are spreading around!")
                        say("")
                        say("Many people praise your help.")
                        say("")
                        say_reward("You received 325.000 Experience.")
                        pc.give_exp2(325000)

                        say_reward("You received 50.000 Yang")
                        pc.change_money(50000)
                        say_reward("You received a Rusty Blade.")
                        pc.give_item2(30030)
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
