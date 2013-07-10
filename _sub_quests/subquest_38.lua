----------------------------------------------------
-- SUB QUEST
-- LV 45
-- Hunter��s Treasure
----------------------------------------------------

quest subquest_38 begin
        state start begin
                when login or levelup with pc.level >= 45 and pc.level <= 47 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20019)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Treasure of the Hunter")
                        end
                end


                when __TARGET__.target.click or
                        20019.chat."Treasure of the Hunter" with pc.level >= 16 begin
                        target.delete("__TARGET__")

                        say_title("Yang-Shin:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Hey, you listen for a second?")
                        say("As you can see, I am a Hunter, my")
                        say("family hunts for generations.")
                        say("We are all Hunters, a family with much honour.")
                        say("But I made a big mistake that will ")
                        say("dishonour me in front of my family...")
                        say("")
                        wait()
                        say_title("Yang-Shin:")
                        say("")
                        say("It is about a Golden Bow which got")
                        say("stolen a long time ago by apes when I")
                        say("did not take care. Back then in the Ape Dungeon")
                        say("when I hunted there, they showed their")
                        say("evilness and stole it.")
                        say("")
                        wait()
                        say_title("Yang-Shin:")
                        say("")
                        say("I have never been deep into the Joklor Dungeon, ")
                        say("so I don't know anything there.")
                        say("I need your help...")
                        say("I heard from many inhabitants")
                        say("that you have lots of talent.")
                        say("That's why I ask you for this favour.")
                        say("I can't step to my ancestors without")
                        say("the Golden Bow...")
                        say("")

                        local s=select("Accept","Cancel")
                        if 2==s then
                                say("You want to cancel the Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Yang-Shin :")
                                        say("")
                                        say("Oh I have to get it back soon..")
                                        say("Please come back when you have time.")
                                        say("Bye.")
                                        say("")
                                        return
                                end
                                say_title("Yang-Shin:")
                                say("")
                                say("Well..")
                                say("Be careful, the Joklor Dungeon is")
                                say("dangerous.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yang-Shin:")
                        say("")
                        say("It can be found easily, it is a")
                        say("beautiful Golden Bow.")
                        say("I will surely reward you.")
                        say("")
                        set_state(hunt_monkey)

                end
        end

        state hunt_monkey begin
                when letter begin
                        send_letter("Treasure of the Hunter")
		end
                when info or button begin
                        say_title("The Search for the Golden Bow")
                        say("")
                        say("The Golden Bow, heirloom of the family of the Hunter,")
                        say("was stolen.")
                        say("Maybe the Apes in the Joklor Dungeon are")
                        say("the thieves. Off to the Joklor Dungeon to")
                        say("get back the Golden Bow.")
                        say("Carry the Golden Bow to the Hunter as soon")
                        say("as you found it.")
                        say("")
                end

                when 5121.kill or 5122.kill or 5123.kill or 5124.kill or 5125.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30136")== 0  then
                                pc.give_item2("30136", 1)
				send_letter("You have found the Golden Bow!")
				local v=find_npc_by_vnum(20019)
				if 0== v then
				else
					target.vid("__TARGET__",v,"Go back to the Hunter.")
				end

                        end
                end

                when 20019.chat."Here is your Golden Bow." begin
                        target.delete("__TARGET__")

                        if pc.count_item("30136") >= 1 then
                                say_title("Yang-Shin:")
                                say("")
                                say("What? Yay! That's it!")
                                say("The Golden Bow! Ha!")
                                say("My honour for the ancestors is rescued.")
                                say("Wow. I suffered for so long that")
                                say("I have lost it...")
                                say("I am really grateful for your help.")
                                say("It is a honour to give you this.")
                                say("It might look small, but it")
                                say("comes from the heart, please take it.")
                                say("Thanks to you I can live on in peace.")
                                say("")
                                pc.remove_item("30136", 1)

                                say_reward("You received 1.900.000 Experience Points..")
                                pc.give_exp2(1900000)

                                say_reward("You received 10 Bravery Capes.")
                                pc.give_item2(70038,10)

                                say_reward("You received 35.000 Yang.")
                                pc.change_money(35000)
                                set_state(COMPLETE)
                                clear_letter()
                                return
                        else
                                say_title("Yang-Shin:")
                                say("")
                                say("The Search for the Golden Bow!")
                                local s=select("Yes, try again","I give up.")
                                if 2==s then
                                say("You want to cancel the Quest?")
                                local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Yang-Shin:")
                                                say("")
                                                say("So be it.")
                                                say("Attention, the Apes are really dangerous.")
                                                say("")
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                say_title("Yang-Shin:")
                                say("")
                                say("You try again?")
                                say("You can do it with your skills.")
                                say("")
                                end
                        end
                end
        end

        state __GIVEUP__ begin
        end

        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
end
