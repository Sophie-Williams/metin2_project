----------------------------------------------------
--COLLECT QUEST_lv92
--METIN2 Collection Quest
----------------------------------------------------
quest collect_quest_lv92  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 92  begin
			set_state(information)
		end	
	end

	state information begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then
				target.vid("__TARGET__", v, "Seon-Pyeong")
			end
			q.set_icon("scroll_open_green.tga")
			send_letter("&Seon-Pyeong's strange hobby")
		end

		when button or info begin
			say_title("Seon-Pyeong's strange hobby")
			say("")
			say("Seon-Pyeong in Dragon Valley")
			say("is looking for you.")
			say("Please find out what is going on.")
			say("")
		end
		
		when __TARGET__.target.click or
			20091.chat."Weapon collecter Seon-Pyeong" begin
			target.delete("__TARGET__")
			---                                                   l
			say_title("Seon-Pyeong:")
			say("")
			say("Oh.. Brave warrior! I was looking for you")
			say("to get you help!! ")
			say("Please help me! ")
			say("I have heard that monsters in Heaven Lair ")
			say("have some gems I need for weapon research!")
			say("")
			wait()
			say_title("Seon-Pyeong:")
			say("")
			say("The gems must be perfect ones!")
			say("I will evaluate them, if you can bring me!")
			say("You must bring it! ")
			say("The gem I need is Golden sky gem,")
			say("And i need 10 of them!")
			say("Please!")
			say("")
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --Quest Potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Seon-Pyeong's strange hobby")
			
		end
		when button or info begin
			say_title("Get Golden sky gems")
			---                                                   l
			say("Weapon collector Seon-Pyeong")
			say("is collecting gems for weapon research.")
			say("The gems can be collected from ")
			say("Heavens Ice Man and Heavens Ice Golem")
			say_item_vnum(30251) 
			say_reward("  Currently".." "..pc.getqf("collect_count").."have collected")
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
                    if pc.count_item(30251)==0 then
                        syschat("You can use the Quest Potion once you got a Golden Sky Gem.")
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
			syschat("You have used a Red Monocle. You can give the next Golden Sky Gem to Chaegirab.")
		end

		when 1135.kill or 1137.kill begin
			local s = number(1, 150)
			if s <= 1  then
				pc.give_item2(30251, 1)
				send_letter("&You have obtained the Golden Sky Gem")		
			end	
		end

    	when 20091.chat."Did you bring the Golden Sky Gem? " with pc.count_item(30251) >0   begin
			if get_time() < pc.getqf("duration") then
			  say_title("Seon-Pyeong:")
			  say("")
			  say("I'm so sorry....")
			  say("I haven't analysed them you gave me ")
			  say("last time.....")
			  say("Hmm.....Can you bring it later")
			  say("")
				return
			end
			
			if pc.count_item(30251) <= 0 then
					say_title("Seon-Pyeong:")
					say("")
					say("Please come when you find "..item_name(30251)..".")
					return
				end
			say_title("Seon-Pyeong:")
			say("")
			---                                                   l
			say("Oh!! You have brought...")
			say("Let me take a look at this...")
			say("Please wait a moment...")
			say("")
				pc.remove_item(30251, 1)
				if  is_test_server()  then 
					pc.setqf("duration",get_time()+2) 
				else
					pc.setqf("duration",get_time()+60*60*8) -----------------------------------6hours
				end
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent = 15
				else		
					pass_percent = 60
				end
				local s= number(1,100)

				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 9 then     --less than 10
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)
						say_title("Seon-Pyeong:")
						say("")
						say("Oh Oh!! Excellent! You did a great job...")
						say("Now you need to bring "..10-pc.getqf("collect_count").. " more!!")
						say("Keep up the good work!")
						say("")
						pc.setqf("drink_drug",0)	 --Potion reset
					else
					pc.setqf("duration", 0) 
					say_title("Seon-Pyeong:")
					say("")
					say("You have collected all 10 gems!")
					say("")
					say("Now please choose a reward!")
					say("")
					pc.setqf("collect_count",10)
					local s=select("Health +1000","Defence +300","Attack +100")
					if 1 == s then
						affect.add_collect(1, 1000, 60*60*24*365*60) --hp+1000  Hp is 1 
						pc.setqf("block_id",1)
					elseif 2 == s then
						affect.add_collect(apply.DEF_GRADE_BONUS, 300, 60*60*24*365*60) 
						pc.setqf("block_id",2)
					elseif 3 == s then
						affect.add_collect(apply.ATT_GRADE_BONUS,100,60*60*24*365*60)--60years		
						pc.setqf("block_id",3)
				    end
					clear_letter()
					set_quest_state("collect_quest_lv94", "run")
					set_state(__complete2__)
					end
					return
				else								
					pc.setqf("drink_drug",0)	 --Potion reset
					say("Seon-Pyeong:")
					say("I'm sorry but this is a fake one..")
					say("Please get me another one")
					say("")				   
					return
				end
	end
end
	
	state __complete begin
	end
	state __complete2__ begin
	end
end