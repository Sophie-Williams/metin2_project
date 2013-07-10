----------------------------------------------------
-- SUB QUEST
-- LV 51
-- The secret of inlaid celadon porcelain
----------------------------------------------------

quest subquest_37 begin
        state start begin
                when login or levelup with pc.level >= 51 and pc.level <= 53 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20005)

                        if v != 0 then
                                target.vid("__TARGET__", v, "The Secret of the celadon Porcelain")
                        end
                end


                when __TARGET__.target.click or
                        20005.chat."The Secret of the celadon Porcelain" with pc.level >= 51 begin
                        target.delete("__TARGET__")

                        say_title("Yonah :")
                        say("")
                        say("Hmm. Not this - and not that. Argh.")
                        say("I produce Porcelain without a break")
                        say("which isn't good simply.")
                        say("I think I need a new, great")
                        say("Porcelain.")
                        say("")
                        wait()
                        say_title("Yonah:")
                        say("")
                        say("I'll try a new method...")
                        say("It isn't easy to produce celadon Porcelain.")
                        say("That's why few know how to do it.")
                        say("I need it though for my Art.")
                        say("In this case...")
                        say("Yes, Uriel could know it.")
                        say("Please go to Uriel and ask him about the making of")
                        say("celadon Porcelain, he will surely be able to")
                        say("help you!")
                        say("")
                        local s=select("Accept","Cancel")
                        if 2==s then
                                say("You want to cancel this Quest?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say("Yonah:")
                                        say("Hmm, you are busy?")
                                        say("Well, come again when you have time.")
                                        say("")
                                        return
                                end
                                say_title("Yonah:")
                                say("")
                                say("I want to produce the best Porcelain...")
                                say("Understand...see you.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Yonah:")
                        say("")
                        say("Thanks." )
                        say("Come back soon to me.")
                        say("")
                        set_state(ask_to_uriel)


                end
        end

        state ask_to_uriel begin
                when letter begin
                        send_letter("The Secret of the Celadon Porcelain")
                end

                when letter begin
                        local v=find_npc_by_vnum(20011)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Ask Uriel")
                        end

                end

                when info or button begin
                        say_title("Go to Uriel")
                        say("")
                        say("Yonah does the best he can to produce porcelain.")
                        say("He says that Uriel the Scholar might know")
                        say("something about Celadon Porcelain.")
                        say("Visit Uriel and ask him how Celadon Porcelain")
                        say("is made!")
                        say("")
                end

                when __TARGET__.target.click or
                        20011.chat."Seladon Porcelain" begin
                        target.delete("__TARGET__")
                        say_title("Uriel :")
                        say("")
                        say("Celadon Porcelain?")
                        say("Well, I am knowledgeable in History and ")
                        say("Sciences but I am not really interested in art.")
                        say("I can't tell you anything about Celadon Porcelain.")
                        say("But maybe Mr Soon knows something. People")
                        say("don't like him much, but he reads so")
                        say("many different books, quite possible")
                        say("he knows something.")
                        say("")

                        set_state(ask_to_mrsoon)
                end
        end

        state ask_to_mrsoon begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Mr Soon")
                        q.set_title("Go to Mr Soon")
                        q.start()

                        local v=find_npc_by_vnum(20023)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Ask Mr Soon")
                        end

                end

                when info or button begin
                        say_title("The Secret of the Celadon Porcelain")
                        say("")
                        say("The Bookworm Mr Soon surely knows something about")
                        say("Celadon Porcelain. Go and ask him how it")
                        say("is made.")
                        say("")
                end

                when __TARGET__.target.click or
                        20023.chat."Celadon Porcelain." begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon :")
                        say("")
                        say("Bla bla...")
                        say("Hey! What do you want?")
                        say("Don't disturb me when I read!")
                        say("Why do you disturb?")
                        say("Hmm? Celadon Porcelain?")
                        say("It's about ceramic manufacturing.")
                        say("I read up to 10 books only dealing with this.")
                        say("Why? Well, I am not called Bookworm ")
                        say("for nothing!")
                        say("I can understand everything ever")
                        say("written down!")
                        say("")
                        wait()
                        say_title("Mr.Soon:")
                        say("")
                        say("You want to know something about Celadon Porcelain??")
                        say("Hmm, I won't tell you for free.")
                        say("Seems it is good you disturbed me at last. ")
                        say("I asked the Peddler of the next village")
                        say("for a book I still miss.")
                        say("Please get this for me.")
                        say("Waiting for the Peddler is boring...")
                        say("I want to have that book now!")
                        say("")
                        set_state(to_seller)
                end
        end

        state to_seller begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Off to the Peddler")
                        q.set_title("Off to the Peddler")
                        q.start()

                        local v=find_npc_by_vnum(20010)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Off to the Peddler")
                        end

                end

                when info or button begin
                        say_title("The Secret of the Celadon Porcelain")
                        say("")
                        say("Mr.Soon the Bookworm knows about Celadon Porcelain")
                        say("but he will only tell you this when you")
                        say("fetched the book he ordered from the Peddler.")
                        say("Off to the Peddler")
                        say("to get the book Mr Soon wants.")
                        say("")
                end

                when __TARGET__.target.click or
                        20010.chat."Give me Mr Soon Book" begin
                        target.delete("__TARGET__")
                        say_title("Peddler:")
                        say("")
                        say("Hey, what you do here?")
                        say("You come again to help me?")
                        say("Aaah, you want the book for Mr Soon.")
                        say("I would have Mr Soon come into the village")
                        say("but he is too impatient. Send others to get it.")
                        say("Hmm.")
                        say("Here it is.")
                        say("I don't know what's so important with that paper stuff.")
                        say("It is way more important to earn Yang.")
                        say("Take this to Mr Soon.")
                        say("")
                        set_state(back_to_bookbug)
                end
        end

        state back_to_bookbug begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Return to Mr Soon")
                        q.set_title("Return to Mr Soon")
                        q.start()

                        local v=find_npc_by_vnum(20023)
                        if 0!= v then
                                target.vid("__TARGET__",v,"Return to Mr Soon")
                        end
                end

                when info or button begin
                        say_title("Return to Mr Soon")
                        say("")
                        say("I have the book Mr Soon asked for from the Peddler")
                        say("in the next village.")
                        say("No back to Mr Soon to give him the books")
                        say("and to ask him for the Celadon.")
                        say("")
                end

                when __TARGET__.target.click or
                        20023.chat."I have the Book" begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        say("Yay!")
                        say("Finally I have this new book")
                        say("I am very happy to have this book that fast.")
                        say("As promised I will tell you about")
                        say("Celadon Porcelain.")
                        say("Hmm..")
                        say("On this note I will write down what I know about it,")
                        say("follow its orders and you will")
                        say("produce fantastic porcelain.")
                        say("But only when you follow close.")
                        say("Now it's time to read my new book.")
                        say("Goodbye!")
                        say("")

                        pc.give_item2(30160)
                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Got strange Writings")
                        q.set_title("Got strange Writings")
                        q.start()

                        local v=find_npc_by_vnum(20005)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Carry the notice to Yonah")
                        end
                end

                when info or button begin
                        say_title("The Secret of the Celadon Porcelain")
                        say("")
                        say("I should bring those notice to Yonah.")
                        say("")
                end

                when __TARGET__.target.click or
                        20005.chat."The Secret of the Celadon Porcelain" begin
                        target.delete("__TARGET__")
                        say_title("Yonah:")
                        say("")
                        say("Ooh!!!")
                        say("Here is everything about the manufacturing of")
                        say("Celadon Porcelain. Finally I will be")
                        say("remembered in history as a master artist.")
                        say("Very good! I will be able to do my life work")
                        say("with these notes.")
                        say("Thanks for your help!")
                        say("Soon I will be able to present the very")
                        say("best ceramic, count on me! I will produce")
                        say("that good Celadon Porcelain, that it will")
                        say("last centuries.")
                        say("")
                        pc.remove_item(30160,1)

                        say_reward("You received 65.000 Yang.")
                        pc.change_money(65000)

                        say_reward("You received 3.000.000 Experience Points.")
                        pc.give_exp2(3000000)

                        say_reward("You received Jade Shoes+3")
                        pc.give_item2(15143)
                        clear_letter()
                        set_state(__COMPLETE__)
                        return

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
