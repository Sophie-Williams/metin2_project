quest subquest_10 begin
        state start begin
                when login or levelup with pc.level >= 18 and pc.level <= 23 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9003)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Find the Hairpin.")
                        end
                end


                when __TARGET__.target.click or
                        9003.chat."Find the Hairpin" with pc.level >= 18 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("General Store:")
                        say("")
                        say("Please listen to me! I have a big problem.")
                        say("")
                        say("I left the shop for a short time. While I was away, someone")
                        say("stole my favourite Hairpin.")
                        say("")
                        say_item_vnum("30017")
                        say("")
                        wait()
                        say_title("General Store:")
                        say("")
                        say("My father gave me this wonderful Hairpin for my birthday.")
                        say("That is why it is very important to me!")
                        say("")
                        say("I can never leave my shop again! Otherwise something else")
                        say("will be stolen.")
                        say("")
                        say("Could you find it for me? I suspect the Blacksmith,")
                        say("because he once said he liked it.")
                        say("")
                          local s=select("I will search for it.","I can not help.")
                        if 2==s then
                                say("End Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("General Store:")
                                        say("")
                                        say("See you next time.")
                                        say("Good Bye.")
                                        return
                                end
                                say_title("General Store:")
                                say("")
                                say("Where is my Hairpin?")
                                say("Goodbye...")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("General Store:")
                        say("")
                        say("You will find it for me?")
                        say("")
                        say("Oh thank you very much!")
                        say("")
                        set_state(go_to_blacksmith)

                end
        end

        state go_to_blacksmith begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Find the Hairpin.")
                        q.set_title("Find the Hairpin.")
                        q.start()

                        local v = find_npc_by_vnum(20016)

                        if v == 0 then
                        else
                                target.vid("__TARGET__", v, "Go to the Blacksmith.")
                        end
                end

                when info or button begin
                        say_title("Go to the Blacksmith.")
                        say("")
                        say("Ask the Blacksmith where the Hairpin is.")
                        say("")
                        say_item_vnum("30017")
                        say("")
                end

                when __TARGET__.target.click or
                        20016.chat."The stolen Hairpin" begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Blacksmith:")
                        say("")
                        say("What? She thinks I stole her Hairpin?")
                        say("")
                        say("That... that is ridiculous! What does she think of me?")
                        say("I was working in my Shop!")
                        say("")
                        say("Hmm, maybe I should not tell you, but the Weapon Shop Dealer")
                        say("was lurking around the General Store a while ago!")
                        say("")

                        set_state(ask_to_weaponshop)
                end
        end

        state ask_to_weaponshop begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("The stolen Hairpin.")
                        q.set_title("The stolen Hairpin.")
                        q.start()

                        local v= find_npc_by_vnum(9001)
                        if v == 0 then
                        else
                                target.vid("__TARGET__", v, "Go to the Weapon Shop Dealer.")
                        end
                end
                ----"12345678901234567890123456789012345678901234567890"|
                when info or button begin
                        say_title("Go to the Weapon Shop Dealer.")
                        say("")
                        say("Ask the Weapons Shop Dealer about the Hairpin.")
                        say("")
                        say_item_vnum("30017")
                        say("")
                end

                when __TARGET__.target.click or
                        9001.chat."The stolen Hairpin." begin
                        target.delete("__TARGET__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Weapon Shop Dealer:")
                        say("")
                        say("What? You think I stole the Hairpin?")
                        say("")
                        say("No, never, I didn't do it! Really I am not guilty!")
                        say("")
                        say("Well... I was there to visit the General Store, but she was")
                        say("not there! Instead of her, there was a White Oath Archer.")
                        say("")
                        say("The moment she saw me, she ran away. Maybe she has stolen")
                        say("that Hairpin.")
                        say("")

                        set_state(hunt_for_shoes)
                end
        end

        state hunt_for_shoes begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("The stolen Hairpin")
                        q.set_title("The stolen Hairpin")
                        q.start()
                end

                when info or button begin
                	if pc.count_item("30017")==0 then
				say_title("The stolen Hairpin")
				say("")
				say("Find the Hairpin stolen by the White Oath Archer!")
				say("")
				say_item_vnum("30017")
				say("")
			else
				say_title("The stolen Hairpin")
				say("")
				say("Bring the Hairpin back to the General Store Keeper.")
				say("")
			end
                end

                when 302.kill begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30017")==0  then
                                pc.give_item2("30017", 1)
                                send_letter("You found the Hairpin!")
                                local v=find_npc_by_vnum(9003)
                                if 0== v then
                                else
                                        target.vid("__TARGET__",v,"Return to the General Store.")
                                end
                        end

                end

                when __TARGET__target.click or
                        9003.chat."The Hairpin." begin
                        target.delete("__TARGET__")
                        if pc.count_item("30017") >= 1 then
                                say_title("General Store:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Oh, thank you very much. I am so happy, Finally I have my")
                                say("Hairpin back!")
                                say("")
                                say("You have helped me so often! How can I ever show my")
                                say("appreciation?")
                                say("")
                                say("I have a Riding Ticket. It is just something small, but I")
                                say("do not need it anymore, as I will not leave the shop again.")
                                say("")
                                say("Take it as a sign of my appreciation.")
                                say("Thank you once more.")
                                say("")
                                wait()
                                say_title("Reward:")
                                say("")
                                say_reward("You received 70.000 Experience Points.")
                                say_reward("You received 15.000 Yang.")
                                say_reward("You received a Horse Riding Ticket.")
                                say("")
                                pc.remove_item("30017", 1)
                                pc.give_exp2(70000)
                                pc.change_money(15000)
                                pc.give_item2("50083", 1)
                                clear_letter()
                                set_state(__COMPLETE__)
                        else
                                say_title("General Store:")
                                say("")
                                say("You have not found my Hairpin yet?")
                                say("I hope you will find it soon!")
                                say("")
                                say_item_vnum("30017")
                                say("")
                                local s=select("Continue","Cancel")
                                if 2==s then
                                        say("Really cancel?")
                                        say("")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("General Store:")
                                                say("")
                                                say("Yeah, they are not easy... ")
                                                say("May be you can try it again later?")
                                                say("")
                                                set_state(information)
                                                return
                                        end
                                        say_title("General Store:")
                                        say("")
                                        say("Where is my Hairpin?")
                                        say("That did not work? Ok...")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("General Store:")
                                say("")
                                say("Thank you for your troubles.")
                                say("")
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
