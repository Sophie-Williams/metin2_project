----------------------------------------------------
--COLLECT QUEST_lv70
--METIN2 Collecting Quest
----------------------------------------------------
quest collect_quest_lv70  begin
        state start begin
        end
        state run begin
                when login or levelup with pc.level >= 70  begin
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
                        say("looks for your help urgently.")
                        say("Hurry up and help him.")
                        say("")
                end

                when __TARGET__.target.click or
                        20084.chat."Listen" begin
                        target.delete("__TARGET__")
                        say_title("Chaegirab:")
						say("")
                        ---                                                   l
						say("Oh hello again!")
                        say("I really appreciate all your help.")
                        say("This time I write about the Ghost Forest..")
                        say("Actually I should do the examination on my own,")
						say("but I cannot. Could you do this for me? Of course")
                        say("you will receive a good reward for helping me.")
                        say("")
                        say("")
                        wait()
						say_title("Chaegirab:")
						say("")
                        say("Tell me about the Ghost Forest.")
                        say("I would like to know more about the Ghost")
						say("Forest. This Forest was once a big grove.")
						say("Before the metin stones came down, it was full of")
						say("dark energy.")
                        say("It was terrorised by a dark ghost in former")
                        say("times. You will need to find the Ghost Tree")
                        say("Branch for my investigation")
                        say("")
                        wait()
                        say_title("Chaegirab:")
						say("")
                        say("How long will you need to bring me the Ghost Tree")
						say("Branch? But don't bring me any broken or too")
						say("thin ones.")
						say("Those branches I cannot use...")
                        say("For my research I need altogether 25 branches.")
                        say("Good luck then.")
                        say("")
                        say("")
                        set_state(go_to_disciple)
                        pc.setqf("duration",0)  
						pc.setqf("collect_count",0)
                        pc.setqf("drink_drug",0) 
                        end
        end

        state go_to_disciple begin
                when letter begin
					send_letter("&The investigation of the Biologist")
                end
                when button or info begin
					say_title("I want to know something about the Ghost Forest.")
                        ---                                                   l
                    say("")
					say("Chaegirab, the apprentice of Uriel, is inspecting")
					say("the Ghost Forest.")
					say("He needs branches from the Ghost Forest for his")
					say("examinations. The entry of the forest is blocked")
					say("by Trees with very special skills.")
					say("Bring 25 Ghost Tree Branch to Chaegirap,")
					say("but only one at a time.")
                    say_item_vnum(30165)
                    say_reward("You already collected "..pc.getqf("collect_count").." branches.")
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
                    if pc.count_item(30165)==0 then
                        syschat("You can use the Quest Potion once you got a Ghost Tree Branch.")
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
			syschat("You have used a Red Monocle. You can give the next Ghost Tree Branch to Chaegirab.")
		end
				
		when 2301.kill or 
			 2302.kill or
			 2303.kill or
			 2304.kill or
			 2305.kill begin
			local s = number(1, 200)
			if s == 1 then
				pc.give_item2(30165)
                send_letter("&You found the "..item_name(30165).. ".")
			end	
		end

		when 20084.chat."GM: collect_quest_lv70.skip_delay" with pc.count_item(30165) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
			say(mob_name(20084))
			say("You are GM, OK")
			pc.setqf("duration", get_time()-1)
			return
		end
         	when 20084.chat."Have you brought the branches? " with pc.count_item(30165) >0   begin
                        if get_time() > pc.getqf("duration") then
                                say("Chaegirab")
                                ---                                                   l
                                say("Oh!! You brought me a branch...")
                                say("I have to check it...")
                                say("One moment please...")
                                say("")
                                pc.remove_item(30165, 1)
                                pc.setqf("duration",get_time()+60*60*14)                             
								wait()
                                local pass_percent
                                if pc.getqf("drink_drug")==0 then
                                        pass_percent=60
                                else
                                        pass_percent=90
                                end

				local s= number(1,100)
                                if s<= pass_percent  then
                                	if pc.getqf("collect_count")< 24 then                                                     
						local index =pc.getqf("collect_count")+1
                                       		pc.setqf("collect_count",index)     
                                       		say_title("Chaegirab:")
						say("Oh!! Wonderful! Thank you...")
						say("There are only".." "..25-pc.getqf("collect_count").. " left.")
						say("Good Luck!")
						say("")
						pc.setqf("drink_drug",0)        
						return
                                        end
                                        say_title("Chaegirab:")
					say("")
                                        ---                                                   l
					say("You have collected all 25 branches!!")
                                        say("There is only the Ghost's Soul Stone from the")
					say("Ghost Trees left. It has the function of a key.")
                                        say("The Ghost Soul Stone can be fetched from Ghost")
                                        say("Trees. Can you collect one for me?")
                                        say("")
                                        pc.setqf("collect_count",0)
                                        pc.setqf("drink_drug",0)
                                        pc.setqf("duration",0)
                                        set_state(key_item)
                                        return
                                else
					say_title("Chaegirap:")
					say("")
					say("Hmm...")
					say("I am sorry. I cannot use this one..")
					say("It is very thin and broken multiple times..")
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
					say("I still haven't verified the last branch.")
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

                        if pc.count_item(30224)>0 then
                                local v = find_npc_by_vnum(20084)
                                if v != 0 then
                                        target.vid("__TARGET__", v, "Chaegirap")
                                end
                        end

                end
                when button or info begin
                        if pc.count_item(30224) >0 then
                                say_title("The Ghost's Soul Stone")
                                say("")
                                ---                                                   l
                                say("The Ghost's Soul Stone from the Ghost Trees.")
                                say("Finally you have found the Ghost's Soul Stone.")
				say("Give it to Chaegirab.")
                                say("")
                                return
                        end

                        say_title("The Ghost's Soul Stone")
                        say("")
                        ---                                                   l
                        say("For Chaegirabs examination you have collected 25")
                        say("branches from the Ghost Forest.")
                        say("The last thing he needs is a Ghost's Soul Stone,")
                        say_item_vnum(30224)----------The Ghost��s Soul Stone
                        say("from the Ghost Trees.")
                        say("")
                        say("Find it and give it to Chaegirab.")
                        say("")
                end



		when 2301.kill or
			 2302.kill or
			 2303.kill or
			 2304.kill or
			 2305.kill begin 
                        local s = number(1, 400)
                        if s == 1 and pc.count_item(30224)==0 then
                                pc.give_item2(30224)
                                send_letter("&You won the Ghost's Soul Stone.")
                        end
                end



                when __TARGET__.target.click  or
                        20084.chat."You have found the Ghost's Soul Stone." with pc.count_item(30224) > 0  begin
                    target.delete("__TARGET__")
			say_title("Chaegirap:")
			say("")
		  	---                                                   l
                        say("Oh!!! Thank you very much...")
                        say("As reward I will raise your inner strength")
                        say("This is a secret recipe, which contains the")
			say("Information about strength potion.")
			say("")
                        say("Give it to Baek-Go. He will produce a special")
			say("potion. Have fun!")
                        say("Thank you, now I am more familiar with the")
			say("Ghost Forest.")
                        say("")
                        pc.remove_item(30224,1)
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
                        ---                                                   l
                        say("As reward for the 25 branches from the Ghost ")
			say("Forest and for the Ghost's Soul Stone from the")
			say("Ghost Trees, Biologist Chaegirap gave you a")
			say("recipe for a secret potion.")
                        say("Please give this to Baek-Go, he will create the")
			say("potion.")
                        say("")
                end

                when __TARGET__.target.click  or
                        20018.chat."The Secret Recipe"  begin
                    target.delete("__TARGET__")
                        say_title("Baek-Go:")
			say("")
			---                                                   l
                        say("Let me have a look..")
                        say("Is this the recipe Chaegirab gave you?")
                        say("Hmm, Defense +10% and Movement Speed +11")
                        say("Here we go again.")
                        say("")
                        wait()
                        say_title("Baek-Go:")
			say("")
                        say("This time, you also get a Dark Green Ebony box.")
                        say("Here you are.")
                        say("")
                        say_reward("As reward for Chaegirab's quest, you receive")
                        say_reward("+11 movement Speed and +10% defense bonus.")
			say("")
                        say_reward("These strengths are not temporary, but eternal.")
                        say("")
			affect.add_collect(apply.MOV_SPEED,11,60*60*24*365*60)	
			affect.add_collect_point(POINT_DEF_BONUS,10,60*60*24*365*60) --60��		
                        pc.give_item2(50113)
                        clear_letter()
                        set_quest_state("collect_quest_lv80", "run")
                        set_state(__complete)
                end

        end


        state __complete begin
        end
end
