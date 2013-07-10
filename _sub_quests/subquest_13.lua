quest subquest_13 begin
        state start begin
                when login  or levelup with pc.level >= 21 and pc.level <= 26 begin
                        set_state(information)
                end

        end
        state information begin
                when letter begin
                        local v = find_npc_by_vnum(9001)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Find Materials for the weapons.")
                        end
                end


                when __TARGET__.target.click or
                        9001.chat."Materials for the weapons." with pc.level >= 21 begin
                        target.delete("__TARGET__")

                        say_title("Weapon Shop Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Hey, you! Could you do me a favour?")
                        say("")
                        say("I tried to make a new types of weapons. It is not easy to")
                        say("find the needed materials; I have lots of work myself and")
                        say("can't look for these materials.")
                        say("")
                        say("Could you get them for me?")
                        say("")
                        wait()

                        say_title("Weapon Shop Dealer:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Of course, I will reward you; as soon as the weapons are")
                        say("finished, I will give you one of them.")
                        say("")
                        say("I need the following materials: Copper Ore and Linen. You")
                        say("get Copper Ore from Uriel and Linen from Ariyoung.")
                        say("")
                        say("Let me know when you have everything.")
                        say("")

                        local s=select("I will do it.","I will not do it.")
                        if 2==s then
				say_title("Weapon Shop Dealer:")
				say("")
				say("You really do not want to do it?")
				say("")
                                local a=select("Yes I want!","Never")
                                if  1==a then
                                        say_title("Weapon Shop Dealer:")
                                        say("")
                                        say("I hope it's not too much for you.")
                                        say("See you later.")
                                        say("")
				else
					say_title("Weapon Shop Dealer:")
					say("")
					say("If you do not want to do it, nothing can be done.")
					say("")
					say("See you later.")
					say("")
					set_state(__GIVEUP__)
				end
                        else
				say_title("Weapon Shop Dealer:")
				say("")
				say("Great that you can do it. As soon as the weapons")
				say("are finished, you will get one.")
				say("")
				say("Good luck!")
				say("")
				set_state(get_weapon)
                        end

                end --when
        end  --state
