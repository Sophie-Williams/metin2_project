-------------------------------------------------
--SUB QUEST
--LV 52
--Spider web of Yu-hwan's Instrument
-------------------------------------------------
quest subquest_28 begin
	state start begin
		when login or levelup with pc.level >=52   and pc.level <= 54 begin
			set_state(information)
		end
	end

	state information begin
		when letter begin
			local v=find_npc_by_vnum(20017)
			if 0==v then
			else
				target.vid("__TARGET__", v, "")
			end
		end

		when __TARGET__.target.click or
			20017.chat."This sound is not as good as before" begin
			target.delete("__TARGET__")
			say("Yu-hwan:")
			say("Ding Ding Ding")
			say("Argh! This is not the sound..")
			say("So depressing...")
			say("My friend blacksmith will understand me..")
			say("")
			set_state(to_weaponshop)
		end
	end

	state to_weaponshop begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("Go to Blacksmith")
			q.set_title("Go to Blacksmith")
			q.start()
			
			local v=find_npc_by_vnum(20016)
			if 0==v then
			else
				target.vid("__TARGET__", v, "")
			end

		end
		when info or button begin
			say(locale.NOTICE_COLOR.."Go to Blacksmith"..locale.NORMAL_COLOR)
			say("")
			say("Go to Blacksmith and ask")
			say("Why Yu-hwan is so depressed")
			say("")
		end

		
		when __TARGET__.target.click or
			20016.chat."Yu-hwan?I'm so depressed"begin
			target.delete("__TARGET__")
			say("Blacksmith:")
			say("Ah !!Yu-hwan?")
			say("It's because of the instrument")
			say("He always playing it day and night")
			say("Instrument is tired.")
			say("It would be better if he can change the strings...")
			say("Recently Yu-hwan doesn't play anymore")
			say("This town got depressed as well...")
			say("")	
			set_state(back_to_yuhwan)

		end
	end
	state back_to_yuhwan begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("Go back to Yu-hwan the musician")
			q.set_title("Go back to Yu-hwan the musician")
			q.start()
		
			local v=find_npc_by_vnum(20017)
			if 0==v then
			else
				target.vid("__TARGET__", v, "Go back to Yu-hwan the musician")
			end


		end
		
		when info or  button begin
			say(locale.NOTICE_COLOR.."Go back to Yu-hwan the musician"..locale.NORMAL_COLOR)
			say("Go back to depressed Yu-hwan the musician")
			say("who can't play his instrument")
			say("")
		end
		
		when __TARGET__.target.click or
			20017.chat."This intrument is the problem.." begin
			target.delete("__TARGET__")
			say("Yu-hwan:")
			say("Yes..")
			say("Reason is that I can't play the instrument any more.")
			say("Clear and beautiful sound..")
			say("But you can't make that sound with this broken strings")
			say("Can you make me play it once more?")
			say("This string is made out of Claw Spider's web..")
			say("Sigh...Never mind..")
			say("")
			local s=select("I will try","I'm sorry..." )
			if 2==s then
				say("Would you like to give up the quest?")
				local a=select("Yes","No")
				if  2==a then
					say("Yu-hwan:")
					say("You don't want to listen my music as well!")
					say("Come when you change your mind")
					say("I'll wait")
					say("")
					return
				end
				say("Yu-hwan:")
				say("Yeah..Never mind")
				say("Sigh")
				say("Thanks for listening to me anyway")
				say("Good bye")
				say("")
				set_state(__GIVEUP__)
				return
			end
					
			say("Yu-hwan:")
			say("Oh!!!!")
			say("Thanks!")
			say("If you can bring it")
			say("I can play the music once more!")
			say("HAHA")
			say("")
			set_state(find_spider)
			
		end

	end

		
		
		
	
	state find_spider begin
		when letter begin
			setskin(NOWINDOW)
			makequestbutton("Yu-hwan's Instrument")
			q.set_title("Yu-hwan's Instrument")
			q.start()
			
			if pc.count_item(30056)>0 then	
				local v=find_npc_by_vnum(20017)
				if 0!= v then
					target.vid("__TARGET__",v,"Go to Yu-hwan")
				end 
			end

		end
		when info or  button begin
			if pc.count_item(30056)>0 then	
				say(locale.NOTICE_COLOR.."Got the spiderweb"..locale.NORMAL_COLOR)
				say("")
				say("Spider web from the Mean Claw Poison Spider..")
				say("Let's bring this to Yu-hwan.")
				say("")
				return
			end
	
			say(locale.NOTICE_COLOR.."Catch the claw spider"..locale.NORMAL_COLOR)
			say("")
			say("Catch the Mean Claw Spider of Sahara Desert")
			say("Bring the spiderweb to Yu-hwan.")
			say("")
		end

		when 2054.kill  begin
			
			local s = number(1, 100)
			if s <= 5 and pc.count_item(30056)==0  then
				pc.give_item2(30056, 1)

			end
		end

		when __TARGET__.target.click or 
			20017.chat."Play the instrument" begin
			target.delete("__TARGET__")
			if  pc.count_item("30056")>=1 then 
				target.delete("__TARGET__")
				say("Yu-hwan:")
				say("Wha..")
				say("You got it")
				say("Thanks! Thanks!")
				say("Do you want to hear my music?")
				say("")
				pc.removeitem("30056",1)
				say_reward("Gained Experience points 2.800.000")
				pc.give_exp2(2800000)
				set_quest_state("levelup","run")
				
				say_reward("Got medicine herbs.")
				pc.give_item2(50725,5)
				pc.give_item2(50726,5)
				say_reward("Got Exorcism Scroll.")
				pc.give_item2(71001)
				clear_letter()
				set_state(__COMPLETE__)
				return
			else
				say("Yu-hwan:")
				say("You haven't got it!")
				say("I didn't know this was so hard for you?")
				say("")
				local s=select("Try again","Give up" )
				if 2==s then
					say("Would you like to give up the quest?")
					local a=select("Yes","No")
					if  2==a then
						say("Yu-hwan:")
						say("What an angry bunch of claw spiders?")
						say("Seems like they have been stronger...")
						say("Try again")
						say("")
						return
					end
					say("Yu-hwan:")
					say("Are you sure?")
					say("I thought you could do it..")
					say("You can do anything with the claw spiders, I guess")
					say("Well... thanks anyway")
					say("")
					set_state(__GIVEUP__)
					return
				end
						
				say("Yu-hwan:")
				say("Thanks! I'll be counting on you.")
				say("")
			end

		end
	end	
  state __GIVEUP__ begin
  end
  state __COMPLETE__ begin
	  when enter begin
		q.done()
	  end
	  
  end
  end
  
