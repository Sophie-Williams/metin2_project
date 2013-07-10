----------------------------------------------------
--COLLECT QUEST_lv60
--METIN2 Collecting Quest----------------------------------------------------
quest collect_quest_lv60  begin
        state start begin
        end
        state run begin
                when login or levelup with pc.level >= 60  begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20084)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Chaegirab")
                        end
						q.set_icon("scroll_open_green.tga")
                        send_letter("&The Request of Chaegirab")
                end

                when button or info begin
                        say_title("The Request of Chaegirab")
                        say("")
                        say("Biologist Chaegirab, the apprentice of Uriel,")
                        say("looks for your help urgently")
                        say("Hurry up and help him.")
                        say("")
                end

                when __TARGET__.target.click or
                        20084.chat."Listen" begin
                        target.delete("__TARGET__")
                        say_title("Chaegirap:")
			say("")
                        ---                                                   l
						say("Ha ha, you again.")
						say("I am happy to see you again.")
						say("This time I write about the Iceberg in the west,")
						say("I cannot handle it alone..")
						say("Actually, I should collect the information on my")
						say("own, but I cannot. Could you do this for me? Of")
						say("course you will receive a good reward for helping")
	say("me.")
wait()
                        say_title("Chaegirab:")
			say("")
                        say("I would like to know more about the Iceberg in ")
			say("the west. Have you ever been at the Iceberg?")
                        say("This Iceberg was surrounded by a secret power in")
			say("former times.")
                        say("It was inspected by many scholars and magicians.")
                        say("The Iceberg was created through some type of")
			say("Ice Marble.")
                        say("")
                        say("Their colour is bright and shiny")
			say("")
                        wait()
                        say_title("Chaegirab:")
			say("")
                        say("How long will you need to bring me a Ice")
			say("Marble? But don't bring me any broken marble.")
                        say("I cannot use them when they are broken.")
                        say("I need about 20 Ice Marbles for my research.")
                        say("Good luck!")
                        say("")
                        set_state(go_to_disciple)
                        pc.setqf("duration",0) 
                        pc.setqf("collect_count",0)                        pc.setqf("drink_drug",0) 
                end
        end

        state go_to_disciple begin
                when letter begin
                        send_letter("&The Request of Chaegirab")

                end
                when button or info begin
                        say_title("I want to know something about the Iceberg in the west")
                        ---                                                   l
                        say("")
                        say("Chaegirab, the apprentice of Uriel, is examining")
			say("the Iceberg. Scholars and magicians show great")
			say("interest for that place. Especially for the")
			say("mysterious power surrounding it. There are old")
			say("and secret legends about this place.")
                        say("Probably the Ice Marbles are the key for")
			say("the Icebergs mystery.")
                        say("Bring Chaegirab 20 Ice Marbles.")
                        say("")
                        say_item_vnum(30050)
                        say_reward("At this moment, ".." "..pc.getqf("collect_count").." marbles are collected.")
                end

                when 71035.use begin 
                    if get_time() < pc.getqf("duration") then
						syschat("You can not use the Quest Potion yet.")
                        return
                    end
                    if pc.getqf("drink_drug")==1 then
						syschat("You already used it.")
						return
                    end
                    if pc.count_item(30050)==0 then
                        syschat("You can use the Quest Potion once you got a Ice Marble.")
						return
                    end
                    item.remove()
                    pc.setqf("drink_drug",1)
                end

		when 70030.use begin
			if get_time() > pc.getqf("redm_duration") then
				pc.setqf("monocles_used", 0)
			end
			if get_time() > pc.getqf("duration") then
				syschat("You can already give the next item to Chaegirab. No Monocle needed.")
				return
			end
			if pc.getqf("monocles_used") > 2 then
				syschat("You have already used 3 Red Monocles today.")
				return
			end
			if pc.getqf("monocles_used") == 0 then
				pc.setqf("redm_duration", get_time()+24*60*60)
			end
			item.remove()
			pc.setqf("duration", get_time()-1)
			local use = pc.getqf("monocles_used")+1
			pc.setqf("monocles_used",use)
			syschat("You have used a Red Monocle. You can give the next Ice Marble to Chaegirab.")
		end

		when 20084.chat."GM: collect_quest_lv60.skip_delay" with pc.count_item(30050) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
			say(mob_name(20084))
			say("You are GM, OK")
			pc.setqf("duration", get_time()-1)
			return
		end

            when 20084.chat."Have you found the Ice Marbles? " with pc.count_item(30050) >0   begin
                        if get_time() > pc.getqf("duration") then
                                say_title("Chaegirap:")
				say("")
                                ---                                                   l
                                say("Oh!! You brought me an Ice Marble...")
                                say("I have to check it...")
                                say("Where are my magnifiers..")
                                say("One moment please...")
                                say("")
                                pc.remove_item(30050, 1)
                                pc.setqf("duration",get_time()+60*60*12)
                                wait()

                                local pass_percent
                                if pc.getqf("drink_drug")==0 then
                                        pass_percent=60
                                else
                                        pass_percent=90
                                end

                                local s= number(1,100)
                                if s<= pass_percent  then
                                   if pc.getqf("collect_count")< 19 then     
                                                local index =pc.getqf("collect_count")+1
                                                pc.setqf("collect_count",index)
                                                say_title("Chaegirab:")
						say("")
                                                say("Oh!! Wonderful! Thank you...")
                                                say("There are only".." "..20-pc.getqf("collect_count").. " left!")
                                                say("Good Luck!")
                                                say("")
                                                pc.setqf("drink_drug",0)
                                                return
                                        end
                                        say_title("Chaegirab:")
					say("")
					---                                                   l
                                        say("You have collected all 20 Ice Marbles.")
                                        say("There is only the Icer's Soul Stone from the ice")
					say("monsters left. It has the function of a key.")
                                        say("The Icer's Soul Stone from the Iceberg, can be")
					say("fetched from the ice monsters.")
                                        say("Can you handle it?")
                                        say("")
                                        pc.setqf("collect_count",0)
                                        pc.setqf("drink_drug",0)
                                        pc.setqf("duration",0)
                                        set_state(key_item)
                                        return
                                else
                                say_title("Chaegirap:")
				say("")
                                say("Hum......")
                                say("I am sorry, I cannot use this marble..")
                                say("It is partly broken")
                                say("Can you organize another one?")
                                say("")
                                pc.setqf("drink_drug",0)         
				return
                                end
                 else
                  say_title("Chaegirab:")
		  say("")
		  ---                                                   l
                  say("I am so sorry....")
                  say("I forgot to check that last marble you gave me.")
                  say("I am very sorry... Can you give me another one")
                local hoursleft = (pc.getqf("duration")-get_time())*60*60
                if hoursleft > 12 then
                	say("tomorrow?")
                elseif hoursleft < 1 then
                	say("in a few minutes?")
                else
		  	say("a few hours later on?")
		  end
                  say("")
                  return
                end

        end
