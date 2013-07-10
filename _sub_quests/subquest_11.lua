quest subquest_11 begin
        state start begin
                when login or  levelup with pc.level >= 19 and pc.level <= 24 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20006)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Find Mirine's brother.")
                        end
                end


                when __TARGET__.target.click or
                        20006.chat."Find Mirine's brother" with pc.level >= 19 begin
                        target.delete("__TARGET__")

                        say_title("Mirine:")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Can I ask you for a favour?")
                        say("")
                        say("My brother has been gone for a long time. I have not heard")
                        say("anything from him.")
                        say("")
                        say("I am getting worried.")
                        say("")
                        wait()
                        say_title("Mirine:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("My brother wanted to visit Yu-Hwan the Musician in the")
                        say("next village, "..areaname[pc.get_empire()][2])
                        say("")
                        say("Can you go to Yu-Hwan and ask him about my brother?")
                        say("He must have been there.")
                        say("")
                        say("Could you look for him if you have the time?")
                        say("")

                        local s=select("Yes, I will do that.","I have no time.")
                        if 2==s then
                                say("Cancel Quest?")
                                local a=select("Yes","No")
                                        if  2==a then
                                                say_title("Mirine:")
                                                say("")
                                                say("Thank you!")
                                                say("")
                                                say("Please look for him. I am really worried.")
                                                say("")
                                                say("Please come back.")
                                                say("")
                                                return
                                        end
                                        say_title("Mirine:")
                                        say("")
                                        say("You do not want to help?")
                                        say("")
                                        say("Allright, see you later...")
                                        say("")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Mirine:")
                                say("")
                                say("So you will look for him?")
                                say("")
                                say("Thank you very much! I am really worried.")
                                say("Good luck and let me know soon!")
                                say("")
                                set_state(find_brother)

                end
        end

        state find_brother begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Find Mirine's brother.")
                        q.set_title("Find Mirine's brother.")
                        q.start()

                        local v= find_npc_by_vnum(20017)
                        if 0==v then
                        else
                                target.vid("__TARGET1__",v,"Ask Yuhwan about Mirines brother.")
                        end

                end

                when info or button begin
                        say_title("Find Mirine's brother.")
                        say("")
                        say("Ask Musician Yuhwan in the "..areaname[pc.get_empire()][2].." village about")
                        say("Mirine's brother.")
                        say("")
                end

                when __TARGET1__.target.click or
                        20017.chat."Have you seen Mirines brother?" begin
                        target.delete("__TARGET1__")
                        say_title("Yu-Hwan:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I fell in love without knowing what love means...")
                        say("")
                        say("Who are you looking for? Mirines brother?")
                        say("")
                        say("We talked a bit before he went into the mountains. He")
                        say("wanted to search for rare herbs. I don't know where he")
                        say("is now.")
                        say("")
                        say("The Hunter often goes into the mountains. You can find")
                        say("him in this village. Why don't ask him?")
                        say("")
                        say("(Sings) La,la,la, love is sad, but beautiful...")
                        say("")

                        set_state(ask_to_hunter)
                end
        end

        state ask_to_hunter begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Find Mirine's brother.")
                        q.set_title("Find Mirine's brother.")
                        q.start()

                        local v= find_npc_by_vnum(20019)
                        if 0==v then
                        else
                                target.vid("__TARGET2__",v,"Ask Yang-Shin about Mirines brother.")
                        end

                end

                when info or button begin
                        say_title("Find Mirines brother.")
                        say("")
                        say_reward("Ask Yang-Shin about Mirines brother.")
                        say("")
                end

                when  __TARGET2__.target.click or
                        20019.chat."Have you seen Mirines brother?" begin
                        target.delete("__TARGET2__")
                        say_title("Yang-Shin:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("In the world many problems exist. Also the hunting has its")
                        say("own problems. Mirines brother you say...?")
                        say("")
                        say("He was searching for rare herbs in the mountains. When I")
                        say("last saw him, he went to find Ginseng. He was very happy,")
                        say("because he had found some.")
                        say("")
                        say("He wanted to buy his sister new clothes with the Yang he")
                        say("got from selling those herbs. He is really a nice guy. I")
                        say("have a letter he gave to me. Can you give it to his sister")
                        say("for me? He should be back soon.")
                        say("")

                        set_state(back_to)
                end
        end

        state back_to begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Find Mirine's brother.")
                        q.set_title("Find Mirine's brother.")
                        q.start()

                        local v= find_npc_by_vnum(20006)
                        if 0==v then
                        else
                                target.vid("__TARGET3__",v,"Tell Mirine the news.")
                        end

                end

                when info or button begin
                        say_title("Find Mirine's brother.")
                        say("")
                        say("Tell Mirine the news about his brother. You can find")
                        say("her in the "..areaname[pc.get_empire()][1].." village.")
                        say("")
                end

                when __TARGET3__.target.click or
                        20006.chat."Any news about my brother?" begin
                        target.delete("__TARGET3__")
                        say_title("Mirine:")
                        say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Oh! A letter written by my brother. He found many herbs up")
                        say("in the mountains? It will take awhile until he returns?")
                        say("")
                        say("Sorry, I should have known this!")
                        say("")
                        say("You went through all this trouble. It is not much but, I")
                        say("hope you will accept my apology and forgive me.")
                        say("")
                        wait()
                        say_title("Mirine:")
                        say("")
			say("Thank you for your kindness. Come back soon.")
                        say("")
                        say_title("Reward:")
                        say("")
                        
                        say_reward("You received 100.000 Experience Points.")
                        say_reward("You received 15.000 Yang.")
                        local r = number(1,2)
                        if r == 1 then
				if pc.get_job() == 0 or pc.get_job() == 1 then
					say_reward("You received Copper Earrings +4")
					pc.give_item2(17024)
				else
					say_reward("You received Golden Earrings +4")
					pc.give_item2(17064)
				end
			else
				say_reward("You received Silver Earrings +4")
				pc.give_item2(17044)			
			end
                        say("")
			pc.give_exp2(100000)
                        pc.change_money(15000)
                        q.done()
                        set_state(__COMPLETE__)
                end
        end

        state __GIVEUP__ begin
        end

        state __COMPLETE__ begin
        end
end
