----------------------------------------------------
-- SUB QUEST
-- LV  33
-- New Armor
----------------------------------------------------
quest subquest_31 begin
        state start begin
                when login or levelup or enter with pc.get_level() >=34  and pc.get_level() <= 36 begin
                        set_state( information )
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20016)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Go to the Blacksmith")
                        end
                end


                when __TARGET__.target.click or
                        20016.chat."The newest Invention" with pc.level >= 34 begin
                        target.delete("__TARGET__")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Blacksmith:")
                        say("")
                        say("Hey, you have some time?")
                        say("I was very grateful when you")
                        say("helped me make the new weapon.")
                        say("I want to get your help again.")
                        say("This")
                        say("time I want to make a new Armour.")
                        say("After I made a real good weapon it is clear")
                        say("I also need now a good Armour.")
                        say("")
                        wait()
                        say_title("Blacksmith:")
                        say("")
                        say("Of course I need again materials for it.")
                        say("Can you get them? Of course I will give")
                        say("you something for it, but first hard work, then reward.")
                        say("This time I need 100 Copper Ore, 100 Pieces of Pearls")
                        say("and 100 Ebony.")
                        say("Looking at your face... you already know how")
                        say("that goes. Then hurry!")
                        say("")
                        local s=select("Ok.","Cancel.")
                        if 2==s then
                        say_title("Blacksmith:")
                        say("")
                        say("You want to cancel this quest?")
                        say("")
                        local a=select("Yes","No")
                                if  2==a then
                                        say_title("Blacksmith:")
                                        say("")
                                        say("Why do you hesitate?")
                                        say("If you have changed your mind,")
                                        say("come back.")
                                        return
                                end
                                say_title("Blacksmith :")
                                say("")
                                say("Materials are not that hard to")
                                say("find.")
                                say("How can you reject my plead...")
                                say("So be it...Get out of here!")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Blacksmith:")
                        say("")
                        say("Really?")
                        say("You will help me?")
                        say("You are a great friend.")
                        say("You'll get a reward again.")
                        set_state(to_gain_material)
                end
        end

        state to_gain_material begin

                when letter begin
                        send_letter("The new Armour")

                        local copper =pc.count_item(50604)
                        local pearl=pc.count_item(50609)
                        local ebony=pc.count_item(50608)

                        if        copper>100  or  pearl>100 or  ebony>100 then

                                local v = find_npc_by_vnum(20016)

                                if v != 0 then
                                target.vid("__TARGET__", v, "Blacksmith:")
                                end
                                return
                        end

                end

                when info or button begin
                        local copper=pc.count_item(50604)
                        local pearl=pc.count_item(50609)
                        local ebony=pc.count_item(50608)

                        if        copper>=100  and   pearl>=100 and  ebony>=100 then
                                say_title("Materials for Armour available.")
                                say("")
                                say_reward("You have all materials the Blacksmith")
                                say_reward("needs to make the new Armour.")
                                say_reward("Carry them to the Blacksmith.")
                                say("")
                                return
                        end

                        say_title("Search all Materials")
                        say("")
                        say_reward("The Blacksmith asked you to find")
                        say_reward("Materials.")
                        say_reward("You need 100 Copper Ored, 100 Pieces of Pearls")
                        say_reward("and 100 Ebony.")
                        say_reward("You can gain the Materials with a Pick Axe and the")
                        say_reward("Skill Mining on the Deposit Hills")
                        say_reward("on the whole map.")
                        say_reward("Look carefully. If you can't find any hills, you")
                        say_reward("can buy or trade these Materials with")
                        say_reward("other players.")
                        say("")
                end

                when 20016.chat."New materials for an Armour"  begin
                        target.delete("__TARGET__")

                        local copper =pc.count_item(50604)
                        local pearl=pc.count_item(50609)
                        local ebony=pc.count_item(50608)



                        if        copper<100  or  pearl<100 or  ebony<100 then

                                say_title("Blacksmith:")
                                say("")
                                say("There are Materials missing.")
                                say("")

                                local s=select("Search further","Cancel")
                                if 2==s then
                                  say("Do you want to cancel this Quest?")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Blacksmith")
                                                say("")
                                                say("Is it too hard?")
                                                say("Of course it isn't only luck ")
                                                say("but hard work.")
                                                say("Why don't you try late")
                                                say("again?")
                                                say("")
                                                return
                                        end
                                        say_title("Blacksmith:")
                                        say("")
                                          say("My Armour plans fade...")
                                          say("It would have been an idea")
                                        say("crafting a great armour.")
                                          say("Oh shame it is away.")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Blacksmith:")
                                say("")
                                say("Be strong!")
                                say("You'll get them!")
                                say("I will treat you in favour.")
                                say("")
                end
                if copper>=100  and pearl>=100 and ebony>=100 then
                        say("Blacksmith:")
                        say("")
                        say("Good job!")
                        say("You are good in searching for materials.")
                        say("Here is a present for you.")
                        say_reward("You received 300.000 Experience Points.")
                        pc.give_exp2(300000)


                        pc.remove_item(50604,100)
                        pc.remove_item(50609,100)
                        pc.remove_item(50608,100)

                        say_reward("You received 50.000 Yang.")
                        pc.change_money(50000)

                                if pc.job == 0 then
                                        pc.give_item2(11235, 1)
                                        say_reward("You received Lion Plate Armour +5")
                                elseif pc.job == 1 then
                                        pc.give_item2(11435, 1)
                                        say_reward("You received Red Ant Suit +5")
                                elseif pc.job == 2 then
                                        pc.give_item2(11635, 1)
                                        say_reward("You received Ghost Plate Armour +5.")
                                elseif pc.job == 3 then
                                        pc.give_item2(11835, 1)
                                        say_reward("You received Amorous Dress +5.")
                                end


                        clear_letter()
                        set_state(__COMPLETE__)
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