-----------------------------------------------------------------------------------------------------------------------
        state get_weapon begin
                when letter begin
                        send_letter("Search for the materials.")
                        if        pc.getqf("iron_done") == 0  then
                                local v=find_npc_by_vnum(20011)
                                if 0==v then
                                else
                                        target.vid("__TARGET1__",v,"Go to Uriel.")
                                end
                        end
                        if        pc.getqf("cloth_done") == 0  then
                                local v=find_npc_by_vnum(20021)
                                if 0==v then
                                else
                                        target.vid("__TARGET2__",v,"Go to Ariyoung.")
                                end
                        end

                        if        pc.getqf("cloth_done") == 1  then
                                local v=find_npc_by_vnum(20003)
                                if 0==v then
                                else
                                        target.vid("__TARGET3__",v,"Go to Ah-Yu.")
                                end
                        end

                end


                when info or button begin

                        say_title("Information:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The Weapon Shop Dealer needs some materials.")
                        say("")
                        if pc.getqf("iron_done") < 2 then
                        	say("- You can get Copper Ore from Uriel.")
                        else
                        	say("- You already got Copper Ore from Uriel.")
                        end
                        say("")
                        if pc.getqf("cloth_done") < 2 then
                        	say("- You can get Linen from Ariyoung.")
                        else
                        	say("- You already got Linen from Ariyoung.")
                        end                        
                        say("")
                end
                when 20011.chat."I need Copper Ore" with pc.getf("subquest_13","iron_done")==0 begin
                        target.delete("__TARGET1__")
                        say_title("Uriel:")
                        say("")
                        say("You need Copper Ore?")
                        say("I could give you some if you do me a favour.")
                        say("")
                        wait()
                        say_title("Uriel:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The tigers have stolen my Sage Package.")
                        say("")
                        say("I had to run for my life, but inside the bag are important")
                        say("books. If I do not have these I can not examine the Metin")
                        say("Stones further.")
                        say("")
                        say("Bring me the bag and I will give you some Copper Ore.")
                        say("")
                        say_item_vnum("30134")
                        say("")
                        pc.setqf("iron_done",1)

                end
                when 20011.chat."Please give me the Copper Ore" with pc.getf("subquest_13","iron_done") == 1 begin
                        target.delete("__TARGET1__")
                        if pc.count_item("30134") >= 1 then
                                say_title("Uriel:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Thank you! I really ask you too often for a favour.")
                                say("")
                                say("Here, have some Copper Ore. I hope it will help you.")
                                say("")
                                pc.setqf("iron_done",2)
                                pc.remove_item("30134",1)
				if  pc.getqf("cloth_done") == 2 then
					set_state(back_to)
				end
                        else
                                say_title("Uriel:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("What? So you need Copper Ore? It does not grow on trees")
                                say("you know! I will give you some, but you have to do me")
                                say("a little favour.")
                                say("")
                                say("Tigers stole my Sage Package. I ran away to save my life.")
                                say("")
                                say("In this bag are important documents and without them I can")
                                say("not research the Metin Stones further.")
                                say("")
                                say("Please find the Sage Package they have stolen.")
                                say("")
                        end   --if
                end           --when

                when 114.kill  begin
                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30134")==0 and pc.getqf("iron_done") == 1 then
				say_title("I found the Sage Package")
				say("")
				say("You found the Sage Package of Uriel.")
				say("")
				say("Go back to him.")
				say("")
				pc.give_item2("30134", 1)
                        end
                end


                when 20021.chat."I need Linen" begin
                        target.delete("__TARGET2__")

                        if pc.getqf("cloth_done") == 0  then
                                say_title("Ariyoung:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("If you are searching for Linen, I can help you, but only if")
                                say("you do something for me first.")
                                say("")
                                say("Please give this letter to Ah-Yu. We have not seen each")
                                say("other for a while because she is busy with her child.")
                                say("She must have a hard time.")
                                say("")
                                say("If you deliver this letter to her, you can ask her for")
                                say("Linen for me. I don't need it, so you can keep it.")
				say("")
                                pc.setqf("cloth_done", 1)

                        end

                        if pc.getqf("cloth_done") == 2  then
                                say("Ariyoung:")
                                say("")
                                say("You surely got Linen from Ah-Yu, have you?")
                                say("")
                        end

                end

                when  20003.chat."Ariyoung's letter" with pc.getf("subquest_13","cloth_done") == 1 begin
                        target.delete("__TARGET3__")
                        say_title("Ah-Yu:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You brought me a letter from Ariyoung? Nice to hear from")
                        say("her after all this time. We often met for a chat in the past")
                        say("but recently it has been a bit difficult.")
                        say("")
                        say("Ah, she told you to ask me for Linen?")
                        say("")
                        say("One moment I will give it to you, then I should write back")
                        say("to her. Thanks for bringing the letter to me.")
                        say("")
                        say("Here is the Linen.")
                        say("")
			pc.setqf("cloth_done", 2)
			if pc.getqf("iron_done") == 2 then
				set_state(back_to)
			end
                end
	end
	state back_to begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("I have all the Materials.")
			q.set_title("Go to the Weapon Shop Dealer.")
			q.start()

			local v=find_npc_by_vnum(9001)
			if 0==v then
			else
				target.vid("__TARGET__",v,"Go to the Weapon Shop Dealer.")
			end
		end
		when info or button begin
			say_title("Give materials")
			say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say("I have all the Materials. Go to the Weapon Shop Dealer.")
			say("")
		end
		when __TARGET__.target.click or		
		9001.chat."Give materials" with pc.getf("subquest_13","cloth_done") == 2 and pc.getf("subquest_13","iron_done") == 2  begin
			target.delete("__TARGET__")
			say_title("Weapon Shop Dealer:")
				say("")
				----"123456789012345678901234567890123456789012345678901234567890"|
				say("Well done. You are really good and fast. Let me now work")
				say("on these weapons!")
				say("*hammering*")
				say("Here are the new weapons! I did my best.")
				say("")
				say("I hope you like the new weapon. Use it wisely!")
				say("")
				wait()
				say_title("Reward:")
				say("")
				say_reward("You received 100.000 Experience Points.")
				say_reward("You received 20.000 Yang.")


				pc.give_exp2(100000)
				set_quest_state("levelup","run")
				pc.change_money(20000)
				clear_letter()
				set_state(__COMPLETE__)

				if pc.job == 0 then
					pc.give_item2("55", 1)
					say_reward("You received a Broad Sword+5.")
				elseif pc.job == 1 then
					pc.give_item2("1025", 1)
					say_reward("You received a Scissors Dagger+5.")
				elseif pc.job == 2 then
					pc.give_item2("55", 1)
					say_reward("You received a Broad Sword+5.")
				elseif pc.job == 3 then
					pc.give_item2("7045", 1)
					say_reward("You received a Peacock Fan+5 .")
				end   --if
				say("")
				pc.setqf("cloth_done",0)
				pc.setqf("iron_done",0)
			end  --when
                end   --state
        state __COMPLETE__ begin
        end
        state __GIVEUP__ begin
        end
end
