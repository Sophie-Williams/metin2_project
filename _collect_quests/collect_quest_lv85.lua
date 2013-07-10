----------------------------------------------------
--COLLECT QUEST_lv85
--METIN2 Collection Quest
----------------------------------------------------
quest collect_quest_lv85  begin
	state start begin
	end
	state run begin
		when login or levelup with pc.level >= 85  begin
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
			----"12345678901234567890123456789012345678901234567890"|
			say_title("Chaegirab's request")
			say("")
			say("Uriel's apprentice, Chaegirab, is looking for you.")
			say("")
			say("Please find out what is going on and help him.")
			say("")
		end
		
		when __TARGET__.target.click or
			20084.chat."Please listen to me" begin
			target.delete("__TARGET__")
			say_title("Chaegirab:")
			say("")
		    	say("Ouch!!! Please listen to me...")
			say("I really appreciate for what you have done for me so far.")
			say("I'm writing a book about the Red Wood Forest..")
			say("I can't go further any more..")
		    	say("I need to go there and research my self..")
			say("But I, who is a biologist, am too weak to do it...")
			say("Please help me...")
			say("I will reward you as much as I can!")
			wait()
			say_title("Chaegirab:")
			say("")
			say("I would like to know about the Red Wood Forest..")
			say("That place was once a peaceful forest,")
			say("It was contaminated by the metin stone evil force")
			say("and turned into a cursed place with evil spirits.")
			say("You need to have the Red Wood Branch to find out more...")
			say("")
			wait()
			say_title("Chaegirab:")
			say("")
			say("Can you bring some of those Red Wood Branches in")
			say("the next few days?")
			say("If it's broken or too thin, I cannot accept it.")
			say("")
			say("I need 40 branches for the research...")
			say("Please!")
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
			say_title("Find out about the Red Wood Forest")
			say("")
			say("Chaegirab is researching about the Red Wood Forest.")
			say("There are giant trees with different powers.")
			say("Chaegirab needs the Red Wood Branch from the forest")
			say("Let's collect 40 branches for Chaegirab ")
			say("")
			say_item_vnum(30167) 
			say_reward("  Currently".." "..pc.getqf("collect_count").." branches collected.")
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
                    if pc.count_item(30167)==0 then
                        syschat("You can use the Quest Potion once you got a Red Wood Branch.")
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
			syschat("You have used a Red Monocle. You can give the next Red Wood Branch to Chaegirab.")
		end
		
		when 2311.kill or 2312.kill or 2313.kill or 2314.kill or 2315.kill begin 
			local s = number(1, 200)
			if s == 1  then
				pc.give_item2(30167)
				send_letter("&You have obtained a Red Wood Branch!")		
			end	
		end
		
    	when 20084.chat."Did you bring the Red Wood Branch? " with pc.count_item(30167) >0   begin
			if get_time() > pc.getqf("duration") then
				say_title("Chaegirab:")
				say("")
				say("Oh!! You have brought a branch for me!")
				say("Let me take a look at this!")
				say("Please hold there for a moment...")
				say("")
				pc.remove_item(30167, 1)
				if  is_test_server()  then 
					pc.setqf("duration",get_time()+2) 
				else
					pc.setqf("duration",get_time()+60*60*18) -----------------------------------22�ð�
				end
				wait()
				
				local pass_percent
				if pc.getqf("drink_drug")==0 then
					pass_percent=60
				else		
					pass_percent=95
				end
				
				local s= number(1,100)
				if s<= pass_percent  then
				   if pc.getqf("collect_count")< 39 then     --Less than 40 
						local index =pc.getqf("collect_count")+1 
						pc.setqf("collect_count",index)
						say_title("Chaegirab:")
						say("")
						say("Oh! Excellent! You did a great job...")
						say("Now you need to bring just "..40-pc.getqf("collect_count").. " more!!")
						say("Thanks!")
						say("")
						pc.setqf("drink_drug",0)	 --Potion reset
						return
					end
					say_title("Chaegirab:")
					say("")
					say("You have collected all 40!!")
					say("Now I need the key item for this research:")
					say("One Evil Soul Stone.")
					say("Can you do it?")	
					say("You can get the Evil Soul Stone ")
					say("from the Red Ghost Trees.")
					say("")
					pc.setqf("collect_count",0)
					pc.setqf("drink_drug",0)	
					pc.setqf("duration",0) 
					set_state(key_item)
					return
				else								
				say_title("Chaegirab:")
				say("")
				say("hmmm...")
				say("I'm sorry but I don't think I can use this branch..")
				say("It is too weak and broken..")
				say("Can you bring me a new one later?")
				say("")				   
				pc.setqf("drink_drug",0)	 --Reset potion
				return
				end
		else
                  say_title("Chaegirab:")
		  say("")
		  ---                                                   l
                  say("I am terribly sorry....")
                  say("I have not analysed the branches, you gave me.")
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
			send_letter("&Chaegirab's research")
			
			if pc.count_item(30226)>0 then	
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "Chaegirab")
				end
			end

		end
		when button or info begin
			if pc.count_item(30226) >0 then
				say_title("Obtained the Evil Soul Stone.")
				say("")
				---                                                   l
				say("At last I have collected the Evil Soul Stone")
				say("Let's bring this to Chaegirab.")
				say("")
				return
			end

			say_title("I need Evil Soul Stone")
			say("")
			---                                                   l
			say("For the research of Chaegirab, Uriel's apprentice, ")
			say("I have delivered 40 Red Wood branches")
			say("The last item I need is the Evil Soul Stone!")
			say_item_vnum(30226)
			say("I can get it by killing those red ghost trees!")	
			say("Let's bring this to Chaegirab")
			say("")
		end
		

	
		when 2311.kill or 2312.kill or  2313.kill or 2314.kill or 2315.kill  begin
			local s = number(1, 500)
			if s == 1 and pc.count_item(30226)==0 then
				pc.give_item2(30226)
				send_letter("&Obtained the Evil Soul Stone")		
			end	
		end


		
		when __TARGET__.target.click  or
			20084.chat."Brought the Evil Soul Stone" with pc.count_item(30226) > 0  begin
		    target.delete("__TARGET__")
			say_title("Chaegirab")
			say("")
			say("Awesome! Great work!!..")
			say("Here I would like to increase your stats as a reward.")
			say("Here is the prescription to increase your stats.")
			say("")
			say("You bring this to Baek-go..")
			say("Then Have a good day!")
			say("Your helps boosts my research so much!")
			say("")
			pc.remove_item(30226,1)
			set_state(__reward)
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
			say_title("Get Chaegirab's reward")
			---                                                   l
			say("For Chaegirab's research, you have delivered 40")
			say("Red Wood branches and an Evil Soul Stone.")
			say("As a reward for that, Chaegirab gave you a")
			say("prescription to increase your stats.")
			say("")
			say("Go to Baek-go to show the prescription")
			say("")
		end
		
		when __TARGET__.target.click  or
			20018.chat."Take a look at this prescription"  begin
		    target.delete("__TARGET__")
			say_title("Baek-go:")
			say("")
			say("Let me see..")
			say("Prescription from Chaegirab?")
			say("Hmm. It will increase 10% resistance to attacks")
			say("from other players.")
			say("")
			wait()
			say_title("Baek-go:")
			say("")
			say("And the Crimson Ebony Box!")
			say("Here you go.")
			say("")
			say_reward("As a reward for doing Chaegirab's favor")
			say_reward("your resistance on other player attacks")
			say_reward("has increased by 10%")
			say_reward("This is a permanent effect.")
			say("")
			pc.give_item2(50115) 
			clear_letter()
			affect.add_collect_point(POINT_RESIST_WARRIOR,10,60*60*24*365*60) --60��	
			affect.add_collect_point(POINT_RESIST_ASSASSIN,10,60*60*24*365*60) --60��	
			affect.add_collect_point(POINT_RESIST_SURA,10,60*60*24*365*60) --60��	
			affect.add_collect_point(POINT_RESIST_SHAMAN,10,60*60*24*365*60) --60��	
			set_quest_state("collect_quest_lv90", "run")
			set_state(__complete)
		end
	end

	state __complete begin
	end
end


