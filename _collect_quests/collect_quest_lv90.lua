----------------------------------------------------
--COLLECT QUEST_lv90
--METIN2 Collecting Quest  
----------------------------------------------------
quest collect_quest_lv90  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 90  begin
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
			send_letter("&Chaegirab's favor")
		end

		when button or info begin
			say("")
			say("Uriel's apprentice Chaegirab")
			say("is looking for you again")
			say("Go and find out what is going on and provide help if it's needed.")
			say("")
		end
		
		when __TARGET__.target.click or
			20084.chat."Please listen" begin
			target.delete("__TARGET__")
			---                                                   l
			say_title("Chaegirab:")
			say("")
			say("I really appreciate you for going through")
			say("all the deadly quests just to do my favour!")
			say("Because of the help from heroes like you I")
			say("am almost finished with my research.")
			say("")
			say("This would be my last request to you. ")
			say("")
			wait()
			say_title("Chaegirab:")
			say("")
			say("What I need is Notices of the Plague King!")
			say("Please let me finish my research on creatures!")
			say("")
			say("But be warned that I can't take fake ones.")
			say("I need 50 genuine ones for my research.")
			say("I will reward you as much as I can for this.")
			say("")
			say("After all, who would you be without me?")
			say("")																																						  
			set_state(go_to_disciple)
			pc.setqf("duration",0)  -- Time limit
			pc.setqf("collect_count",0)--Items collected
			pc.setqf("drink_drug",0) --quest potion 1
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Chaegirab's Research")
			
		end
		when button or info begin
			say_title("Find out about the boss monster")
			---                                                   l
			say("")
			say("Uriel's apprentice Chaegirab is researching ")
		    	say("about the boss monsters!")
			say("Collect 50 of Notices of Plague King from:")
			say(mob_name(1093)..", "..mob_name(2307)..", "..mob_name(1304)..", ")
			say(mob_name(2091)..", "..mob_name(2092)..", "..mob_name(2191)..", ")
			say(mob_name(2206).." and "..mob_name(1901)..".")
		
			say_item_vnum(30168) 
			say_reward("Currently".." "..pc.getqf("collect_count").." collected.")
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
                    if pc.count_item(30168)==0 then
                        syschat("You can use the Quest Potion once you got a Notice of Plague King.")
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
			syschat("You have used a Red Monocle. You can give the next Notice of Plague King to Chaegirab.")
		end

		when 691.kill or 1093.kill or 2307.kill or 1304.kill or 2091.kill or 2092.kill or 2191.kill or 2206.kill or 1901.kill begin
			local s = number(1, 100)
			if s <= 25 then
				pc.give_item2(30168, 1)
				send_letter("&You have obtained Notice of Plague King!")		
			end	
		end

		
    	when 20084.chat."Did you bring the Notice of Plague King? " with pc.count_item(30168) >0   begin
			if get_time() > pc.getqf("duration") then
				if  pc.count_item(30168) >0 then
				say_title("Chaegirab:")
				---                                                   l
				say("")
				say("Oh!! You have brought one...")
				say("Let me take a look at this...")
				say("Please wait a moment...")
				say("")
				pc.remove_item(30168, 1)
				if  is_test_server()  then 
					pc.setqf("duration",get_time()+2) 
				else
					pc.setqf("duration",get_time()+60*60*20) -----------------------------------22hours
				end
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
				else		
					pass_percent=90
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 49 then     --less than 50 
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index) 
						say_title("Chaegirab:")
						say("")
						say("Oh, Oh!! Excellent! You did a great job...")
						say("Now you need to bring".." "..50-pc.getqf("collect_count").. " more!!")
						say("Thanks!")
						say("")
						pc.setqf("drink_drug",0)	 --Potion reset

						return
					end
					say_title("Chaegirab:")
					say("")
					say("You have collected all 50!!")
					say("Now I need the key item for this research:")
					say_item("Plagued King Soul Stone",30227,"")
					say("")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					set_state(key_item)
					return
				else								
				say_title("Chaegirab:")
				say("")
				say("I am sorry but this is a fake one..")
				say("Please get me another one")
				say("")				   
				pc.setqf("drink_drug",0)	 --Potion reset
				return
				end
				else
					say_title("Chaegirab:")
					say("")
					say("Please come when you find "..item_name(30168)..".")
					return
				end
		  else
                  say_title("Chaegirab:")
		  say("")
		  ---                                                   l
                  say("Oh, my bad. I still could not read the last")
                  say("Notice that you brought me.")
                  say("I am very sorry... Can you give me that one")
                local hoursleft = (pc.getqf("duration")-get_time())*60*60
                if hoursleft > 12 then
                	say("tomorrow?")
                elseif hoursleft < 1 then
                	say("in a few minutes?")
                else
		  	say("a few hours later on?")
		  end
                  say("")
                  say("I hope you're not angry at me! hehe")
                  say("")
                  return
                end

	end
