--------------------------------------
--SUB QUEST
--LV 31
-- David Quest
-------------------------------------
quest subquest_25 begin
        state start begin
                when login or levelup with pc.level >= 31  and pc.level <= 33 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20022)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "David")
                        end
                end

                when __TARGET__.target.click or
                 20022.chat."Oh my beloved Ariyoung" begin
                        target.delete("__TARGET__")
                        say_title("David:")
                        say("")
                        say("Uhm.. ")
                        say("Do you know Lady Ariyoung?")
                        say("Well, she is... - was married.")
                        say("So she is not a real Lady anymore.")
                        say("But that does not matter, she is still beautiful.")
                        say("Well... I fell in love with her long ago.")
                        say("When she married her husband, she was quite young...")
                        say("I think I was unlucky...")
                        say("")
                        wait()
                        say_title("David:")
                        say("")
                        say("Now her husband died in the war.")
                        say("She is now a rather young widow.")
                        say("Although she was married...")
                        say("I want that she knows how I feel.")
                        say("I know this is really a strange pleasure,")
                        say("but can you help me?")
                        say("")
                        wait()
                        say_title("David:")
                        say("")
                        say("You think she likes a handsome man? ")
                        say("And beautiful clothes.  ")
                        say("First I have to know what she likes,")
			say("then I can talk to her.")
                        say("Can you find this out please?")
                        say("But do not tell her anything about me!")
                        say("I please you and I will surely reward you.")
                        say("")
                        set_state(to_hear_about_her)

                end
        end

        state to_hear_about_her begin
                when letter begin
                        setskin(NOWINDOW)
                        q.set_title("Go to Ariyoung")
                        q.start()
                        makequestbutton("Go to  Ariyoung ")

                        local v=find_npc_by_vnum(20021)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Go to Ariyoung")
                        end

                end

                when info or button begin
                        say_title("Go to Ariyoung")
                        say("")
			----"12345678901234567890123456789012345678901234567890"|
                        say("David loves the widowed Ariyoung.")
                        say("To help David tell Ariyoung what he feels,")
                        say("you have to find out what she likes.")
                        say("So ask Ariyoung what she likes, ")
                        say("but watch out not to tell too much.")
                end

                when  __TARGET__.target.click or
                        20021.chat."What do I like?" begin
                        target.delete("__TARGET__")
                        say_title("Ariyoung:")
                        say("")
                        say("Well, since I lost my husband in the war,")
                        say("I feel very lonely. ")
                        say("Hmm, what would make me feel better?")
                        say("My husband always brought me Flowers.")
                        say("")
                        wait()
                        say_title("Ariyoung:")
                        say("")
                        say("Those were Flowers growing far away")
                        say("from our village. ")
                        say("Although it was dangerous, ")
                        say("he brought me the flowers. ")
                        say("I cannot see those Flowers anymore,")
                        say("now my husband is dead.")
			say("Well, days like this make me miss him.")
                        say("Uhm, what did I say?...")
                        say("Simply forget what I just said.")
                        say("")
                        say("")

                        set_state(order)


                end
        end
        state order begin
                when letter begin
                        setskin(NOWINDOW)
                        q.set_title("Go to David")
                        q.start()
                        makequestbutton("Go to David ")

                        local v=find_npc_by_vnum(20022)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, " David ")
                        end

                end
                when info or button begin
                        say_title("David")
                        say("")
                        say("Go to David")
                        say("and tell him what Ariyoung likes!")
			say("")
                end

                when __TARGET__.target.click or
                        20022.chat."Get her a Flower"  begin
                        target.delete("__TARGET__")

                        say_title("David:")
                        say("")
                        say("So what does she like?")
                        say("You did not tell her anything about me?")
                        say("Hmm, she likes a Flower her husband always")
                        say("brought her? ")
                        say("That is far away from the village and it is ")
                        say("not easy for me to get it.")
			say("And there could be monsters, like tigers.")
                        say("")
                        wait()
                        say_title("David:")
                        say("")
                        say("Yeah, why do not you help me? ")
                        say("Why do you not pick the Flower for me? ")
                        say("That would be in favour for us both.")
                        say("Huh? That was not the deal?")
                        say("Come on, can��t you see how much I ")
                        say("try to get her love? ")
                        say("I will reward you with lots of Yang.")
                        say("")
                        local s=select("Accept.","Refuse.")
                        if 2==s then
                                say("You want to cancel David��s Quest?")
                                local a=select("Yes","No")
                                        if  2==a then
                                                say_title("David:")
                                                say("")
                                                say("Damn.")
                                                say("How shall I get that Flower for her.")
                                                say("Please come back when you change your mind.")
                                                return
                                        end
                                        say_title("David:")
                                        say("")
                                        say("Have you never loved?")
                                        say("Have you no idea, what I feel for Ariyoung?")
                                        say("Oh Ariyoung...")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("David:")
                                say("")
                                say("Thank you very much!")
                                say("Please bring me that Flower.")
                                set_state(find_flower)
                                pc.setqf("flower_done",0)
                        end


        end

        state find_flower begin
                when letter begin
                        setskin(NOWINDOW)
                        q.set_title("Get the Flower" )
                        q.start()
                        makequestbutton("Get the Flower")

                        local v=find_npc_by_vnum(20358)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Flowers")
                        end


                end
                when info or  button begin
                        say_title("Getting the Flower")
                        say("")
                        say("To help David,")
			say("tells Ariyoung what he feels,")
                        say("you have to get a special Flower.")
                        say("The Flowers are in the part of the map")
                        say("where you can find many white tigers.")

                end
                when 20022.chat. "I could not get the Flowers." begin
                        say_title("David:")
                        say("")
                        say("Hmm, damn..")
                        say("I wanted to tell her my feelings.")
                        say("It is so hard to get her love.")
                        say("My dearest Ariyoung...")
			say("")

                        local s=select("I will try again.","I quit.")
                        if 2==s then
                                say("You want to cancel David��s Quest?")
                                local a=select("Yes","No")
                                        if  2==a then
                                                say_title("David:")
                                                say("")
                                                say("Oh....")
                                                say("If you made up your mind,")
                                                say("I will wait here for you.")
                                                say("Please help me...")
                                                return
                                        end
                                        say_title("David:")
                                        say("")
                                        say("Will my love end like this?")
                                        say("Ariyoung...")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("David:")
                                say("")
                                say("I thank you so much.")
                                say("You have to be in love.")
                                say("When you know what I feel for Ariyoung.")
                                say("")



                end


                when __TARGET__.target.click or
                        20358.chat."Ariyoung's favourite Flower" with pc.getf("subquest_25","flower_done")==0 begin
                                target.delete("__TARGET__")
                                say("Those flowers look like the ones,")
                                say("Ariyoung described.")
                                pc.give_item2(30153, 1)
                                pc.setqf("flower_done",1)
                                set_state(go_to_reward)
                        end

        end

        state go_to_reward begin
                when letter begin
                        setskin(NOWINDOW)
                        q.set_title("I have the Flowers" )
                        q.start()
                        makequestbutton("I have the Flowers")

                        local v=find_npc_by_vnum(20022)
                        if 0 == v then
                                else
                                        target.vid("__TARGET__",v,"Return to David")
                        end

                end
                when info or  button begin
                        say_title("I have the Flower")
                        say("")
                        say("I should give the Flower to David,")
                        say("who loves Ariyoung.")

                end

                when __TARGET__.target.click or
                        20022.chat."The Flower" with pc.count_item(30153) > 0 begin
                        target.delete("__TARGET__")
                        say_title("David:")
                        say("")
                        say("This is the Flower?")
                        say("Now I can tell Ariyoung what I feel for her.")
                        say("You think it is still not the right time?")
                        say("However, I can now tell her, I love her.")
                        say("It does not matter if it is too early.")
                        say("I thank you very much.")
                        say("Here is your reward.")
			say("")
                        pc.remove_item(30153,1)

                        say_reward("You received 300.000 Experience Points.")
                        pc.give_exp2(300000)
                        say_reward("You received 20.000 Yang")
                        pc.change_money(20000)
                        say_reward("You received a Shuriken+")
                        pc.give_item2(30075)
                        pc.setqf("state", 0)

                        clear_letter()
                        set_state(__COMPLETE__)

                end
        end

        state __GIVEUP__ begin
        end
        state __COMPLETE__ begin
        end
end
