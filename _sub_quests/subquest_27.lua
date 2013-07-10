------------------------------------------
--SUB QUEST
--LV 38
--Secret Temple Book for a bookworm
-----------------------------------------
quest subquest_27 begin
        state start begin
                when login or levelup with pc.level >= 38  and pc.level <= 40  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Soon")
                        end
                end

                when __TARGET__.target.click or
                 20023.chat."The Joy of Reading." begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You know the joy of writing? Words becoming sentences," )
                        say("becoming a book.")
                        say("")
                        say("Imagine the joy of writing this so other people can read." )
                        say("")
                        wait()

                        say_title("Mr.Soon:")
                        say("")
                        say("Harvest what you get, get happiness in what you do.")
                        say("What would my life be without books!")
                        say("")
                        say("That's life! But my wife doesn't understand.")
                        say("maybe you can convince her.")
                        say("")

                        set_state(to_wife)

                end
        end
        state to_wife begin
                when letter begin
                        local v=find_npc_by_vnum(20002)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Aranyo")
                        end

                        setskin(NOWINDOW)
                        makequestbutton("Go to Aranyo")
                        q.set_title("Go to Aranyo")
                        q.start()

                end

                when info or button begin

                        say_title("Go to Aranyo")
                        say("")
                        say("Go to Aranyo and ask her what she thinks")
                        say("about his husband's hobbies.")
                        say("")


                end

                when __TARGET__.target.click or
                        20002.chat."I die of frustration." begin
                        target.delete("__TARGET__")
                        say_title("Aranyo:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("What is this man doing again? I am so frustrated! He does")
                        say("not work for Yang! He just hides and reads books.")
                        say("")
                        say("He should be ashamed to call himself a father!")
                        say("")
                        wait()
                        say_title("Aranyo:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Does a book give us food or clothes? If I find")
                        say("him, may God help him!")
                        say("")
                        say("Ask the others in the village; they surely say the same.")
                        say("")
                        set_state(to_neighbor)
                end
        end

        state to_neighbor  begin
                when letter begin
                        local v=find_npc_by_vnum(9003)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "General Dealer")
                        end

                        setskin(NOWINDOW)
                        makequestbutton("Go to the General Dealer ")
                        q.set_title("Go to the General Dealer ")
                        q.start()

                end

                when info or button begin

                        say_title("Go to the General Dealer  ")
                        say("")
                        say("Go to the General Dealer and ask about Mr Soon.")
			say("")

                end


                when __TARGET__target.click or
                        9003.chat."What's up with Soon?"  begin
                        target.delete("__TARGET__")
                        say_title("General Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Yesterday he was here and asked for a book about the")
                        say("Secret Temple. He had no Yang so he simply looked.")
                        say("")
                        say("The Secret Temple...")
                        say("")
                        say("It must be very important to him if he even neglects")
                        say("his family... Why is he that interested in it?")
                        say("")
                        wait()
                        say_title("General Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I am sorry for Aranyo; she didn't marry Mr Soon to work")
                        say("day and night. She surely didn't reckon to expect the")
                        say("family herself.")
                        say("")
                        say("You maybe should talk to him again, maybe... maybe he")
                        say("will see it.")
                        say("")
                        set_state(back_to_soon)
                end

        end

        state back_to_soon begin

                when letter begin

                        setskin(NOWINDOW)
                        makequestbutton("Go to Mr.Soon")
                        q.set_title("Go to Mr.Soon ")
                        q.start()

                        local v = find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Mr Soon again")
                        end

                end

                when info or button begin

                        say_title("Go to Mr Soon")
                        say("")
                        say("Go to Mr Soon and ask him about the Secret Temple")
                        say("and the book he was looking for.")
                        say("")


                end

                when __TARGET__.target.click or
                        20023.chat."What is the Secret Temple?" begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You know, I have read every book in the world!")
                        say("")
                        say("But lately I heard of a secret Temple Book. Legend says")
                        say("this book holds all secrets of the Dark Temple - and how")
                        say("to become a Holy Man. I want to read this book so much!")
                        say("Can you get it for me?")
                        say("")
                        say("If you do this, I swear I'll give you something, even")
                        say("if I have to sell my house!")
                        say("")

                        local s=select("I'll do it","I can't, sorry." )
                        if 2==s then
                                say("Cancel the Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Mr.Soon:")
                                        say("")
                                        say("Oh! Come on, don't you want to help me?")
                                        say("")
                                        say("If not now then please later. I'll be waiting.")
                                        say("")
                                        return
                                end
                                say_title("Mr.Soon:")
                                say("")
				----"123456789012345678901234567890123456789012345678901234567890"|
                                say("You really won't help me? You need a holiday?")
                                say("The book is really important to me...")
                                say("")
                                say("What can I do now? Damn!")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Mr.Soon:")
                        say("")
                        say("Thanks, I'll be waiting.")
                        say("")
                        set_state(find_book)

                end

        end


        state find_book begin

                when letter begin

                        if pc.count_item("30156")>=1 then
                                setskin(NOWINDOW)
                                makequestbutton("You found the Obent Book")
                                q.set_title("You found the Obent Book")
                                q.start()

                                local v=find_npc_by_vnum(20023)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Go back to Mr.Soon")
                                end
                                return
                        end

                        setskin(NOWINDOW)
                        makequestbutton("Defeat Esoteric Fanatics!")
                        q.set_title("Defeat Esoteric Fanatics!")
                        q.start()

                end

                when info or  button begin
                        if pc.count_item("30156")>=1 then
                                say_title("You killed the Esoteric Fanatics.")
                                say("")
                                say("Carry the Obent Book of the Dark Temple")
                                say("to Mr.Soon")
                                say("")
                                return
                        end

                        say_title("Defeat the Esoteric Fanatics!")
                        say("")
                        say("Mr.Soon has a deep interest into the Temple Book.")
                        say("")
                        say("If you kill the Esoteric Fanatics, you might")
                        say("find the secret Book.")
                        say("")
                end

                when 701.kill  begin

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30156")==0  then
                                pc.give_item2(30156, 1)

                        end
                end


                when __TARGET__.target.click or
                        20023.chat."The secret Temple Book"   begin
                        target.delete("__TARGET__")
                        if pc.count_item("30156")>=1        then
                                say_title("Mr.Soon:")
                                say("")
                                say("Oh! That's it! My! Great!")
                                say("")
                                say("Here is your reward.")
                                say("")
                                pc.remove_item("30156",1)
                                say_reward("You received 50.000 Yang. ")
                                pc.change_money(50000)

                                say_reward("You received 800.000 Experience Points. ")
                                pc.give_exp2(800000)


                                clear_letter()
                                set_state(__COMPLETE__)




                                return
                        else
                                say_title("Mr.Soon:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Hey...")
                                say("You didn't get it yet? If you take upon a Quest you")
                                say("should seek to finish it!")
                                say("")
                                say("Now finish the Quest!")
				say("")

                                local s=select("I will try again","I give up")
                                if 2==s then
                                        say("Do you want to give up the Quest?")
                                        say("")
                                        local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Mr.Soon:")
                                                say("")
                                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                                say("Have you found the book? I heard the Esoteric Fanatics")
                                                say("have it. Why don't you try again later?")
                                                say("")
                                                return
                                        end
                                        say_title("Mr.Soon:")
                                        say("")
                                        say("Well, someone else will get me the book.")
                                        say("")
                                        say("You needn't do it anymore.")
					say("")
                                        set_state(__GIVEUP__)
                                        return
                                end

                                say_title("Mr.Soon:")
                                say("")
                                say("Thanks I'll be waiting.")
                                say("")
                                say("I can't wait to have it in my hands and read it.")
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
