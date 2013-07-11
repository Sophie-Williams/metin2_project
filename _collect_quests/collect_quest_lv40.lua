----------------------------------------------------
--COLLECT QUEST_lv40
--METIN2 Collecting Quest
----------------------------------------------------
quest collect_quest_lv40  begin
        state start begin
        end
        state run begin
                when login or levelup with pc.level >= 40  begin
                        set_state(information)
                end
        end
        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20084)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Biologist Chaegirab")
                        end
						q.set_icon("scroll_open_green.tga")
                        send_letter("&Innııın İsteği")
                end
                when button or info begin
                        say_title("Biologist Chaegirab")
                        say("")
                        say("Biologist Chaegirab, the apprentice of Uriel,")
                        say("looks for your help urgently.")
                        say("Hurry up and help him.")
                        say("")
                end
                when __TARGET__.target.click or
                        20084.chat."Listen" begin
                        target.delete("__TARGET__")
                        say_title("Biologist Chaegirab:")
                        say("")
                        ---                                                   l
                        say("Oh hello! I don't only collect information about")
                        say("monsters, I'm also writing a book about the")
                        say("different spells.")
                        say("I cannot handle it alone..")
                        say("Actually I should do the examination on my own,")
                        say("but I cannot. Could you do this for me? Of course")
                        say("you will receive a good reward for helping me.")
                        say("")
                        wait()
                        say_title("Biologist Chaegirab:")
                        say("")
                        ---                                                   l
			say("I would like to know more about the secret sect")
			say("that exists in the Dragon Valley...")
			say("")
			say("I think they know something about spells and")
			say("magic of the old age, especially about their")
			say("Curse Book. These books are surely the key that")
			say("is missing me. Please bring me always one book")
			say("at a time, so I can inspect it.")
			say("")
                        wait()
                        say_title("Biologist Chaegirab:")
                        say("")
                        say("But don't bring me any too old or damaged books.")
                        say("I cannot use them for my examination.")
                        say("For my research I need altogether 15 books.")
                        say("")
                        say("Only bring me one book at a time.")
                        say("")
                        set_state(go_to_disciple)
                        pc.setqf("duration",0) 
                        pc.setqf("collect_count",0)                        pc.setqf("drink_drug",0) 
                end
        end
        state go_to_disciple begin
                when letter begin
                        send_letter("&The examination of the Biologist")
                end
                when button or info begin
                        say_title("The spells of the old age.")
                        ---                                                   l
                        say("")
                        say("Chaegirab, the apprentice of Uriel, is examining")
			say("the spells of the old age in the Dragon Valley.")
                        say("")
                        say("Bring 15 Curse Book to Chaegirap, but only")
                        say("one at a time.")
                        say("")
                        say_item_vnum(30047)
                        say_reward("  Present".." "..pc.getqf("collect_count").."books collected")
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
                    if pc.count_item(30047)==0 then
                        syschat("You can use the Quest Potion once you got a Curse Book.")
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
			syschat("You have used a Red Monocle. You can give the next Curse Book to Chaegirab.")
		end

		when 20084.chat."GM: collect_quest_lv40.skip_delay" with pc.count_item(30047) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
			say(mob_name(20084))
			say("You are GM, OK")
			pc.setqf("duration", get_time()-1)
			return
		end
            when 20084.chat."The Curse Book" with pc.count_item(30047) >0   begin
                        if get_time() > pc.getqf("duration") then
							if  pc.count_item(30047) >0 then
                                say_title("Biologist Chaegirab:")
                                say("")
                                ---                                                   l
                                say("Oh!! You brought me a book...")
                                say("I have to check it...")
                                say("One moment please...")
                                say("")
                                pc.remove_item(30047, 1)
				pc.setqf("duration",get_time()+60*60*8) -----------------------------------22�ð�

				wait()
				
                                local pass_percent
                                if pc.getqf("drink_drug")==0 then
                                        pass_percent=70
                                else
                                        pass_percent=100
                                end
                                local s= number(1,100)
                                if s<= pass_percent  then
					if pc.getqf("collect_count")< 14 then         
						local index =pc.getqf("collect_count")+1
						pc.setqf("collect_count",index)     
						say_title("Chaegirab:")
						say("")
						say("Ohh!! Wonderful! Thank you...")
						say("There are only "..15-pc.getqf("collect_count").. " books left!")
						say("Good Luck!")
                                                say("")
                                                pc.setqf("drink_drug",0)         
                                                return
                                        end
                                        say_title("Biologist Chaegirab:")
                                        say("")
					say("You have collected all 15 books!!")
					say("There is only the Esoteric Soul Stone of the")
					say("temple left, it serves as a key to decipher")
					say("the Curse Books.")
					say("")
					say("The Esoteric Soul Stone can be fetched from the")
					say("Dragon Valley. Can you find one for me?")
                                        say("")
                                        say("")
                                        pc.setqf("collect_count",0)
                                        pc.setqf("drink_drug",0)
                                        pc.setqf("duration",0)
                                        set_state(key_item)
                                        return
                                else
                                say_title("Biologist Chaegirab:")
                                say("")
                                say("Hmm....this isn't good.")
                                say("I am sorry. I cannot use this one.")
                                say("Look here, the important parts are all ripped off.")
                                say("Please find another one.")
                                say("")
                                pc.setqf("drink_drug",0)         
                                return
                        end
				else
                    say_title("Biologist Chaegirab:")
					say("You don't have a"..item_name(30006).."!")
					return
				end
                else
                  say_title("Biologist Chaegirab:")
		  say("")
		  ---                                                   l
                  say("I am terribly sorry....")
                  say("I still have not deciphered the last book.")
                  say("I am very sorry... Can you give me another one")
                local hoursleft = (pc.getqf("duration")-get_time())*60*60
                if hoursleft > 12 then
                	say("tomorrow?")
                elseif hoursleft < 1 then
                	say("in a few minutes?")
                else
		  	say("a few hours later?")
		  end
                  say("")
                  return
                end
        end
