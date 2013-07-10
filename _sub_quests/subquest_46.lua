----------------------------------------------------
-- SUB QUEST
-- LV  53
-- The Secret of the Celadon Porcelain 2
----------------------------------------------------

quest subquest_46 begin
        state start begin
                when login  or levelup with pc.level >= 53 and pc.level <= 56 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20005)

                        if v != 0 then
                                target.vid("__TARGET__", v, "The Secret of the Celadon Porcelain")
                        end
                end



                when __TARGET__.target.click or
                        20005.chat."The Secret of the Celadon Porcelain" begin
                        target.delete("__TARGET__")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Yonah:")
                        say("")
                        say("Hey Adventurer, I have a problem again...")
                        say("Although I know the techniques to manufacture")
                        say("celadon porcelain, I simply can't get")
                        say("anything to work.")
                        say("I went straight through with the receipt, but")
                        say("more than 100 tries went wrong, everything")
                        say("broke. I then realized that")
                        say("special materials are needed")
                        say("to really make the best ")
                        say("Celadon Porcelain.")
                        say("")
                        wait()
                        say_title("Yonah:")
                        say("")
                        say("I need a special kind of Plasticine,")
                        say("Crystal Ore for the stability and Monkey��s blood")
                        say("for the special colour of the porcelain.")
                        say("Only this kind of Porcelain can be sold")
                        say("easily and I really need the money.")
                        say("")
                        wait()
                        say_title("Yonah:")
                        say("")
                        say("Could you get me those materials?")
                        say("I will reward you.")
                        say("You have to defeat Desert Outlaws to get ")
                        say("the special Plasticine in the Sahara Desert.")
                        say("The Crystal Ore you'll get from Crystal Mines,")
                        say("and for the Monkey's Blood you have to kill Apes in the")
                        say("Joklor Dungeon and catch their blood..")
                        say("Good luck, that won't be easy.")
                        say("")

                        local s=select("Accept.","Decline.")
                        if 2==s then
                                say("You want to end this Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        ----"12345678901234567890123456789012345678901234567890"|
                                        say_title("Yonah:")
                                        say("")
                                        say("If you are too busy now,")
                                        say("come back later.")
                                        say("")
                                        return
                                end
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Yonah:")
                                say("")
                                say("You really give up?")
                                say("Then I have to go myself...")
                                say("I really need this porcelain.")
                                say("Goodbye and good luck.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        ----"12345678901234567890123456789012345678901234567890"|
                        say_title("Yonah:")
                        say("")
                        say("Good luck in your search.")
                        say("Only when I have the correct materials,")
                        say("I can manufacture the correct porcelain.")
                        say("My customers await me impatiently!!!")
                        say("")
                        set_state(to_get_material)
                end

        end


        state to_get_material begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Celadon Porcelain")
                        q.set_title("Celadon Porcelain")
                        q.start()

                        if pc.count_item("50611")>0 and pc.count_item("30138")>0 and pc.count_item("30137")>0 then
                                local v = find_npc_by_vnum(20005)

                                if v != 0 then
                                        target.vid("__TARGET__", v, "The Secret of the Celadon Porcelain")
                                end
                        end


                end

                when button or info begin
                        if pc.count_item("50611") >= 1  and  pc.count_item("30137") >= 1 and pc.count_item("30138") >= 1 then
                                say_title("The Secret of the Celadon Porcelain")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("")
                                say("You have all Materials Yonah needs!!")
                                say("Bring them to Yonah!")
                                say("")
                                return
                        end

                        say_title("The Secret of the Celadon Porcelain")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("")
                        say("That Yonah can manufacture the Celadon Porcelain")
                        say("he needs those materials.")
                        say("")
                        say("Plasticine from the Desert Outlaw in the Sahara Desert,")
                        say("Crystal Ore from a Crystal Mine and Monkey's Blood from")
                        say("the Strong Stone Ape 'or Strong Gold Ape in the")
                        say("Joklor Dungeon.")
                        say("Get all those Materials and carry them to Yonah!")
                        say("")


                end



                when 2108.kill  begin 
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30138")==0  then
                                pc.give_item2("30138", 1)

                                if pc.count_item("50611")>0 and pc.count_item("30137")>0 then
                                        local v = find_npc_by_vnum(20005)
                                        if v != 0 then
                                                target.vid("__TARGET__", v, "The Secret of the Celadon Porcelain")
                                        end
                                end
                        end

                end


                when 5125.kill or 5126.kill  begin 
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30137")==0  then
                                pc.give_item2("30137", 1)

                                if pc.count_item("50611")>0 and pc.count_item("30138")>0 then
                                        local v = find_npc_by_vnum(20005)

                                        if v != 0 then
                                                target.vid("__TARGET__", v, "The Secret of the Celadon Porcelain")
                                        end
                                end

                        end
                end


                when __TARGET__.target.click or
                        20005.chat."All Materials are there" with  pc.count_item("50611") >= 1  and  pc.count_item("30137") >= 1 and pc.count_item("30138") >= 1 begin
                                target.delete("__TARGET__")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Yonah:")
                                say("")
                                say("Finally it is made! You have helped me so much.")
                                say("That's the day I waited for so long.")
                                say("I know the techniques now and I")
                                say("also have the right materials.")
                                say("Now I will make the best porcelain in the world!")
                                say("Just imagine how the celadon colour will")
                                say("make the porcelain glistening.")
                                say("Everyone will have to look at it.")
                                say("Such a bless for my income!")
                                say("I will immediately begin to manufacture,")
                                say("you can admire the first piece then.")
                                say("")

                                pc.remove_item("50611",1)
                                pc.remove_item("30137",1)
                                pc.remove_item("30138",1)

                                say_reward("You received 3.000.000 Experience Points.")
                                pc.give_exp2(3000000)
                                set_quest_state("levelup","run")

                                say_reward("You received 30.000 Yang.")
                                pc.change_money(30000)

				say_reward("You received 5 Diamond Buddah Scroll.")
				pc.give_item2(71113, 5)

                                clear_letter()
                                set_state(__THEEND__)



        end
end
        state __GIVEUP__ begin
        end
        state __THEEND__ begin
                when enter begin
                end
        end
end