end


        state key_item begin
                when letter begin
                        send_letter("&The Icer's Soul Stone from the ice monsters")

                        if pc.count_item(30223)>0 then
                                local v = find_npc_by_vnum(20084)
                                if v != 0 then
                                        target.vid("__TARGET__", v, "Chaegirap")
                                end
                        end

                end
                when button or info begin
                        if pc.count_item(30223) >0 then
                                say_title("You found the Icer's Soul Stone")
                                say("")
                                ---                                                   l
                                say("The Icer's Soul Stone from the ice monsters.")
                                say("Finally, you have found the Icer's Soul Stone. Give")
				say("it to Chaegirap.")
                                say("")
                                return
                        end

                        say_title("The Icer's Soul Stone from the ice monsters")
                        say("")
                        ---                                                   l
                        say("For Chaegiraps examination, a apprentice of")
			say("Uriel, you have collected 20 Ice Marbles.")
			say("The last thing he needs is a Icer's Soul Stone from")
			say("the ice monsters.")
                        say_item_vnum(30223)
                        say("Find the Icer's Soul Stone and bring it to Chaegirap.")
                        say("")
                end



                when 1102.kill or
						1103.kill or
                         1104.kill or
                         1106.kill  begin
                        local s = number(1, 300)
                        if s == 1 and pc.count_item(30223)==0 then
                                pc.give_item2(30223, 1)
                                send_letter("&You have won the Ice Soul Stone.")
                        end
                end



                when __TARGET__.target.click  or
                        20084.chat."You won the Icer's Soul Stone from the ice monsters." with
		pc.count_item(30223) > 0  begin
                    target.delete("__TARGET__")
                        say_title("Chaegirab:")
			say("")
			---                                                   l
                        say("Oh!!! Thank you very much...")
                        say("As reward, I will raise your inner strength ..")
                        say("That��s a secret recipe, which contain the")
			say("information about strength...")
                        say("Give it to Baek-Go. He will produce Strength Potion.")
                        say("Have fun.")
                        say("Thank you, now I am familiar with the Icebergs mystery.")
                        say("")
                        pc.remove_item(30223,1)
                        set_state(__reward)
                end

        end

        state __reward begin
                when letter begin
                        send_letter("&The reward of Chaegirap")

                        local v = find_npc_by_vnum(20018)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Baek Go")
                        end

                end
                when button or info begin
                        say_title("The reward of Chaegirab")
                        ---                                                   l
                        say("As reward for the 20 Ice Marbles")
                        say("and for the Icer's Soul Stone, ")
                        say("Biologist Chaegirap gave you a recipe for a secret ")
                        say("potion. Please give this to Baek-Go. He will create the potion.")
                        say("")
                        say("")
                end

                when __TARGET__.target.click  or
                        20018.chat."The Secret Recipe"  begin
                    target.delete("__TARGET__")
                        say("Baek-Go:")
                        say("Let me have a look..")
                        say("Is that the recipe, Chaegirab gave you? Hmm...")
                        say("Attack Power +50?")
                        say("Ok then.")
                        say("")
                        wait()
                        say_pc_name()
                        say("")
                        say("The Reward")
                        say("")
                        wait()
                        say("Baek-Go:")
                        say("Let me see..")
                        say("This time it is the Light Green Ebony box.")
                        say("")
                        say("")
                        say_reward("As reward for Chaegirab's pleasure, you received")
                        say_reward("a 50 point increase on your attack speed.")
                        say_reward("These strength are not temporary, but eternal.")

						affect.add_collect(apply.ATT_GRADE_BONUS,50,60*60*24*365*60)--60��		
                        pc.give_item2(50112)
                        clear_letter()
                        set_quest_state("collect_quest_lv70", "run")
                        set_state(__complete)
                end

        end


        state __complete begin
        end
end
