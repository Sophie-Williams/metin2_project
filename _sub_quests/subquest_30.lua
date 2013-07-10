----------------------------------------------------
-- SUB QUEST
-- LV  33
-- New Weapon
----------------------------------------------------

quest subquest_30 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=33  and pc.get_level() <= 35 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20016)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Go to the Blacksmith.")
                        end
                end


                when __TARGET__.target.click or
                        20016.chat."Development of a new Weapon!" with pc.level >= 33 begin
                        target.delete("__TARGET__")
                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Hey you, yes I mean you! Hehehe!")
                        say("")
                        say("You are now not a beginner anymore! And that's thanks to")
                        say("the complicated tasks I asked you!")
                        say("")
                        say("HAHAHA. All those troubles you went through are only for")
                        say("your good. So, now I ask you for a real favour.")
                        say("")
                        wait()
                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I want to make a new weapon, but the materials are hard")
                        say("to get. Would you try to get me those materials?")
                        say("")
                        say("I am no good at that. After I have finished the new")
                        say("weapons, I will give one to you.")
                        say("")
                        wait()
                        say_title("Blacksmith :")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("To make these new weapons, I will need 100 Gold Ores,")
                        say("100 Silver Ores and 100 Ebony Ores.")
                        say("")
                        say("You might think that's a lot at once, but when mining you")
                        say("get many ores at once. That way you should get them with")
                        say("ease.")
                        say("")
                        say("If that's too hard for you, you can always try to trade.")
                        say("Either way, good luck to you!")
                        say("")
                        local s=select("Accept.","Reject.")
                        if 2==s then
                                say_title("Blacksmith:")
                                say("")
                                say("You really want to cancel the Quest?")
                                say("")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Blacksmith:")
                                        say("")
                                        say("No need to hurry!")
                                        say("")
                                        say("If you change your mind, come again.")
                                        say("")
                                        return
                                end
                                say_title("Blacksmith:")
                                say("")
                                say("My plans for the new weapon fade...")
                                say("It was such a brilliant idea..")
                                say("Ah... a shame..")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Blacksmith:")
                        say("")
                        say("Oh! You'll do it?")
                        say("")
                        say("You are a thankful friend.")
                        say("")
                        set_state(to_gain_material)
                end
        end

        state to_gain_material begin

                when letter begin
                        send_letter("Blacksmith's new weapon")

                        local gold=pc.count_item(50606)
                        local silver=pc.count_item(50605)
                        local ebony=pc.count_item(50608)

                        if        gold>=100  and silver>=100 and ebony>=100 then
                                local v = find_npc_by_vnum(20016)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "Blacksmith")
                                end
                                return
                        end

                end

                when info or button begin
                        local gold=pc.count_item(50606)
                        local silver=pc.count_item(50605)
                        local ebony=pc.count_item(50608)

                        if        gold>=100  and silver>=100 and ebony>=100 then

                                say_title("You have all materials for the weapon!")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("I have the materials from which the Blacksmith can make")
                                say("the new weapon.")
                                say("")
                                say("I should bring them to him!")
                                say("")
                                return
                        end

                        say_title("Get the Materials!")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The Blacksmith needs some Materials to make a weapon.")
                        say("")
                        say("He requested you to get 100 Gold Ores, 100 Silver Ores")
                        say("and 100 Ebony Ores.")
                        say("")
                        say("Ores can be collected by mining Veins with a Pick Axe.")
                        say("Veins are found randomly around the map so look well!")
                        say("")
                        say("If you find mining too difficult, you can always buy them")
                        say("from traders.")
                        say("")
                end

                when __TARGET__.target.click or
                        20016.chat."New Weapon Materials." begin
                        target.delete("__TARGET__")

                        local gold = pc.count_item(50606)
                        local silver = pc.count_item(50605)
                        local ebony = pc.count_item(50608)


                        if        gold<100 or silver<100 or ebony<100 then

                                say_title("Blacksmith:")
                                say("")
                                say("That's not enough!!")
                                say("")

                                local s=select("Try again","Give up")
                                if 2==s then
                                  say_title("Blacksmith")
                                say("")
                                say("Do you really want to give up?")
                                say("")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Blacksmith")
                                                say("")
						----"123456789012345678901234567890123456789012345678901234567890"|
                                                say("It is hard to get Ore, but fortune comes with hard work.")
                                                say("")
                                                say("How about a little break and then try again?")
                                                return
                                        end
                                say_title("Blacksmith:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                  say("My plans for the new weapon fade...")
                                  say("")
                                  say("It was a breakthrough idea... A true shame.")
                                  say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Blacksmith:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Don't give up until you have everything!")
                                say("")
                                say("Good luck my friend.")
                                say("")
                                return
                end

                if        gold>=100  and silver>=100 and ebony>=100 then

                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You really have all materials? You were fast!")
                        say("")
                        say("Hahahaha! I feel that this will work.Hold on for a while,")
                        say("with these materials it won't take long.")
                        say("")
                        wait()
                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Hmm, it is perfect. My own knowledge often surprises me!")
		             
                        say("")
                        say("HAHAHA! Here is your weapon.")
                        say("")
                        say("It's brand new, so take good care of it.")
                        say("")
                        pc.remove_item(50606,100)
                        pc.remove_item(50605,100)
                        pc.remove_item(50608,100)

                        say_reward("You received 400.000 Experience Points")
                        pc.give_exp2(400000)

                        say_reward("You received 40.000 Yang.")
                        pc.change_money(40000)

			if pc.job == 0 then
				pc.give_item2(75,1)
				say_reward("You received Orchid Sword +5.")
			elseif pc.job == 1 then
				pc.give_item2(1035,1)
				say_reward("You received Lucky Knife +5.")
			elseif pc.job == 2 then
				pc.give_item2(75,1)
				say_reward("You received Orchid Sword +5.")
			elseif pc.job == 3 then
				pc.give_item2(5035, 1)
				say_reward("You received Jade Bell +5.")
			end
			say("")
                        clear_letter()
                        set_state(__COMPLETE__)
                end

                end
        end
state __GIVEUP__ begin
end
state __COMPLETE__ begin
        when enter begin
        end
end
end
