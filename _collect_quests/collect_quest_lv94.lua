----------------------------------------------------
--COLLECT QUEST_lv94
--METIN2 Collection Quest
----------------------------------------------------
quest collect_quest_lv94  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 94  begin
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
			say("Seon-Pyeong")
			say("Oh.. Brave warrior! I was looking for you")
		      say("to get you help!!  ")
			say("Please help me! ")
			say("I have heard that monsters in Heaven Lair ")
			say("have gems for weapon research! ")
			say("")
			wait()
			say("Seon-Pyeong")
			say("The gems must be the perfect one! ")
			say("I will evaluate if you can bring me!")
			say("You must bring it! ")
			say("The gem I need is  White sky gem,")
		    say("And I need 10 of them!")
			say("Please!!")
			say("")
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --quest potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Seon-Pyeong's strange hobby")
			
		end
		when button or info begin
			say_title("Get White sky gems")
			---                                                   l
			say("Weapon collector Seon-Pyeong")
			say("is collecting gems for weapon research.")
			say("The gems can be collected from ")
			say("Heavens Archer and Heavens Commander.")
			say_item_vnum(30252) 
			say_reward("Currently".." "..pc.getqf("collect_count").." gems collected.")
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
                    if pc.count_item(30252)==0 then
                        syschat("You can use the Quest Potion once you got a White Sky Gem.")
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
			syschat("You have used a Red Monocle. You can give the next White Sky Gem to Chaegirab.")
		end

		when 2402.kill or
			 2404.kill  begin
			local s = number(1, 100)
			if s <= 1  then
				pc.give_item2(30252, 1)
				send_letter("&You have obtained the White Sky Gem!")		
			end	
		end

		
    	when 20091.chat."Did  you bring  the white sky gem? " with pc.count_item(30252) >0   begin
			if get_time() > pc.getqf("duration") then
				if  pc.count_item(30252) >0 then
				say("Seon-Pyeong")
				---                                                   l
				say("Oh!! You have brought...")
				say("Let me take a look at this...")
				say("Please wait a moment...")
				say("")
				pc.remove_item(30252, 1)
				if  is_test_server()  then 
					pc.setqf("duration",get_time()+2) 
				else
					pc.setqf("duration",get_time()+60*60*8) -----------------------------------6hours
				end
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=15
				else		
					pass_percent=50
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 9 then     --Less than 10 
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)     
						say("Seon-Pyeong:")
						say("Oh, Oh!! Excellent! You did a great job...")
						say("Now you need to bring".." "..10-pc.getqf("collect_count").. " more~!!")
						say("Keep up the good work~!")
						say("")
						pc.setqf("drink_drug",0)	 --Potion reset

						return
					end
					while true do
						say_title("Seon-Pyeong:")
						say("")
						say("You have collected all 10!")
						say("This is the reward for you!")
						say("Please chose:")
						say("")
						s2 = select("Health +1500","Defence +500","Attack +200")
						if 1== s2 then
							if pc.getf("collect_quest_lv92","block_id") == 1 then
								say_white("You can not pick the same reward twice.")
								wait()
							else
								affect.add_collect(1, 1500, 60*60*24*365*60) --hp+3000  hp is 1 
								pc.setf("collect_quest_lv94","block_id",1)
								break
							end
						elseif 2== s2 then
							if pc.getf("collect_quest_lv92","block_id") == 2 then
								say_white("You can not pick the same reward twice.")
								wait()
							else
								affect.add_collect(apply.DEF_GRADE_BONUS, 500, 60*60*24*365*60) 
								pc.setf("collect_quest_lv94","block_id",2)
								break
							end
						else 
							if pc.getf("collect_quest_lv92","block_id") == 3 then
								say_white("You can not pick the same reward twice.")
								wait()
							else
								affect.add_collect(apply.ATT_GRADE_BONUS,200,60*60*24*365*60)--60years
								pc.setf("collect_quest_lv94","block_id",3)
								break
							end
						end
					end
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					clear_letter()
					set_quest_state("collect_quest_lv96", "run")
					set_state(__complete2__)
					return
				else								
				say("Seon-Pyeong:")
				say("I am sorry but this is a fake one..")
				say("Please get me another one")
				say("")				   
				pc.setqf("drink_drug",0)	 --Potion reset
				return
				end
				else
					say("Chaegirab:")
					say(""..item_name(30252).."Please come when you find")
					return
				end
		  else
		  say("Seon-Pyeong:")
		  say("I'm so sorry....")
		  say("I haven't analysed them you gave me ")
		  say("last time.....")
		  say("Hmm.....Can you bring it later")
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


