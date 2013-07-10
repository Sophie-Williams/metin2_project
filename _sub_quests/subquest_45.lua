------------------------------------------
--SUB QUEST
--LV 60
--Esoteric Findings
-----------------------------------------
quest subquest_45 begin
        state start begin
                when login or levelup with pc.level >= 60  and pc.level <= 62  begin
                        set_state(enter)
                end
        end

        state enter  begin
                when letter begin
                        local v=find_npc_by_vnum(20023)
                        if 0==v then
                        else
                                target.vid("__TARGET__", v, "Mr Soon")
                        end
                end

                when __TARGET__.target.click or
                 20023.chat."The Issue with the Secret Temple" begin
                        target.delete("__TARGET__")
                        say_title("Mr.Soon:")
                        say("")
                        say("Hmm, there is something inside the Secret Temple.")
                        say("I think dangerous people, studying")
                        say("the old Magic.")
                        say("The Secret temple is hard to look through..")
                        say("even for me.")
                        say("Something...")
                        say("The motives of those people are doubtful,")
                        say("I have to study them")
                        say("")
                        wait()
                        say_title("Mr.Soon:")
                        say("")
                        say("I need more facts for those studies.")
                        say("I think I could use the Temple Symbol,")
                        say("the Temple Dogmata and the translation")
                        say("of the Curse Book quite well.")
                        say("For the secret people these are three")
                        say("very important items, bring them to me so")
                        say("I can begin to study.")
                        say("I should make more out of my life than")
                        say("always sitting over books.,")
                        say("Don't look at me like this, go to the")
                        say("Dark Temple.")
                        say("")

                        local s=select("I'll go immedietly." )
                        if 2==s then
                                say("You want to do it?")
                                local a=select("Yes","No")
                                if  2==a then
                                        say_title("Mr. Soon:")
                                        say("")
                                        say("Hey I ask for your help!")
                                        say("If you are busy, come back later.")
                                        say("I hope you have more time then.")
                                        say("I'll be waiting.")
                                        say("")
                                        return
                                end
                                say_title("Mr.Soon:")
                                say("")
                                say("Hey, I asked for your help!")
                                say("Don't live like me..")
                                say("Who asks you then.")
                                say("Ha..")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end

                        say_title("Mr.Soon:")
                        say("")
                        say("Thanks!")
                        say("")
                        set_state(WHAT_IS_MILGYO)

                end

        end


        state WHAT_IS_MILGYO begin

                when letter begin

                        setskin(NOWINDOW)
                        makequestbutton("Dark Temple.")
                        q.set_title("Dark Temple.")
                        q.start()

                        if pc.count_item("30147")>=1 and pc.count_item("30148")>=1  and  pc.count_item("30164")>=1 then
                                local v=find_npc_by_vnum(20023)
                                if 0!= v then
                                        target.vid("__TARGET__",v,"Go to Mr Soon")
                                end
                        end

                end

                when info or  button begin

                        if pc.count_item("30147")>=1 and pc.count_item("30148")>=1  and  pc.count_item("30164")>=1 then
                                say_title("Get the Secret Spells")
                                say("")
                                say("You have the Esoteric Dogmata, the Esoteric Symbol")
                                say("and the Translation of the Curse Book.")
                                say("Take them to Mr. Soon.")
                                say("")
                                return
                        end

                        say_title("Get the Secret Spells!")
                        say("")
                        say("Because of his studies on the Dark Temple,")
                        say("you help Mr Soon.")
                        say("Mr Soon says he can only study on if he")
                        say("gets three Items:")
                        say("The Esoteric Dogmata, the Esoteric Symbol")
                        say("and the Translation of the Curse Book.")
                        say("Get them and bring them to Mr Soon.")
                        say("You can get them in the Dark Temple in the Valley ")
                        say("of Dragon.")
                        say("")


                end

                when 737.kill  begin

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30147")==0  then
                                pc.give_item2(30147, 1)
                                return
                        end

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30148")==0  then
                                pc.give_item2(30148, 1)
                                return
                        end

                        local s = number(1, 100)
                        if s <= 5 and pc.count_item("30164")==0  then
                                pc.give_item2(30164, 1)
                                return
                        end

                end


                when __TARGET__.target.click or
                        20023.chat."Secret Temple!"   begin
                        if pc.count_item("30147")>0 and pc.count_item("30148")>0  and  pc.count_item("30164")>0 then
                                target.delete("__TARGET__")
                                say_title("Mr. Soon:")
                                say("")
                                say("Hmm, ok..")
                                say("Well what those secret people do is ")
                                say("rather easy, they are dangerous people.")
                                say("It seems that they obey ")
                                say("evil gods.")
                                say("I don't know details but they")
                                say("play some evil stuff.")
                                wait()
                                say_title("Mr.Soon:")
                                say("")
                                say("And they surely already bring a lot of ")
                                say("chaos into the world.")
                                say("I think I have to read many more books to ")
                                say("find a solution.")
                                say("Those are strong people.")
                                say("Hmm, I will read on...")
                                say("")
                                pc.remove_item("30148",1)
                                pc.remove_item("30147",1)
                                pc.remove_item("30164",1)

                                say_reward("You received 7.000.000 Experience Points.")
                                pc.give_exp2(7000000)

                                say_reward("You received Liutao.")
                                pc.give_item2(70003)

                                say_reward("You received 70.000 Yang.")
                                pc.change_money(70000)
                                clear_letter()
                                set_state(COMPLETE)



                                return
                        else
                                say_title("Mr.Soon:")
                                say("")
                                say("What?.")
                                say("You don't have them?")
                                say("Move fast when you have an order!")
                                say("Come on, hurry!")


                                local s=select("Try again","Give up" )
                                if 2==s then
                                        say_title("Mr.Soon:")
                                        say("")
                                        say("Someone else already gave me information.")
                                        say("You really needn't do this now, too late.")
                                        set_state(__GIVEUP__)
                                        return
                                end

                                say_title("Mr.Soon:")
                                say("")
                                say("Thanks!")

                        end


                end

        end


        state __GIVEUP__ begin
        end
        state COMPLETE begin
                when enter begin
                        q.done()
                end
        end
end
