----------------------------------------------------
-- SUB QUEST
-- LV 41
-- Peddler Quest
----------------------------------------------------

quest subquest_32 begin
        state start begin
                when login  or levelup with pc.level >= 41 and pc.level <= 43 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin

                        local v = find_npc_by_vnum(20010)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Peddler")
                        end
                end


                when __TARGET__.target.click or
                        20010.chat."Dealer's Choice" with pc.level >= 41 begin
                        target.delete("__TARGET__")
			----"123456789012345678901234567890123456789012345678901234567890"|
                        say_title("Peddler")
                        say("")
                        say("We keeling dealers have hard times during the war. We have")
                        say("to know which goods are needed. Don't you want to make some")
                        say("Yang? You know which goods are needed now?")
                        say("")
                        say("Necklaces made from teeth of Unggyis! That's how we call")
                        say("the Elite Orc Sorcerers living in the Dragon Valley. Their")
                        say("teeth are big and hard and are really good for several")
                        say("trinkets. At the moment, talismans for soldiers sought for.")
                        say("")
                        wait()
                        say_title("Peddler:")
                        say("")
                        say("What do you say? Can you get me some teeth so that I can")
                        say("make some of those necklaces? I also need another material")
                        say("to make the necklace, which is not easy to get; but the")
                        say("selling of those necklaces is a good business. If you get")
                        say("me the materials I will reward you dearly.")
                        say("")
                        say("So, what do you say, sounds good?")
                        say("")
                        wait()
                        say_title("Peddler:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("I need for that necklace Evil Tooth from Unggyi, a Materials")
                        say("Stone and some String. For the Evil Tooth, hunt the Elite Orc")
                        say("Sorcerer, Materials Stone you'll get from the General Dealer")
                        say("and String you can get from Ariyoung.")
                        say("")
                        say("I need 100 Evil Tooth and please ask that people I told you")
                        say("for for the other items. I have many orders, so please come")
                        say("back fast with the materials.")
                        say("")


                        local s=select("Accept.","Reject.")
                        if 2==s then
                                say("You want to give up?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Peddler:")
                                        say("")
                                        say("You are busy? Ok, I won't disturb you. Come back if")
                                        say("you have some time.")
                                        say("")
  
                                else
					say_title("Peddler")
					say("")
					say("Well. I don't know how I shall make it then.")
					say("")
					set_state(__GIVEUP__)
  				end
                        else
				say_title("Peddler")
				say("")
				say("Wonderful.")
				say("I will wait here for you.")
				say("")

				set_state(gogogo)
                        end
                end
        end
        state gogogo begin

                when letter begin
                        send_letter("Dealer Question")
                        if pc.getqf("sil_done") == 0 or pc.getqf("sil_done") ==2  then
                                local v=find_npc_by_vnum(20021)
                                if 0!=v then
                                        target.vid("__TARGET1__",v,"Go to Ariyoung")
                                end
                        end


                        if pc.getqf("sil_done")== 1  then

                                local v=find_npc_by_vnum(20003)
                                if 0!=v then
                                        target.vid("__TARGET3__",v,"Go to Ah-Yu")
                                end
                        end


                        if pc.count_item(30144) >=100 and pc.count_item(30143)>0  then

                                local v=find_npc_by_vnum(9003)
                                if 0==v then
                                        target.vid("__TARGET2__",v,"Go to the General Dealer")
                                end

                        end

                                if  pc.count_item(30139)>=100 and pc.count_item(30140)>0 and   pc.count_item(30141)>0  then
                                        set_state(all_item_done)
                        end


                end

                when info or button begin
                        say_title("Get Material")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("The Peddler says he needs materials to make necklaces from.")
			say("He needs 100 Evil Tooth from Elite Orc Sorcerer, Materials")
			say("Stone and String. For the Evil Tooth, hunt the Elite Orc")
			say("Sorcerers; for the Materials Stone ask the General Dealer,")
			say("and for the String ask Ariyoung.")
			say("")
                        say("When you have everything, take it to the Peddler.")
                        say("")

                end
                when 20021.chat."Give me String" with pc.getf("subquest_32","sil_done") == 0 begin
                        target.delete("__TARGET1__")

			say_title("Ariyoung:")
			say("")
			----"123456789012345678901234567890123456789012345678901234567890"|
			say("You look for String? That's easy to make.")
			say("But when I make String, I can't do my own duties...")
			say("Ah well, it's nothing big.")
			say("")
			wait()
			say_title("Ariyoung:")
			say("")
			say("I wanted to give my friend Ah-Yu these clothes. When I do")
			say("this, I have to leave my house. Would you go and carry")
			say("these clothes to Ah-Yu? I'd be rather happy.")
			say("")
			say("In the meantime I'd make you the String.")
			say("")

                        local s=select("Accept","Reject")
                        if 2==s then
				say_title("Ariyoung:")
				say("")
				say("You want to give up?")
				say("")
				local a=select("Yes","No")
				if  2==a then
					  say_title("Ariyoung:")
					  say("")
					  ----"123456789012345678901234567890123456789012345678901234567890"|
					  say("You accept the request of the Peddler, then come here and")
					  say("say no to me?")
					  say("")
					  say("If you reconsider this, come back again.")
					  say("")
                                else
					say_title("Ariyoung:")
					say("")
					say("Oh, I have hoped you'd do this for me.")
					say("You have other things to do?")
					say("Ah-Yu lives so far away...")
					say("Oh well, see you.")
					say("")
					set_state(__GIVEUP__)
                                end
                        else
				say_title("Ariyoung:")
				say("")
				----"123456789012345678901234567890123456789012345678901234567890"|
				say("You deliver her the clothes? Great, thanks a lot.")
				say("")
				say("I was a little sad, the clothes were finished for a while")
				say("but I didn't have the chance to bring them her. Thanks!")
				say("")
				pc.give_item2(30159)
				pc.setqf("sil_done",1)
			end
                end
                when 20021.chat."Give me String" with pc.getf("subquest_32","sil_done") == 1 begin
                                say_title("Ariyoung:")
                                say("")
                                say("You couldn't find Ah-Yu?")
                                say("She lives in the next village.")
                                say("Godspeed!")
                                say("")
                end
                when 20021.chat."Give me String" with pc.getf("subquest_32","sil_done") == 2 begin
                                target.delete("__TARGET1__")
                                say_title("Ariyoung:")
                                say("")
                                ----"123456789012345678901234567890123456789012345678901234567890"|
                                say("Ah-Yu is happy with her clothes? Then it was good to work")
                                say("hard. Here is your String.")
                                say("")
                                say("This is a strong String and can be used for many things.")
                                say("")
                                pc.give_item2(30140)
                                pc.setqf("sil_done",3)
                                if  pc.count_item(30141)>0 and  pc.count_item(30139)>=100 then
                                        set_state(all_item_done)
                                end
                end
                when 20021.chat."Give me String" with pc.getf("subquest_32","sil_done") == 3 begin
                                say_title("Ariyoung :")
                                say("")
                                say("You already got it.")

                end

                when 20003.chat."Clothes Delivery" with pc.count_item(30159)>0 begin
                        target.delete("__TARGET3__")
                        say_title("Ah-Yu:")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("Yes? Ariyoung sent you?")
                        say("")
                        say("Oh, she made wonderful clothes. Good friends should be kept")
                        say("forever! Thank you for bringing me these clothes, please")
                        say("tell Ariyoung I am very happy!")
                        say("")
                        pc.remove_item(30159)
                        pc.setqf("sil_done",2)
                end

                when 9003.chat."Give me the Material Stones" with pc.getf("subquest_32","jewel_done")==0  begin
                        target.delete("__TARGET2__")
                        say_title("General Dealer")
                        say("")
                        ----"123456789012345678901234567890123456789012345678901234567890"|
                        say("You look for")
                        say("Materials Stone? I can give you one piece of that when you")
                        say("help me. At the moment I am working on a medicine against")
                        say("pains but one ingredient is missing.")
                        say("")
                        say("That medicine needs the liver of a tiger.")
                        say("")
                        say("It is hard to get this.")
                        say("")
                        wait()
                        say_title("General Dealer")
                        say("")
                        say("Bring me some medical herbs and 100 Tiger Livers, then you")
                        say("will get a Materials Stone from me.")
                        say_item_vnum(30143)
                        say_item_vnum(30144)
                        say("Hunt tigers or white tigers.")
                        say("")
                        wait()
                        say_title("General Dealer:")
                        say("")
                        say("So, isn't it a fair trade? Hahaha..")
                        say("")
                          local s=select("Accept","Reject")
                          if 2==s then
                                say("You want to give up?")
                                local a=select("Yes","No")
				if  2==a then
					say_title("General Dealer:")
					say("")
					say("Is my task too hard?")
					say("Hey isn't that hard?")
					say("If you make up your mind")
					say("come back again.")
					say("")

				else
					say_title("General Dealer")
					say("")
					say("Ah, you come this long way here")
					say("because of the Peddler Quest...")
					say("So be it...")
					say("Have a nice day.")
					say("")
					set_state(__GIVEUP__)
				end

                         else
                                say_title("General Dealer")
                                say("")
                                say("Really, you help me?")
                                say("Thanks!")
                                say("Good Luck!")
                                say("")
                                pc.setqf("jewel_done",1)
                         end
                end

                when 9003.chat."I need a Materials Stone" with pc.getf("subquest_32","jewel_done")==1 and  pc.count_item(30143)>=1 and pc.count_item(30144)>=100 begin
                                target.delete("__TARGET2__")
                                say_title("General Dealer :")
                                say("")
                                say("You were really fast. Thanks.")
                                say("")
                                say("As promised, here is the Piece of Materials Stone.")
                                say("")
                                say("You think I'd ask if work was that easy?")
                                say("")

                                pc.give_item2(30141)

                                pc.remove_item(30143 ,1)
                                pc.remove_item(30144 ,100)
                                pc.setqf("jewel_done",2)


                                if pc.count_item(30140)>0  and  pc.count_item(30139)>=100 then
                                        set_state(all_item_done)
                                end
                end


        when 114.kill or 115.kill  begin
                                local s = number(1, 70)
                                if s <= 7 and pc.count_item(30144)<100  then
                                        pc.give_item2(30144, 2)
                                end

                                local a = number(1, 70)
                                if a <= 5 and pc.count_item(30143)== 0  then
                                        pc.give_item2(30143, 1)
                                end

                                        end


         when 634.kill  begin

                        local s = number(1, 70)
                        if s <= 7 and pc.count_item(30139)<100  then
                                pc.give_item2(30139, 2)

                                if pc.count_item(30139)>=100 and pc.count_item(30140)>0 and   pc.count_item(30141)>0 then
                                        set_state(all_item_done)
                                        return
                                end
                        end
                end

        end
        state all_item_done begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Get Material")
                        q.set_title("Return to the Peddler.")
                        q.start()

                        local v=find_npc_by_vnum(20010)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Return to the Peddler.")
                        end
                end
                when info or button begin
                        say_reward("Return to the Peddler.")
                        say("")
                        say_reward("I have all goods.")
                        say_reward("Off to the Peddler.")
                        say("")
                end

                when __TARGET__.target.click or
                        20010.chat."I have all Materials" begin
                        if pc.count_item(30140)>=1 and pc.count_item(30141)>=1 and  pc.count_item(30139) >= 100 then
                        	target.delete("__TARGET__")
                                say_title("Peddler")
                                say("")
                                say("You have everything?")
                                say("So, let me see...")
                                say("Yes, you really brought everything I needed.")
                                say("Thanks to you, I can enlarge my offers.")
                                say("Here is your share. You were really good, so I")
                                say("I will pay you accordingly.")
                                say("Now I can sell my goods.")
                                say("")

                                pc.remove_item(30140,1)
                                pc.remove_item(30141,1)
                                pc.remove_item(30139,100)

                                pc.setqf("jewel_done",0)
                                pc.setqf("sil_done",0)
				
				say_reward("You received 500.000 Yang.")
				pc.change_money(500000)
                                say_reward("You received 3.000.000 Experience Points.")
                                pc.give_exp2(3000000)
                                set_quest_state("levelup","run")

				say_reward("You received 3 hour Experience Ring.")
				pc.give_item2(72003)

                                set_state(THEEND)
                                clear_letter()

			else
                            	target.delete("__TARGET__")
                                say_title("Peddler :")
                                say("")
                                say("Something is missing...")
                                say("Have you lost something?")
                                say("You try again?")
                                say("")
                                local s=select("Accept","Reject")
                                if 2==s then
					say("Do you really want to cancel the Quest?")
					local a=select("Yes","No")
					if  2==a then
						say_title("Peddler")
						say("")
						say("Ok, you try again.")
						say("Luck follows those who try.")
						say("I wait for you.")
						say("")
						set_state(gogogo)

					else
						say_title("Peddler:")
						say("")
						say("The Quest is too hard?")
						say("You tried..I am sorry.")
						say("If I have an easier Quest for you one")
						say("day, I'll tell you.")
						say("All the best.")
						say("")
						set_state(__GIVEUP__)
					end
                                else
					say_title("Peddler:")
					say("")
					say("You try again?")
					say("Thanks.")
					say("I'll wait for you.")
					say("")
					set_state(gogogo)
                                end
                	end

                end
        end



        state __GIVEUP__ begin
        end
    state THEEND begin
                when enter begin
                        q.done()
                end
        end
end
