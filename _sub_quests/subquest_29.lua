----------------------------------------------------
-- SUB QUEST_29
-- LV  32 
-- Defeating Black Wind Soldier
----------------------------------------------------

quest subquest_29 begin
	state start begin
		when login or levelup or enter with pc.get_level() >=32  and pc.get_level() <= 34 begin
			 set_state( information )
		end
	end

	state information begin
		when letter begin
					
			local v = find_npc_by_vnum(20355)

			if v != 0 then
				target.vid("__TARGET__", v, "Go to the Captain")
			end
		end

				
		when __TARGET__.target.click or
			20355.chat."Hey, come see me" with pc.level >= 32 begin
			target.delete("__TARGET__")
			--                                                  |
			say("")
			say(" the Captain :")
			say("I get the news that there are lots of Black Wind activities")
			say("around town2.")
			say("Now it's Black Wind guys ")
			say("after White Oath guys.")
			say("These guys are worse then the White Oath.")
			say("Even We can't")
			say("attack them so easily.")
			say("Now is the time to show your ability of")
			say("elite soldier of this kingdom.")
			say("Don't you think?.")
			wait()
			say("")
			say(" the Captain :")
			say("For the safety of the town")
			say("Get 100 of Evil Bl.storm archers.")
			say("Then I will believe your ability")
			say("as an elite soldier.")
			say("Of course I will report to higher")
			say("and get you good rewards.")
			say("So I will wait for the good news.")	
			say("")
			local s=select("Accept.","Refuse.")
			if 2==s then
				say("Would you like to give up the quest?")
				local a=select("Yes","No")
				if  2==a then
					say(" the Captain:")
					say("Hmm... If you can't do this now, can you stop by later??")
					say("I can't find someone like you..")
					return
				end
				say(" the Captain:")
				say("You can't? Yeah..")
				say("Then how can I catch those guys...")
				set_state(__GIVEUP__)
				return
			end
			say(" the Captain:")
			say("I knew you are going to accept")
			say("They will collapse if you get their 100 archers.")
			say("Good luck")	
			say("")
			pc.setqf("kill_count", 0)
			q.set_counter("Remained Evil bl.Storm Archers",0)
			set_state(goto_blackwind)

		end	
	end
	state goto_blackwind begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("Get Evil bl.Storm Archers")
			q.set_title("Get Evil bl.Storm Archers")
			q.start()
		end

		when info or button begin
			say(locale.NOTICE_COLOR.."Get Evil bl.Storm Archers"..locale.NORMAL_COLOR)
		--													|				
			say("There are lots of Black wind activities")
			say("around town2 .")
			say("For the safety of the town people")
			say("We have to get rid of Black Wind.")
			say("Mission is to arrest ")
			say("100 evil Bl.storm archers.")
			say("")
			say_reward("Current evil Bl.storm archer".. " "..pc.getqf("kill_count").." has been captured")
			
		end
		when 11004.chat."Get Evil bl.Storm Archers" with pc.level >=32 begin
			say("Have you got 100 Evil bl.Storm Archers?")
			local s=select("Try again","Give up")
			if 2==s then
				say("Would you like to give up the quest?")
				local a=select("Yes","No")
				if  2==a then
					say(" the Captain:")
					say("It's not easy to deal with 100 evil bl.strom archers...")
					say("But we need to get at least 100..")
					say("Do you want to try again after a short while ?")
					return
				end
				say(" the Captain")
				say("They must be really strong")
				say("Good bye~")
				set_state(__GIVEUP__)
				return
			end
			say(" the Captain:")
			say("You're so brave")
			say("I believe you can take care of those evil bl. storm archers")
			say("")
		end
		
		when 453.kill  begin
			local count=pc.getqf("kill_count")+1
			if count<=100  then	
				pc.setqf("kill_count",count)
				q.set_counter("Remained Evil bl.Storm Archers",100-count)
				if count== 100 then
					set_state(go_back_to_boss)
				end
			end	
		end
	end

	state go_back_to_boss begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("Got 100 Evil bl.Storm Archers")
			q.set_title("Got 100 Evil bl.Storm Archers")
			q.start()
			local v = find_npc_by_vnum(20355)

			if v != 0 then
				target.vid("__TARGET__", v, "Go to the captain")
			end

		end

		when info or button begin
			say(locale.NOTICE_COLOR.."Got Evil bl.Storm Archers"..locale.NORMAL_COLOR)
			say("Go to the captain and report")
			say("about the archers")
			say("")
		end
		
		when __TARGET__.target.click or
			20355.chat."Report of defeating Bl.storm archers" begin
			target.delete("__TARGET__")
			say_title("Captain:")
			say("")
			say("Haha. You have grown up. An elite solider of our kingdom.")
			say("I was right.")
			say("I knew that you're going to be great.")
			say("Keep up the good work.")
			say("And.. This is the reward from the higher")
			say("")
			
			say_reward("Gained 25.000 Yang.")
			pc.change_money(25000)
			
			say_reward("Gained 400.000 EXP point.")
			pc.give_exp2(400000)
			
			set_quest_state("levelup","run")

			pc.setqf("kill_count", 0)
			
			say_reward("Received medicine herbs.")
            		pc.give_item2(50724,5)
            		pc.give_item2(50723,5)
			
			say_reward("Received Quest Potion.")
			pc.give_item2(71035)
			set_state(COMPLETE)
			clear_letter()
		end

		end
	state __GIVEUP__ begin
	end
	state COMPLETE begin
	end
end

