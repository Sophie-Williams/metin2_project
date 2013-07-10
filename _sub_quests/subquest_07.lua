quest subquest_7 begin
        state start begin
                when login or levelup with pc.level >= 12 and pc.level <= 17 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20008)

                        if v!= 0 then
                                target.vid("__TARGET2__", v, "The best Cook Book")
                        end
                end

                when __TARGET2__.target.click or 20008.chat."The best Cook Book" with pc.level >= 12 begin
                        target.delete("__TARGET2__")

                        say_title("Octavio:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Hmm, you maybe know Mr.Soon? He's a book worm who")
                        say("spends his time reading.")
                        say("")
                        say("I have heard Mr.Soon owns a great Cook Book. Please")
                        say("find out if that is true.")
                        say("")
                        say("I was told this Cook Book is full of rare and")
                        say("exotic recipes that I want to learn.")
                        say("")

                        set_state(ask_to_sunyugil)
                end
        end

        state ask_to_sunyugil begin
                when letter begin
                        send_letter("The best Cook Book")
                end

                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Ask Mr.Soon")
                        end

                end

                when info or button begin
                        say_title(" The best Cook Book")
                        say("")
                        say("Ask Mr.Soon about the Cook Book that Octavio is")
                        say("interested in.")
                        say("")
                end

                when 20023.chat."About the Cook Book" begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Blah, blah ... Oh! You again, what do you need?")
                        say("")
                        say("Yes, I do have that Cook Book.")
                        say("")
                        say("I do not need it and can give it to you. But please, do")
                        say("not disturb me again!")
                        say("")

                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        send_letter("The best Cook Book")
                end

                when letter begin
                        local v=find_npc_by_vnum(20008)
                        if 0==v then
                        else
                                target.vid("__TARGET3__",v,"Deliver the Book to Octavio.")
                        end
                end

                when info or button begin
                        say_title("The best Cook Book")
                        say("")
                        say("Deliver the Cook Book to Octavio.")
                        say("")
                end

                when __TARGET3__.target.click or 20008.chat."Here is the Cook Book." begin
                        target.delete("__TARGET3__")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Octavio:")
            		say("")
                        say("Hmm I want to make sure this is the correct book.")
                        say("Oh, this is really one fantastic cook book.")
                        say("I will cook this dish here for sure!")
                        say("")
                        wait()

           		say_title("Octavio:")
                        say("")
                        say("As you are already here, I might ask you for another")
                        say("favour. I have nearly all ingredients for this dish, but") 
                        say("I need an Intestine from a Grey Wolf.")
                        say("")
                        say("That is not easy to get. Please get this for me.")
                        say("")

                        set_state(hunt_for_oku)
                end
        end

        state hunt_for_oku begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("The best Cook Book")
                        q.set_title("The best Cook Book")
                        q.start()
                end

                when info or button begin
                        say_title("The best Cook Book")
                        say("")
                        say("Get the Intestine of a Grey Wolf for Octavio.")
                        say("")
                        say_item_vnum("30026")
                        say("")
                end

                when 106.kill begin
			local s = number(1, 80)
			if s <= 5 and pc.count_item("30026")==0  then
				pc.give_item2("30026", 1)
				local v=find_npc_by_vnum(20008)
				if 0==v then
				else
					target.vid("__TARGET4__",v,"")
				end
                        end
                end

                when __TARGET4__.target.click or 20008.chat."I have the Grey Wolf Intestine." begin
                        target.delete("__TARGET4__")
                        if pc.count_item("30026") >= 1 then
                                say_title("Octavio:")
                                say("")
                                say("Thank you, now I can cook that meal.")
                                say("")
                                say("I am really happy about your help.")
                                say("")
                                pc.remove_item("30026")
                                pc.give_exp2(12000)
                                set_quest_state("levelup","run")
                                pc.change_money(12000 )
                                pc.give_item2(22010, 1)

                                say_title("Reward:")
                                say("")
                                say_reward("You received 12.000 Experience Points." )
                                say_reward("You received 12.000 Yang.")
                                say_reward("You received a Return Scroll.")
                                say("")
                                clear_letter()

                                set_state(__COMPLETE__)
                        else
                                say_title("Octavio:")
                                say("")
                                say("I still need an Intestine from a Grey Wolf.")
                                say("")
                                say("Please get me one.")
                                say("")
                        end
                end
        end

        state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
end