end


	state key_item begin
		when letter begin
			send_letter("&Chaegirab's research")
			
			if pc.count_item(30227)>0 then	
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Chaegirab")
				end
			end

		end
		when button or info begin
			if pc.count_item(30227) >0 then
				say_title("Obtained The plague king soul stone")
				say("")
				---                                                   l
				say("At last I have obtained The Plague King Soul")
				say("Stone! Let's bring this to Chaegirab!")
				say("")
				return
			end

			say_title("I need the Plague King soul stone")
			say("")
			---                                                   l
			say("For the research of Chaegirab, Uriel's apprentice, ")
			say("I have delivered 50 notice of plague king")
			say("The last item I need is The plague king soul stone!")
			say_item_vnum(30227)----------The plague king soul stone
			say("You can get this from "..mob_name(1304)..", "..mob_name(1093).." ")
			say("and "..mob_name(1901)..".")
			say("")
		end
		when 1093.kill or  1304.kill or	 1901.kill  begin
			local s = number(1, 100)
			if s <= 30 and pc.count_item(30227)==0 then
				pc.give_item2(30227, 1)
				send_letter("&You have obtained Plague King soul stone")		
			end	
		end



		
		when __TARGET__.target.click  or
			20084.chat."Brought The plague king soul stone" with pc.count_item(30227) > 0  begin
		    target.delete("__TARGET__")
			if pc.count_item(30227) > 0 then 
			say_title("Chaegirab:")
			say("")
			say("OHOHOH!!! Great work..")
			say("I would like to increase your stats as a reward..")
			say("Here is the prescription for a drug that will")
			say("strenghten you permanently.")
			say("")
			say("Bring this to Baek-go and have a good day.")
			say("")
			say("With your help, I can finally finish my research")
			say("God bless you.")
			say("")
			pc.remove_item(30227,1)
			set_state(__reward)
			else
				say_title("Chaegirab:")
				say("")
				say("Bring me the "..item_name(30227)..", please.")
				say("")
				return
			end
		end
		
	end
	
	state __reward begin
		when letter begin
			send_letter("&Chaegirab's reward")
			
			local v = find_npc_by_vnum(20018)
			if v != 0 then
				target.vid("__TARGET__", v, "Baek-go")
			end

		end
		when button or info begin
			say("Get Chaegirab's reward")
			say("")
			---                                                   l
			say("For Chaegirab's research, you have delivered")
			say("50 Notice of plague king and a Plague King soul")
			say("stone. As a reward for that, Chaegirab gave you")
			say("a prescription to rise your strenghts.")
			say("")
			say("Go to Baek-go and show him this prescription.")
			say("")
		end
		
		when __TARGET__.target.click  or
			20018.chat."Take a look at this prescription"  begin
		    target.delete("__TARGET__")
			say_title("Baek-go:")
			say("")
			say("Let me see..")
			say("Prescription from Chaegirab?")
			say("")
			say("This brew will provide you with increased")
			say("strength against every human opponent!")
			say("")
			say("There you go!")
			say("")
			wait()
			say_title("Baek-go:")
			say("")
			say("And have a Blue Ebony Box as a gift from me.")
			say("")
			say("Please open it!")
			say("")
			say_reward("As a reward for doing Chaegirab's favor your")
			say_reward("strength against other characters increased by 8%")
			say("")
			say_reward("This is a permanent effect.")
			affect.add_collect_point(POINT_ATTBONUS_WARRIOR,8,60*60*24*365*60)
			affect.add_collect_point(POINT_ATTBONUS_ASSASSIN,8,60*60*24*365*60)
			affect.add_collect_point(POINT_ATTBONUS_SURA,8,60*60*24*365*60)	
			affect.add_collect_point(POINT_ATTBONUS_SHAMAN,8,60*60*24*365*60)
			pc.give_item2(50114)
			clear_letter()
			set_quest_state("collect_quest_lv92", "run")
			set_state(__complete)
		end
			
	end

	
	state __complete begin
	end
end


