----------------------------------------------------
--COLLECT QUEST_lv50
--METIN2 Collecting Quest
----------------------------------------------------
quest collect_quest_lv50  begin
        state start begin
        end
        state run begin
                when login or levelup with pc.level >= 50 and pc.level <= 90 begin
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
                        say("looks for your help urgently!")
                        say("Hurry up and help him.")
                        say("")
                end
                when __TARGET__.target.click or
                        20084.chat."Listen" begin
                        target.delete("__TARGET__")
                        say_title("Chaegirab:")
                        say("")
			---                                                   l
			say("Hello!")
			say("")
			say("This time I'm writing about different types of")
			say("monsters in our realm, but I can't handle alone.")
			say("")
			say("Actually I would collect the information on my")
			say("own, but I think you can imagine I have problems")
			say("with it as a biologist. Can you do this for me?")
			say("Of course you will receive a good reward for")
			say("helping me.")
			say("")
                        wait()
			say_title("Chaegirab:")
			say("")
			say("This time I want to know something about The")
			say("demons from the Demon Tower.")
			say("You can feel their evil energy at first sight.")
			say("")
			say("For my research I need the remains of the")
			say("Demon's Keepsake.")
                        say("")
                        wait()
			say_title("Chaegirab:")
			say("")
			say("How long will you need for bringing me the")
			say("remains of the Demon's Keepsake?")
			say("The different remains of the Demon's Keepsake")
			say("have different qualities, so please don't bring")
			say("me any remains of low ranked demons.")
                        say("I need about 15 for my examinations...")
                        say("Good luck!")
                        say("")
                        set_state(go_to_disciple)
                        pc.setqf("duration",0)
                        pc.setqf("collect_count",0)
                        pc.setqf("drink_drug",0) 
                end
        end
        state go_to_disciple begin
                when letter begin
                        send_letter("&The examination of the Biologist")
                end
                when button or info begin
                        say_title("Information about the demons")
                        ---                                                   l
                        say("")
                        say("Biologist Chaegirab, the apprentice of Uriel,")
                        say("is examining the demons from the Tower.")
			say("For his examination he needs the remains of the")
			say("Demon's Keepsake. Bring 15 of them to Chaegirab.")
                        say("")
                        say_item_vnum(30015)
                        say_reward("There are already".." "..pc.getqf("collect_count").." Demon's Keepsake collected")
                        say("")
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
                    if pc.count_item(30015)==0 then
                        syschat("You can use the Quest Potion once you got a Demon Keepsake.")
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
			syschat("You have used a Red Monocle. You can give the next Demon Keepsake to Chaegirab.")
		end
				
		when 20084.chat."GM: collect_quest_lv50.skip_delay" with pc.count_item(30015) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
			say(mob_name(20084))
			say("You are GM, OK")
			pc.setqf("duration", get_time()-1)
			return
		end
            when 20084.chat."The remains of the Demon's Keepsake? " with
		pc.count_item(30015) >0   begin
                        if get_time() > pc.getqf("duration") then
                                say_title("Chaegirap:")
				say("")
                                ---                                                   l
                                say("Oh!! You brought me a Demon's Keepsake!")
                                say("")
                                say("I have to verify it.")
                                say("One moment please...")
                                say("")
                                pc.remove_item(30015, 1)
                                pc.setqf("duration",get_time()+60*60*10) 
                                wait()
                                local pass_percent
                                if pc.getqf("drink_drug")==0 then
                                        pass_percent=60
                                else
                                        pass_percent=90
                                end
                                local s= number(1,100)
                                if s<= pass_percent  then
                                	if pc.getqf("collect_count")< 14 then
						local index =pc.getqf("collect_count")+1
						pc.setqf("collect_count",index)                  
						say_title("Chaegirab:")
						say("")
						say("This is what I am looking for! Thank you!")
						say("There are only".." "..15-pc.getqf("collect_count").. " remaining!")
						say("")
						say("Good luck!")
						say("")
						pc.setqf("drink_drug",0)        
						return
                                	end
                                        say_title("Chaegirap:")
					say("")
					---                                                   l
                                        say("You have collected all 15 Demon's Keepsakes!")
                                        say("")
                                        say("Now there is only the Demon's Soul Stone left,")
					say("it has the function of a key.")
                                        say("The Demon's Soul Stone can be also fetched from")
					say("fetched from the demons...")
					say("")
					say("Can you search one for me?")
                                        say("")
                                        pc.setqf("collect_count",0)
                                        pc.setqf("drink_drug",0)
                                        pc.setqf("duration",0)
                                        set_state(key_item)
                                        return
                                else
					say_title("Chaegirab:")
					say("")
					say("This Keepsake is from a low ranked demon...")
					say("I am sorry, but I cannot use this one.")
					say("Please find another.")
					say("")
					pc.setqf("drink_drug",0)               
					return
                                end
                else

                  say_title("Chaegirab:")
		  say("")
		  ---                                                   l
                  say("I am terribly sorry....")
                  say("I have not analysed the keepsake, you gave me.")
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
                        send_letter("&The examination of the Biologist")
                        if pc.count_item(30222)>0 then
                                local v = find_npc_by_vnum(20084)
                                if v != 0 then
                                        target.vid("__TARGET__", v, "Chaegirap")
                                end
                        end
                end
                when button or info begin
                        if pc.count_item(30222) >0 then
                                say_title("The Demon's Soul Stone from the demons")
                                say("")
                                ---                                                   l
                                say("Finally you have found the Demon's Soul Stone")
                                say("give it to Chaegirap.")
                                say("")
                                return
                        end
                        say_title("The Demon's Soul Stone")
                        say("")
                        ---                                                   l
                        say("For the examination of Biologist Chaegirab, the")
                        say("apprentice of Uriel, you have collected 15")
			say("Demon's Keepsake. The only thing he needs now")
			say("is a Demon's Soul Stone,")
			say("")
                        say_item_vnum(30222)
                        say("from the Tower of the demons.")
                        say("Give it to Chaegirab.")
                        say("")
                end
                when 1001.kill or
                         1002.kill or
                         1003.kill or
                         1004.kill  begin
                        local s = number(1, 500)
                        if s == 1 and pc.count_item(30222)==0 then
                                pc.give_item2(30222, 1)
                                send_letter("&You gain the Demon's Soul Stone!")
                        end
                end
                when __TARGET__.target.click  or
                        20084.chat."You have found the Demon's Soul Stone" with
		pc.count_item(30222) > 0  begin
                    target.delete("__TARGET__")
                        say_title("Chaegirab")
			say("")
			---                                                   l
                        say("Oh!!! Thank you very much..")
                        say("As a reward I will raise your inner strengths.")
                        say("")
                        say("Here is a secret recipe which contains the")
			say("secret of physical defense.")
                        say("Give it to Baek-Go. He will produce a special")
			say("potion. Have fun!")
                        say("")
                        say("Thanks to you, now I am more familiar with the")
			say("demons.")
                        say("")
                        pc.remove_item(30222,1)
                        set_state(__reward)
                end
        end
        state __reward begin
                when letter begin
                        send_letter("&The reward of Chaegirab")
                        local v = find_npc_by_vnum(20018)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Baek Go")
                        end
                end
                when button or info begin
                        say_title("The reward of Chaegirab")
			say("")
                        ---                                                   l
                        say("As reward for the 15 Demon's Keepsake and for")
                        say("the Demon's Soul Stone from the Tower of the")
			say("demons, Biologist Chaegirab gave you a recipe")
			say("for a secret potion. Please give this to Baek-Go,")
			say("he will create the potion.")
                        say("")
                end
                when __TARGET__.target.click  or
                        20018.chat."The Secret Recipe"  begin
	                target.delete("__TARGET__")
                        say_title("Baek Go:")
			say("")
			---                                                   l
                        say("Let me have a look..")
                        say("Is this the recipe Chaegirab gave you?")
                        say("Hmm, defense strength +60, I see.")
                        say("Here you are, this time the Yellow Ebony box.")
                        say("Here you are.")
                        say("")
			-----------                                                   l
                        say_reward("As reward for Chaegirab`s quest, you receive")
			say_reward("+60 increase on your defense.")
                        say_reward("This reward is not temporary, but permanent.")
                        say("")
                        affect.add_collect(apply.DEF_GRADE_BONUS,60,60*60*24*365*60) 
                        pc.give_item2(50111)
                        clear_letter()
                        set_quest_state("collect_quest_lv60", "run")
                        set_state(__complete)
                end
        end
        state __complete begin
        end
end
