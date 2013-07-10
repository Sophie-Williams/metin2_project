--------------------------------------------
--SUB QUEST
--LV 48
--The Cure for Betrayer Balso
--------------------------------------------
quest subquest_21 begin
        state start begin
                when login or levelup with pc.level >= 48 and pc.level <= 50 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20020)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, " Balso?")
                        end
                end

                when __TARGET__.target.click or 20020.chat."I have such an Itch" begin
			----"123456789012345678901234567890123456789012345678901234567890"|
  	                target.delete("__TARGET__")
                        say_title("Balso:")
                        say("")
                        say("May I ask you for a favour?")
                        say("")
                        say("As you surely already know I am known as a traitor and it")
                        say("is hard to make a living. I also had good times where I")
                        say("lived well but now it is the direct opposite...")
                        say("")
                        say("Since then, I flee and can never rest. Worst happened and")
                        say("I was in contact with many diseases.")
                        say("")
                        wait()
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Balso:")
                        say("")
                        say("According to traditional medicine, there is a remedy which")
                        say("strengthens the body's defences, the best for me.")
                        say("Can you help me to get this cure?")
                        say("")
                        say("As I live a secluded life, I can't go looking for that")
                        say("medicine myself. Please get me a sample from the Plague Men")
                        say("where I got this unknown disease from.")
                        say("I don't like asking this, but please help me.")
                        say("")
                        local s=select("I will help you.","No way")
                        if 2==s then
                                say_title("Balso:")
                                say("")
                                say("You want to refuse the assignment?")
                                say("")
                                local a=select("Yes","No")
                                if 2==a then
					----"123456789012345678901234567890123456789012345678901234567890"|
                                 	say_title("Balso:")
                                	say("")                                       
                                        say("Well, that always happens to me. Everywhere are people not")
                                        say("liking me. If you reconsider it, please come back later on.")
                                        say("")
                                        return
                                end
                                say_title("Balso:")
                                say("")
                                say("Okay, then go, I don't want to see you ever again.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Balso:")
                        say("")
                        say("I wish you all the best. Thanks.")
                        say("")
                        set_state(accept_request)


        	end

        end


        state accept_request begin

                when letter begin
                        send_letter("The Cure for Balso")

                        if pc.count_item(30152)>0 then
                                local v=find_npc_by_vnum(20020)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Go to Balso")
                                end
                        end

                end


                when info or  button begin
                        if pc.count_item(30152) >0 then
                                say_title("Go to Balso")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|

                                say("You found the medicine for Balso, who was infected by the")
                                say("Plague Men with an unknown disease.")
                                say("")
                                say("Deliver it to Balso.")
                                say("")
                                return
                        end

                        say_title("Get the Cure")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("On his long flight, Balso was infected with an unknown")
                        say("disease. For the cure he needs a sample of the unknown")
                        say("disease from the Plague Men.")
                        say("")
                        say("You'll find the Plague Men at the Ice Mountain.")
                        say("Get a sample of the disease.")
                        say("")

                end



                when 903.kill with pc.count_item(30152) == 0 begin
                        local s = number(1, 100)
                        if s <= 5 then
                                pc.give_item2(30152, 1)
                        end
                end



                when  __TARGET__.target.click or 20020.chat."Here is what you asked for" with pc.count_item(30152) > 0 begin
                        target.delete("__TARGET__")
                        say_title("Balso:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|

                        say("Oh many thanks.")
                        say("")
                        say("It is already terrible to live a life as a fugitive, and on")
                        say("top of it I even get ill.")
                        say("")
                        say("Now I can get healthy again with that cure. Thanks a lot.")
                        say("")
                        say_reward("Received 1.800.000 Experience")
                        say_reward("Received 200.000 Yang")
                        say("")
                        pc.remove_item(30152,1)
                        pc.change_money(200000)
                        pc.give_exp2(1800000)


                        clear_letter()
                        set_state(COMPLETE)
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
