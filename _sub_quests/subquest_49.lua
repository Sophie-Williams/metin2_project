----------------------------------------------------
-- SUB QUEST
-- LV 59
-- Bingsu?!
----------------------------------------------------

quest subquest_49 begin
        state start begin
                when login or levelup or enter with pc.level >= 59 and pc.level <= 61 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20014)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Bingsu?")
                        end
                end


                when __TARGET__.target.click or
                        20014.chat."Bingsu?!" with pc.level >= 59 begin
                        target.delete("__TARGET__")
                        say_title("Taurean :")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Today I had an argument with Harang.")
                        say("I could..nevermind.")
                        say("He claims there is something very tasty")
                        say("made of kibbled ice.")
                        say("Bingsu would be it.")
                        say("")
                        wait()
                        say_title("Taurean :")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Only in an ice cold winter")
                        say("it would be possible to make ice.")
                        say("But he claims and claims that it would really work,")
                        say("so that I accepted his challenge.")
                        say("Please help me to find out how")
                        say("this Bingsu can be made.")
                        say("But I wonder...")
                        say("Does it really exist?")
                        say("")
                        local s=select("Accept","Decline")
                        if 2==s then
                        say_title("Taurean :")
                        say("")
                                say("You want to cancel?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Taurean:")
                                        say("")
                                        say("If you want to do this later,")
                                        say("please tell me.")
                                        say("")
                                        return
                                end
                                say_title("Taurean :")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("I really would like to taste Bingsu.")
                                say("Well, okay.")
                                say("Bye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Taurean :")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Thanks...")
                        say("I am really nosy.")
                        say("Please hurry up so that I")
                        say("can try this ice.")
                        say("")
                        set_state(ask_to_harang)



                end
        end

        state ask_to_harang begin
                when info or button begin
                        say_title("About Bingsu")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("As Harang claims that Bingsu exist,")
                        say("I better go to him")
                        say("and ask him.")
                        say("")
                end

                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("About Bingsu")
                        q.set_title("Let's ask Harang")
                        q.start()

                        local v=find_npc_by_vnum("20024")
                        if 0== v then
                        else
                                target.vid("__TARGET__",v,"Let's ask Harang")
                        end
                end

                when __TARGET__.target.click or
                        20024.chat."What is Bingsu?!" begin
                        target.delete("__TARGET__")
                        say_title("Harang:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("That Taurean!!")
                        say("He doesn't know what Bungsu is but")
                        say("claims he would know everything.")
                        say("How can one know this tasty stuff?")
                        say("Such a ")
                        say("stupid one.")
                        say("You also have no idea what Bingsu is?")
                        say("Best go to Octavio in the next village.")
                        say("He is a famous cook and")
                        say("he knows all the good receipts.")
                        say("One time he made Bingsu for me, hmmm...")
                        say("Ask him and show Taurean that I was")
                        say("right!")
                        say("")
                        set_state(ask_to_chef)
                end
        end

        state ask_to_chef begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Go to Octavio")
                        q.set_title("Go to Octavio")
                        q.start()

                        local v=find_npc_by_vnum("20008")
                        if 0== v then
                        else
                                target.vid("__TARGET1__",v,"Go to Octavio")
                        end
                end

                when info or button begin
                        say_title("About Bingsu")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Taurea wants to know what Bingsu is.")
                        say("I will try to get him")
                        say("rid of his nosy act.")
                        say("Go to Octavio and let's see what" )
                        say("the heck Bingsu is.")
                        say("")
                end



                when __TARGET1__.target.click or
                        20008.chat."Information about Bingsu" begin
                        target.delete("__TARGET1__")
                        say_title("Octavio:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Ha Ha! What's up with you??")
                        say("Bingsu? Sure I know that.")
                        say("Every good cook knows")
                        say("what that is when he deals with")
                        say("cookery.")
                        say("Bingsu is best in the summer.")
                        say("")
                        wait()
                        say_title("Octavio:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("For Bingsu, you first need Crabbed Ice.")
                        say("Then sugar, on the top a bit")
                        say("Rice Cake and some fruit for decoration.")
                        say("Especially in summer it is really liked.")
                        say("Taurean")
                        say("is a good boy,")
                        say("but he has a tight heart...")
                        say("Oh well, I like him!")
                        say("Can you help me to get the ingredients for Bingsu,")
                        say("so that I can make Taurean happy and finally make")
                        say("Bingsu again?")
                        say("")
                        wait()
                        say_title("Octavio:")
                        say("")
                        say("Just get me some Crabbed Ice from the")
                        say("Enchanted Ice monster at Ice Mountain.")
                        say("You'll get it for me?")
                    say("")
                        local s=select("Yes","No")
                        if 2==s then
                                say("Cancel the Quest-")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Octavio:")
                                        say("")
                                        say("Don't you like Ice?")
                                        say("Or are you full?")
                                        say("When you want to have Bingsu one day,")
                                        say("just come by.")
                                        say("")
                                        return
                                end
                                say_title("Octavio:")
                                say("")
                                say("Taurean will be sad.")
                                say("Well, bye.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Octavio:")
                        say("")
                        say("Yes,")
                        say("as I already said, you can only")
                        say("get the Crabbed Ice from the Enchanted Ice ")
                        say("from the Ice Mountain in the west.")
                        say("Get me 50 Crabbed Ice, then I can")
                        say("make some tasty Bingsu.")
                    say("")
                        set_state(gain_ice)
                end
        end

        state gain_ice begin
                when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Bingsu?")
                        q.set_title("Bingsu?")
                        q.start()

                        if pc.count_item("30146")>=50 then
                                local v=find_npc_by_vnum(20008)
                                if 0==v then
                                        else
                                        target.vid("__TARGET__",v,"Go to Octavio now")
                                end
                        end

                end

                when info or button begin

                        if pc.count_item("30146")>=50 then
                                say(locale.NOTICE_COLOR.."Ice collected"..locale.NORMAL_COLOR)
                                say("")
                                say("I have the Ice for Bingsu.")
                                say("Take it to Octavio.")
                                return
                        end
                        say(locale.NOTICE_COLOR.."Search for the Ice"..locale.NORMAL_COLOR)
                        say("")
                        say("For Bingsu, Crabbed Ice is needed.")
                        say("You can get the ice from the Enchanted Ice")
                        say("at the Ice Mountain in the west.")
                        say("Get 50 Crabbed Ice and bring them to Octavio.")
                        say("")
                end

                when 1101.kill begin
                        local s = number(1, 100)
                        if s <= 7 and pc.count_item("30146")< 50  then
                                pc.give_item2("30146", 2)
                        end
                end

                when __TARGET__.target.click or
                        20008.chat."Here is Ice." begin
                        target.delete("__TARGET__")
                        if pc.count_item("30146") >= 50 then
                                say_title("Octavio:")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("Thanks to your help I can make Bingsu.")
                                say("That way Taurean forgets his anger.")
                                say("Here, take the Bingsu with you.")
                                say("")
                                say_item_vnum(30149)
                                pc.give_item2(30149)
                                set_state(back_to_boy)
                                pc.remove_item(30146, 50)
                                return
                        else
                                say("That's not enough.")
                                say("I need more.")
                                local s=select("Try again","Give up")
                                if 2==s then
                                        say_title("Octavio:")
                                        say("")
                                        ----"12345678901234567890123456789012345678901234567890"|
                                        say("Too hard?")
                                        say("Can't do anything then.")
                                        set_state(__GIVEUP__)
                                        return
                                end
                                say_title("Octavio:")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("You want to try again?")
                                say("With your courage you")
                                say("will make it.")
                                say("")

                        end
        end
end

state back_to_boy begin
        when letter begin
                        setskin(NOWINDOW)
                        makequestbutton("Return to Taurean")
                        q.set_title("Return to  Taurean")
                        q.start()

                        local v = find_npc_by_vnum(20014)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Bingsu!")
                        end

                end

                when info or button begin
                        say_title("Return to  Taurean")
                        say("")
                        say("Return to  Taurean and give him ")
                        say("the Bingsu Octavio made")
                        say("for him.")
                        say_item_vnum(30149)
                end


                when __TARGET__.target.click or
                        20014.chat."Here! Bingsu!" begin
                        target.delete("__TARGET__")
                        if pc.count_item("30149")>0 then
                                say_title("Taurean:")
                                say("")
                                ----"12345678901234567890123456789012345678901234567890"|
                                say("Wow that's Bingsu?")
                                say("Hmm, very yummy,")
                                say("that taste so cool...")
                                say("I have never eaten such before.")
                                say("Thanks.")
                                say("")
                                pc.remove_item(30149,1)

                                say_reward("You received 6.000.000 Experience Points.")
                                pc.give_exp2(6000000)

                                say_reward("You received one War God Blessing Scroll.")
                                pc.give_item2(71021)

                                say_reward("You received 70.000 Yang.")
                                pc.change_money(70000)
                           clear_letter()
                           set_state(__COMPLETE__)
                   else
                           say_title("Taurean:")
                           say("")
                           say("Bingsu for me,")
                           say("you remember?")
                           say_item_vnum(30149)
                           say("")
                           wait()
                           say_pc_name()
                           say("Oh my god, I forgot it.")
                                      say("")
                                say("You want to try again ")
                                say("to hunt Enchanted Ice or do you")
                                say("give up?")
                                say("")
                                local s = select("I will continue", "No I give up.")
                                if s == 2 then
                                        say_pc_name()
                                        say("I can't do it,")
                                        say("sorry.")
                                        say("")
                                        clear_letter()
                                        set_state(__GIVEUP__)

                                end
                                set_state(gain_ice)
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