end
        state key_item begin
                when letter begin
                        send_letter("&The examination of the Biologist")
                        if pc.count_item(30221)>0 then
                                local v = find_npc_by_vnum(20084)
                                if v != 0 then
                                        target.vid("__TARGET__", v, "Chaegirab")
                                end
                        end
                end
                when button or info begin
                        if pc.count_item(30221) >0 then
                                say_title("The Esoteric Soul Stone")
                                say("")
                                ---                                                   l
                                say("Finally you have found the Esoteric Soul Stone,")
                                say("give it to Chaegirab.")
                                say("")
                                return
                        end
                        say_title("The Esoteric Soul Stone")
                        say("")
                        ---                                                   l
			say("For Chaegirab's examination, you have collected")
			say("15 Curse Book, and the last thing he needs is")
			say("an Esoteric Soul Stone,")
			say("")
			say_item_vnum(30221)
			say("Give it to Chaegirab. You can obtain it from")
			say("the Esoterics in Dragon Valley.")
			say("")
                end
					when 701.kill or
						 702.kill or
						 703.kill or 
						 704.kill or
						 705.kill or
						 706.kill or
						 707.kill begin
                        local s = number(1, 300)
                        if s == 1 and pc.count_item(30221)==0 then
                                pc.give_item2(30221, 1)
                                send_letter("&You gained the Esoteric Soul Stone!")
                        end
                end
                when __TARGET__.target.click  or
                        20084.chat."You have found the Esoteric Soul Stone" with pc.count_item(30221) > 0  begin
                        target.delete("__TARGET__")
			if pc.count_item(30221) > 0 then 
			say_title("Biologist Chaegirab:")
			say("")
			say("Ohh!!! thank you very much..")
			say("As reward I will raise your inner strength ..")
			---                                                   l
			say("That's a secret recipe, which contains the")
			say("Information about strength...")
			say("Give it to Baek-Go. He will produce Strength")
			say("Potion. Have fun!")
			say("Thank you, now I am familiar with the spells of")
			say("the old age.")
                        say("")
                        pc.remove_item(30221,1)
                        set_state(__reward)
			else
				say_title("Biologist Chaegirab:")
				say("")
				say("You don't have a "..item_name(30221).."!")
				say("")
				return
			end
                end
        end
        state __reward begin
                when letter begin
                        send_letter("&The reward of Chaegirab")
                        local v = find_npc_by_vnum(20018)
                        if v != 0 then
                                target.vid("__TARGET__", v, "Baek-Go")
                        end
                end
                when button or info begin
                        say_title("The reward of Chaegirab")
                        ---                                                   l
			say("As reward for collecting the 15 Curse Books")
			say("and the Esoteric Soul Stone from the spiders,")
			say("Biologist Chaegirab gave you a recipe for a")
			say("secret potion.")
			say("")
			say("Please give this to Baek-Go, he will create the")
			say("potion.")
                        say("")
                end
                when __TARGET__.target.click  or
                        20018.chat."The Secret Recipe"  begin
                    target.delete("__TARGET__")
                        say_title("Baek-Go:")
                        say("")
                        say("Let me have a look..")
                        say("What is this recipe here for?")
                        say("Hmm, Attack Speed +5%...")
                        say("Oh! Here, have an Orange Ebony box.")
                        say("You are really a good guy.")
                        say("Here you are.")
                        say("")
			-----------                                                   l
			say_reward("As reward for Chaegirab's request, you received")
			say_reward("+5% on your attack speed. This reward is not")
			say_reward("temporary, but eternal.")
			affect.add_collect(apply.ATT_SPEED,5,60*60*24*365*60) --60��		
                        pc.give_item2(50110)
                        clear_letter()
                        set_quest_state("collect_quest_lv50", "run")
                        set_state(__complete)
                end
        end
        state __complete begin
        end
end
