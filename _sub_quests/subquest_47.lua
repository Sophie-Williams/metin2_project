--------------------------------------------------
-- SUB QUEST
-- LV  50
-- Deciphering Cryptographs
----------------------------------------------------

quest subquest_47  begin
        state start begin
                when login or levelup with pc.level >= 50  and pc.level <= 52 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v=find_npc_by_vnum(20355)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Captain:")
                        end
                end

                when __TARGET__.target.click or
                        20355.chat."Decipher Cryptographs" with  pc.level >= 50 begin
                        target.delete("__TARGET__")

                        say_title("Captain:")
                        say("")
                        say("Stand to attention!")
                        say("Ah, it's you.")
                        say("I got information by Yu-Hwan.")
                        say("They are, as always, written in cryptographs. ")
                        say("It isn't easy to decipher them, but maybe we have")
                        say("to be fast. Last time you were rather")
                        say("fast in deciphering the cryptographs.")
                        say("Would you help me again?")
                        say("Please be that nice.")
                        say("")

                        local r=select("Accept", "Reject")
                        if 2==r then
                                say("You want to decline the Quest?")
                                local a=select("Yes" ,"No")
                                if 2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("But..last time you made it.")
                                        say("Why do you hesitate?")
                                        say("Reconsider it please.")
                                        say("")
                                        return
                                end
                                say_title("Captain:")
                                say("")
                                say("I know what you mean.")
                                say("You don't want to work with us,")
                                say("huh? Well,")
                                say("a true shame.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Captain:")
                        say("")
                        say("You are really my rescuer.")
                        say("I hoped you'd do it.")
                        say("Look, this is the cryptograph.")
                        say("")
                        wait()
                        ---                                                   l
                        say_title("Captain:")
                        say("")
                        say("EMIESNE")
                        say("SENE")
                        say("TA")
                        say("OHZNORI")

                        say("")
                        say("Do you understand it?")
                        wait()
                        say_title("Captain:")
                        say("")
                        say("So, how does it go?")
                        say("You get it?")
                        say("")
                        local s=select("That's it!","I don't know.","Show again.")
                        if 2==s then
                                say("Stopt the Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("Think about it at home,")
                                        say("then you can come back.")
                                        say("The content has to stay secret.")
                                        say("")
                                        return
                                end
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Captain:")
                                say("")
                                say("Oh dear! That difficult?")
                                say("Who should decypher that?")
                                say("You are my last hope.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        if 3==s then
                                say_title("Captain:")
                                say("")
                                say("Okay, I show it.")
                                say("")
                                say("EMIESNE")
                                say("SENE")
                                say("TA")
                                say("OHZNORI")
                                say("")
                                wait()
                        end
                        say_title("Captain:")
                        say("")
                        say("Hmm")
                        say("What does this mean?")
                        say("")
                        local answer=input()


                        if answer=="enemies seen at horizon" or answer=="ENEMIES SEEN AT HORIZON"  then
                                say_title("Captain:")
                                say("")
                                say("Hmm, okay, after your explanation")
                                say("I understand.")
                                say("You are one of our best soldiers.")
                                say("At the moment the numbers of spies are")
                                say("rising, that's why Yu-Hwan wants to")
                                say("do something.")
                                say("We have to arm!!!")
                                say("Order the soldiers to arm.")
                                say("Also arm yourself,")
                                say("there might be unexpected attacks.")
                                say("")
                                say_reward("You received 2.300.000 Experience Points.")
                                pc.give_exp2(2300000)


                                clear_letter()
                            set_state(__COMPLETE__)
                                return
                        elseif answer=="" then
                                        say_title("Captain:")
                                        say("")
                                        say("Why do you stay that calm?")
                                        say("Don't you know?")
                                        local a=select("I have to think","I don't know.")
                                        if 2==a then
                                                say_title("Captain:")
                                                say("")
                                                say("Oh dear! That difficult?")
                                                say("Who shall decipher then?")
                                                say("You are my last hope.")
                                                say("")
                                        --        set_state(__GIVEUP__)
                                                return
                                        end
                                        say("Hmm, what's that?")
                                        local answer=input()

                                        if answer=="enemies at the horizon" or answer=="ENEMIES SEEN AT HORIZON"  then
                                                say_title("Captain:")
                                                say("")
                                                say("Yes, after your explanation I")
                                                say("understand. You are one")
                                                say("of our best soldiers, at the moment")
                                                say("the numbers of spies in the country raises,")
                                                say("that's why Yu-Hwan")
                                                say("wants to do something.")
                                                say("We have to arm!")
                                                say("Order the soldiers to arm.")
                                                say("Also arm yourself,")
                                                say("there might be unexpected attacks.")
                                                say_reward("You received 2.300.000 Experience Points.")
                                                pc.give_exp2(2300000)


                                                clear_letter()
                                                set_state(__COMPLETE__)
                                                return
                                        else
                                                say_title("Captain:")
                                                say("")
                                                say("Hm." )
                                                say("You should try further.")
                                                say("")
                                                return
                                        end

                        else
                                say_title("Captain:")
                                say("")
                                say("Hm." )
                                say("That can't be it.")
                                say("That's illogical, think again.")
                                local a=select("I try again","Hmm, hmm, ah I don't know.")
                                if 2==a then
                                        say_title("Captain:")
                                        say("")
                                        say("Oh dear! That's difficult?")
                                        say("Who shall decipher it?")
                                        say("You are my last hope.")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say("Hmm, what's that?")
                                local answer=input()

                                if answer=="enemies seen at horizon" or answer=="ENEMIES SEEN AT HORIZON"  then
                                        say_title("Captain:")
                                        say("")
                                        say("Yea, sure, after your explanation")
                                        say("I understand.")
                                        say("You are one of our best soldiers, ")
                                        say("at the moment he number of spies in the country raises")
                                        say("and Yu-Hwan wants to do something")
                                        say("against it.")
                                        say("We have to arm!")
                                        say("Also arm yourself, there")
                                        say("might be unexpected attacks.")
                                        say_reward("You received 2.300.000 Experience Points.")
                                        pc.give_exp2(2300000)

                                        say_reward("You received 40.000 Yang.")
                                        pc.change_money(40000)

                                        clear_letter()
                                        set_state(__COMPLETE__)
                                        return
                                else
                                        say_title("Captain:")
                                        say("")
                                        say("Hm." )
                                        say("You will learn it.")
                                        say("")
                                        return
                                end

                        end
                        end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
        state __GIVEUP__ begin
        end
end
