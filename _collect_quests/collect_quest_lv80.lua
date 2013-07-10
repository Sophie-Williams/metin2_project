----------------------------------------------------
--COLLECT QUEST_lv80
--METIN2 Collecting Quest
----------------------------------------------------
quest collect_quest_lv80  begin
    state start begin
    end
    state run begin
        when login or levelup with pc.level >= 80  begin
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
            send_letter("&The request of Chaegirab")
        end

        when button or info begin
			say("")
			say("Biologist Chaegirab, the apprentice of Uriel,")
			say("looks for your help urgently.")
			say("")
			say("Find out what he needs this time.")
			say("")
		end

		when __TARGET__.target.click or 20084.chat."Listen" begin
			target.delete("__TARGET__")
			say_title("Chaegirab:")
			say("")
			---                                                   l
			say("Oh hello!!! I am happy to see you again...")
			say("This time I write about the Giant Wasteland.")
			say("I cannot handle it alone..")
			say("I wish I could do the examination on my own,")
			say("but I don't have the time. Could you do this")
			say("for me? Of course you will receive a nice reward")
			say("for your help.")
			say("")
			wait()
			say_title("Chaegirab:")
			say("")
			say("I appreciate your attention.")
			say("")
			say("Have you ever heard before of the Giant")
			say("Wasteland? This wasteland consists of deserts")
			say("and high mountains. There exist several giants,")
			say("which defend the land with mysterious weapons")
			say("and armour. They are really awesome.")
			say("")
			wait()
			say_title("Chaegirab:")
			say("")
			say("These giants are powerful and very strong.")
			say("They have an inborn Giant Symbol, which")
			say("interests me.")
			say("Please bring me the proof of the Giant Symbol.")
			say("")
			wait()
			say_title("Chaegirab:")
			say("")
			say("Is it possible?")
			say("There are a lot of fake symbols around at the")
			say("moment. I cannot use a fake symbol..")
			say("I need 30 symbols of this giants....")
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
			say_title("The examination of the Biologist")
			---                                                   l
			say("")
			say("Chaegirab, the apprentice of Uriel, is examining")
			say("the Giant Symbol from the Giant Wasteland.")
			say("These Giant Symbols are very well known,")
			say("because of their mighty powers.")
			say("Bring 30 symbols of these giants to Chaegirab.")
			say("")
			say_item_vnum(30166)
			say_reward("You already collected".." "..pc.getqf("collect_count").."symbols")
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
                    if pc.count_item(30166)==0 then
                        syschat("You can use the Quest Potion once you got a Giant Symbol.")
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
				pc.setqf("redm_duration", get_time()+16*60*60)
			end
			item.remove()
			pc.setqf("duration", get_time()-1)
			local use = pc.getqf("monocles_used")+1
			pc.setqf("monocles_used",use)
			syschat("You have used a Red Monocle. You can give the next Giant Symbol to Chaegirab.")
		end

		when 1401.kill or
			 1402.kill or
			 1403.kill or
			 1601.kill or 
			 1602.kill or
			 1603.kill  begin
			local s = number(1, 100)
			if s <= 5 then
				pc.give_item2(30166, 1)
				send_letter("&You won the"..item_name(30166)..".")
			end	
		end

		when 20084.chat."The Proof of the Giant Symbol" with pc.count_item(30166) >0 begin
			if get_time() > pc.getqf("duration") then
				say_title("Chaegirab")
				---                                                   l
				say("")
				say("Oh!! You brought me a symbol...")
				say("I have to check it...")
				say("One moment please...")
				say("")
				pc.remove_item(30166, 1)
				pc.setqf("duration",get_time()+60*60*22) -----------------------------------22�ð�
				wait()
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
					else
					pass_percent=90
				end
				local s= number(1,100)
				if s<= pass_percent  then
					if pc.getqf("collect_count")< 29 then     --weniger als 30
						local index =pc.getqf("collect_count")+1
						pc.setqf("collect_count",index)                                                     
						say("Chaegirap:")
						say("Oh!! Wonderful! Thank you...")
						say("There are only".." "..30-pc.getqf("collect_count").. " left.")
						say("Good luck!")
						say("")
						pc.setqf("drink_drug",0)                                                         
						return
					end
					---                                                   l
					say_title("Chaegirab:")
					say("")
					say("You have collected all 30 symbols!!! Now I am")
					say("just missing the Giant's Soul Stone.")
					say("")
					say("It has the function of a key and it can be")
					say("fetched from the giants in the Wasteland.")
					say("")
					say("Would you please find it for me?")
					say("")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)
					pc.setqf("duration",0)
					set_state(key_item)
					return
				else
					say_title("Chaegirab:")
					say("Hmm....that is the wrong one...")
					say("I am sorry. I cannot use this one.")
					say("There are also wrongful energies in this stone.")
					say("Please find another one.")
					say("")
					pc.setqf("drink_drug",0)                                         
					return
				end
			else
				say_title("Chaegirab:")
				say("")
				---                                                   l
				say("I am terribly sorry....")
				say("I have not analysed the symbols you gave me.")
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
			if pc.count_item(30225)>0 then
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Chaegirap")
				end
			end
		end
					
		when button or info begin
			if pc.count_item(30225) >0 then
				say_title("The Giant's Soul Stone")
				say("")
				---                                                   l
				say("Finally you have found the Giant's Soul Stone!")
				say("")
				say("Take it to Chaegirab.")
				say("")
				return
			end
				say_title("The Giant's Soul Stone")
				say("")
				---                                                   l
				say("For Chaegirabs examination, you have collected")
				say("30 symbols from the giants. Now he needs the")
				say("Giant's Soul Stone from the Wasteland!")
				say_item_vnum(30225)
				say("Give it to Chaegirab.")
				say("")
		end

		when 1401.kill or
			 1402.kill or
			 1403.kill or
			 1601.kill or 
			 1602.kill or
			 1603.kill  begin
			local s = number(1, 200)
			if s == 1 and pc.count_item(30225)==0 then
				pc.give_item2(30225, 1)
				send_letter("&You gained the Giant's Soul Stone.")
			end
		end

		when __TARGET__.target.click  or 20084.chat."You have found the Giant's Soul Stone" with pc.count_item(30225) > 0  begin
			target.delete("__TARGET__")
			say_title("Chaegirap")
			say("")
			---                                                   l
			say("Oh! Thank you very much..")
			say("As reward I will raise your inner strength.")
			say("This is a secret recipe, which contains the")
			say("Information about strength.")
			say("Give it to Baek-Go. He will produce Strength")
			say("Potion. Have fun!")
			say("Thank you, now I am familiar with the Giant")
			say("Symbols.")
			say("")
			pc.remove_item(30225,1)
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
			say("As reward for the 30 symbols and for the Giant's Soul")
			say("Stone from giants, Biologist Chaegirab")
			say("gave you a recipe for a secret potion.")
			say("Please give this to Baek-Go, he will create the")
			say("potion.")
			say("")
		end

		when __TARGET__.target.click or 20018.chat."The Secret Recipe" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Let me have a look..")
			say("Is that the recipe, Chaegirab gave you?")
			say("Hmm...Attack strength +10% and Attack speed +6.")
			say("Here we go again.")
			say("")
			wait()
			say("Baek-Go:")
			say("")
			say("Here you are, this time a Blue Ebony box!!")
			say("Open it, if you are inquisitive.")
			say("")
			 ---                                                   l
			say_reward("As a reward for Chaegirab's quest, you receive")
			say_reward("6 points in your Attack speed and a +10% increase")
			say_reward("in your attack strength.")
			say_reward("")
			say_reward("These rewards are not temporary, but eternal.")

			affect.add_collect(apply.ATT_SPEED,6,60*60*24*365*60) --60Jahre
			affect.add_collect_point(POINT_ATT_BONUS,10,60*60*24*365*60) --60��	
			pc.give_item2(50114)
			clear_letter()
			set_quest_state("collect_quest_lv85", "run")
			set_state(__complete)
		end
	end

	state __complete begin
	end
end
