quest subquest_6 begin
        state start begin
                when login or levelup with pc.level >= 11 and pc.level <= 16 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9002)
                        if v != 0 then
                                target.vid("__TARGET__", v, "The Ordering of Armour")
                        end
                end

                when __TARGET__.target.click or
                        9002.chat."The Ordering of Armour" with pc.level >= 11 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Armour Shop Dealer:")
                        say("")
                        say("Thank you for helping my daughter. Perhaps you can help me")
                        say("as well. I have to ask you for a favour.")
                        say("")
                        say("I asked the Blacksmith to produce armours, but haven't heard")
                        say("anything of it yet. Can you find out how far he is?")
                        say("")
                        local s=select("Yes, I will.","I have no time.")
                        if 2==s then
                                say("You really want to cancel?")
                                local a=select("Yes, I want","Better not")
                                if  2==a then
                                say_title("Armour Shop Dealer:")
                                say("")
                                say("You will do it?")
                                say("Come back after asking the Blacksmith.")
                                say("")
                                        return
                                end
                                say_title("Armour Shop Dealer:")
                                say("")
                                say("Away with you!")
                                say("")
                                say("The Blacksmith promised to produce it for me")
                                say("as fast as possible!")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Armour Shop Dealer:")
                        say("")
                        say("Thank you!")
                        say("")
                        say("Go to the Blacksmith and ask him how far he is.")
                        say("")
                        set_state(ask_blacksmith)
                end
        end
        state ask_blacksmith begin
                when info or button begin
                        say_title("The Ordering of Armour")
                        say("")
                        say("Go to the Blacksmith and ask him how far he is.")
                        say("")
                end

                when letter begin
                        local v = find_npc_by_vnum(20016)
                        if v != 0 then
                                target.vid("__TARGET__", v, "The Ordering of Armour")
                        end
                        send_letter("The Ordering of Armour")
                end

                when __TARGET__.target.click or
                        20016.chat."Order from the Armour Dealer" begin
                        target.delete("__TARGET__")
                        say_title("Blacksmith:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What now? Why do you disturb me? Ah, the Armour Dealer")
                        say("sent you? Really? The old man is really impatient.")
                        say("")
                        say("It is not that I do not want to do it. I simply do not have")
                        say("the needed materials. Could you get those for me?")
                        say("")
                        say("To make the Armour I need Iron Ore, Leather and Coal.")
                        say("")
                        say("You can get Iron Ore from Uriel, Leather from Octavio")
                        say("and Coal from Yonah.")
                        say("")

                        local s=select("I'll do it","No, not now")
                        if 2==s then
                                say("Are you sure you want to cancel the Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Blacksmith:")
                                        say("")
                                        say("Oh, do you have the materials with you?")
                                        say("")
                                        say("Seems not, come back later.")
                                        say("")
                                        return
                                end
                                say_title("Blacksmith:")
                                say("")
                                say("Do you have all goods?")
                                say("")
                                say("No? Then I will have to get all materials myself.")
                                say("See you someday.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Blacksmith:")
                        say("")
                        say("Then off you go, now I can work undisturbed again!")
                        say("")
                        set_state(to_get_material)
                end

        end
        state to_get_material begin
                when letter begin
                        send_letter("Materials for Armour")
                end
                when button or info begin
                        say_title("The Ordering of Armour")
                        say("")
                        say("Let's get the materials for the Blacksmith:")
                        say("")
                        if pc.getqf("ironore_done") ==1 then
                        	say("Iron Ore - I already got it.")
                        else
                        	say("Iron Ore - I can get from Uriel.")
                        end
                        if pc.getqf("leather_done") ==1 then
                        	say("Leather - I already got it.")
                        else
                        	say("Leather - I can get from Octavio.")
                        end
                        if pc.getqf("coal_done") ==1 then
                        	say("Coal - I already got it.")
                        else
                        	say("Coal - I can get from Yonah.")
                        end
                        say("")
                end

                when letter begin
                        if pc.getqf("leather_done")!=1 then
                                local v=find_npc_by_vnum(20008)
                                if 0!=v then
                                        target.vid("__TARGET1__",v,"Go to Octavio.")
                                end
                        end

                        if pc.getqf("ironore_done")!=1 then
                                local v=find_npc_by_vnum(20011)
                                if 0!=v then
                                        target.vid("__TARGET2__",v,"Go to Uriel.")
                                end
                        end

                        if pc.getqf("coal_done")!=1 then
                                local v=find_npc_by_vnum(20005)
                                if 0!=v then
                                        target.vid("__TARGET3__",v,"Go to Yonah.")
                                end
                        end
                end

                when 20011.chat."I need Iron Ore" with pc.getf("subquest_6","ironore_done") == 0 begin
                        target.delete("__TARGET2__")
                        if pc.count_item(30132) >= 1 then
                                pc.setqf("ironore_done", 1)
                                pc.remove_item("30132", 1)

                                say_title("Uriel:")
                                say("")
                                say("Thanks to you I can continue my work.")
                                say("")
                                say("Here, have some Iron Ore. Use it well.")
                                say("")
                                if  pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then
                                        set_state(back_to_blacksmith)
                                end
                                return
                        end
                        say_title("Uriel:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You need Iron Ore? I can give you some, certainly. Alas, I")
                        say("lost a book recently, when I was hunted by a group of")
                        say(mob_name(171)..". I think they stole it!")
                        say("")
                        say("Bring my Sage Book back, and then you will get Iron Ore.")
                        say("")
                        say_item_vnum("30132")
                        say("")
                        pc.setqf("for_iron",1)

                end
                when 20011.chat."I need Iron Ore" with pc.getf("subquest_6","ironore_done")==1 begin
                                target.delete("__TARGET2__")
                                say_title("Uriel:")
                                say("")
                                say("Hey, I also need some Iron Ore for myself.")
                                say("")
                                say("Did you forget I gave you some already?")
                                say("")
                end
                when 20008.chat."I need Leather" with pc.getf("subquest_6","leather_done") == 0 begin
                        target.delete("__TARGET1__")
                        if pc.count_item(60001) >= 1 then
                                pc.setqf("leather_done", 1)
                                pc.remove_item("60001", 1)

                                say_title("Octavio:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Thanks to your help, now I can cook this meal.")
                                say("")
                                say("Here, take the Leather, you deserved it.")
                                say("")
                                if pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then

                                        set_state(back_to_blacksmith)
                                end
                                return
                        end
                        say_title("Octavio:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I can give you Leather, but nothing in this world is for")
                        say("free. I will give you the Leather when you get me a Gall.")
                        say("")
                        say("You can obtain Gall from Bears.")
                        say("")
                        say_item_vnum("60001")
                        say("")
                        pc.setqf("for_leather",1)

                end
                when 20008.chat."I need Leather" with pc.getf("subquest_06","leather_done")==1 begin
                                target.delete("__TARGET1__")
                                say_title("Octavio:")
                                say("")
                                say("I already gave you Leather. Did you lose it?")
                                say("I do not have any more!")
                                say("")
                end


                when 20005.chat."I need some Coal" with pc.getf("subquest_6","coal_done") == 0 begin
                        target.delete("__TARGET3__")
                        if pc.count_item(30044) >= 1 then
                                pc.setqf("coal_done", 1)
                                

                                say_title("Yonah:")
				say("")
                                say("Thank you. You did better than expected.")
                                say("")
                                say("I will give you some Coal.")
                                say("")
                                pc.remove_item(30044, 1)
                                if  pc.getqf("ironore_done") == 1 and pc.getqf("leather_done") == 1 and pc.getqf("coal_done") == 1 then
                                        set_state(back_to_blacksmith)

                                end
                                return
                        end
                        say_title("Yonah:")
			say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("How do you do? You look familiar...")
                        say("")
                        say("You are here to get some coal? Oh, I have a lot of coal,")
                        say("but it is not free. If you could do something for me,")
                        say("I'll give you some coal.")
                        say("")
                        wait()

                        say_title("Yonah:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I don't have much clay left, please get me some.")
                        say("")
                        say("You can get clay by hunting Red Wild Boars. The Red")
                        say("Wild Boars eat Clay, believe it or not!")
                        say("")
                        say("Thanks in advance.")
                        say("")
                        say_item_vnum("30044")
                        pc.setqf("for_coal",1)
                end
                when 20005.chat."I need some Coal" with pc.getf("subquest_6","coal_done")==1 begin
                                target.delete("__TARGET3__")
                                say_title("Yonah:")
                                say("")
                                say("What?")
                                say("")
                                say("I already gave it to you!")
                                say("")
                end

                when 171.kill begin
                        local s = number(1, 70)
                        if s <= 5 and pc.count_item("30132")==0  then
                                pc.give_item2("30132", 1)
                        end
                end


                when 110.kill  begin
                        local s = number(1, 70)
                        if s <= 5 and pc.count_item("60001")==0  then
                                pc.give_item2("60001", 1)
                        end
                end

                when 109.kill  begin
                        local s = number(1, 70)
                        if s <= 5 and pc.count_item("30044")==0  then
                                pc.give_item2("30044", 1)
                        end
                end

                when 20016.chat."You have all materials." begin
                        target.delete("__TARGET__")
                        if pc.getqf("ironore_done") != 1 then
                                say_title("Blacksmith:")
                                say("")
                                say("Seems you have no Iron Ore. Go to Uriel.")
                                say("")
                                return
                        end

                        if pc.getqf("leather_done") != 1 then
                                say_title("Blacksmith:")
                                say("")
                                say("Seems you have no Leather. Go to Octavio.")
                                say("")
                                return
                        end
                        if pc.getqf("coal_done") != 1 then
                                say_title("Blacksmith:")
                                say("")
                                say("Seems you have no Coal. Get it from Yonah.")
                                say("")
                                return
                        end
                end
        end
        state back_to_blacksmith begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("I have all goods.")
                        q.set_title("Go to the Blacksmith.")
                        q.start()

                        local v=find_npc_by_vnum(20016)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Go to the Blacksmith")
                        end
                end
                when info or button begin
                        say_title("The ordered Armour")
			say("")
			say("I have all goods. Let's go to the Blacksmith.")
                        say("")
                end

                when __TARGET__.target.click or
                        20016.chat."I have your goods." with pc.getf("subquest_6","ironore_done") == 1 and pc.getf("subquest_6","leather_done") == 1 and pc.getf("subquest_6","coal_done") == 1 begin
                                say_title("Blacksmith:")
				say("")
				----"123456789012345678901234567890123456789012345678901234567890"|
                                say("You already got all the materials? I am impressed!")
                                say("")
                                say("Thank you, now I can finish that order.")
                                say("")
                                say("The Armour Dealer will be happy, tell him the good news!")
                                say("")
                                set_state(resource_complete)
                end
        end
        state resource_complete begin
                when info or button begin
                        say_title("The Ordering of Armour")
			say("")
                        say("Inform the Armour Shop Dealer that his order can")
                        say("be completed now.")
                        say("")
                end

                when letter begin
                        send_letter("The Ordering of Armour.")

                    local v=find_npc_by_vnum(9002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Return to the Armour Shop Dealer")
                        end
                end


                when __TARGET__.target.click or
                        9002.chat."The ordering of the Armour" begin
                        target.delete("__TARGET__")
                        say_title("Armor Shop Dealer:")
                        say("")
                        say("Oh, the Blacksmith will soon deliver the goods?")
                        say("")
                        say("Ah, thank you. Take this as a reward.")
                        say("")
                        say_title("Reward:")
                        say("")
                        say_reward("You received 11.000 Experience Points." )
                        say_reward("You received 15.000 Yang.")
			if pc.job == 0 then
                                reward = 11215
                                say_reward("You received an Iron Plate Amour +5.")
                        elseif pc.job == 1 then
                                reward = 11415
                                say_reward("You received an Ivory Suit +5.")
                        elseif pc.job == 2 then
                                reward = 11615
                                say_reward("You received a Wizard Plate Amour +5.")
                        else
                                reward = 11815
                                say_reward("You received a Turquoise Dress +5.")
                        end
                        say("")
                        pc.give_item2(reward, 1)
                        pc.give_exp2(11000)
                        pc.change_money(15000)
                        set_quest_state("levelup","run")
	                pc.setqf("ironore_done",0)
                        pc.setqf("leather_done" ,0)
                        pc.setqf("coal_done",0)
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
