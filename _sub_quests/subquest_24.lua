------------------------------------------------------
--SUB QUEST
--LV 39
--Finding Yu-Rang��s Bread in Desert
------------------------------------------------------
quest subquest_24 begin
    state start begin
                when login or levelup with pc.level >=39 and pc.level <=41 begin
                        set_state(information)
                end
        end

        state information begin
                when letter begin
                        local v=find_npc_by_vnum(20012)
                        if 0==v then
                        else
                                target.vid("__TARGET__",v,"Yu-Rang��s Rice Cake")
                        end
                end

                when __TARGET__.target.click or
                        20012.chat."Find Yu-Rang��s Rice Cake in the Desert."  begin
                        target.delete("__TARGET__")
                        say_pc_name()
                        say("")
                        say("Hey, how is your mother??")
                        say("")
                        wait()
                        say_title("Yu-Rang:")
                        say("")
                        say("Oh, she is way better.")
                        say("Thanks for asking.")
                        say("")
                        wait()
                        say_pc_name()
                        say("")
                        say("You look like you had trouble,")
                        say("what's up?")
                        say("")
                        wait()
                        say_title("Yu-Rang:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("I sell Rice Cake but something terrible happened")
                        say("today. Spiders, bigger than humans, stole")
                        say("them. I was full of fear to die.")
                        say("Now I have no Rice Cakes anymore but")
                        say("I have to sell them. My family doesn't have")
                        say("any other possibility to get Yang.")
                        say("You get it back for me?")
                        say_item_vnum(30158)
                        local s=select("I'll find it","Sorry, no time.")

                        if 2==s then
                                say_title("Question:")
                                say("")
                                say("Do you want to really cancel the Quest?")
                                say("")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Yu-Rang:")
                                        say("")
                                        say("If you have time later on, please come back.")
                                        say("I don't know how to survive without")
                                        say("the Rice Cake.")
                                        say("")
                                        return
                                end
                                ----"12345678901234567890123456789012345678901234567890"|
                                say_title("Yu-Rang:")
                                say("")
                                say("Riches here, riches there.")
                                say("Everything about rich people.")
                                say("I hate rich people who waste Yang ")
                                say("like water - and we have no idea")
                                say("what we shall eat tomorrow.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yu-Rang:")
                        say("")
                        say("Thanks.")
                        say("You are very kind.")
                        say("I'll wait here until you are back.")
                        say("")
                        set_state(accept)
            end
      end
    state accept begin
                when letter begin
                        send_letter("Find Yu-Rang��s lost Rice Cake!")
                end

                when button or info begin
                        say_title("Find Yu-Rang��s lost Rice Cake!")
                        say("")
                        say("Get Yu-Rang��s lost Rice Cake back")
                        say("from the Baby Spiders in the desert.")
                        say("If you are not fast enough, the spiders will")
                        say("eat it or it dries out in the ")
                        say("sun. Hurry up!")
                        say("")
                        say_reward("Kill the Baby Spiders")
                        say("")
                end

                when 20012.chat."State of the lost Rice Cake" begin
                        if get_time() < pc.getqf("limit_time") then
                                say_title("Yu-Rang:")
                                say("")
                                say("What? The spiders ate everything and")
                                say("the rest dried out?")
                                say("*cries*")
                                say("")
                                local s=select("No, everything's ok.", "I give up.")
                                if 2==s then
                                        say_title("Yu-Rang:")
                                        say("")
                                        say("Please think it over.")
                                        say("The Rice cake is very important to me.")
                                        say("Please.")
                                        say("")
                                        say("You want to give up the Quest to find")
                                        say("Ya-Rang��s Rice Cake in the desert?")
                                        say("")
                                        local s=select( "I try again", "Sorry, it's too hard.")
                                        if 2==s then
                                                say_title("Yu-Rang:")
                                                say("")
                                                say("You gave up?")
                                                say("A shame you can't help us.")
                                                set_state(__GIVEUP__)
                                                return
                                        end
                                        say_title("Yu-Rang:")
                                        say("")
                                        say("Be nice!")
                                        say("Please help me!")
                                        return
                                end
                                say_title("Yu-Rang:")
                                say("")
                                say("Really? Then please")
                                say("find the Rice Cake as fast as possible.")
                                say("")
                                return
                        end
                        say_title("Yu-Rang:")
                        say("")
                        say("No, it is too late.")
                        say("Even if you get it,")
                        say("it is dried out and I can't sell it")
                        say("anymore...")
                        say("")
                        set_state(__FAIL__)
                end

                when enter begin
                    pc.setqf("limit_time", get_time()+30*60)
                    pc.setqf("kill_count", 0)
                end

                when leave begin
                    pc.setqf("limit_time", 0)
                    pc.setqf("kill_count", 0)
                    q.done()
                end
                when letter begin
                    local rest_time=pc.getqf("limit_time")-get_time()
                         timer("time_over", rest_time)
                         q.set_clock("Time left", rest_time)
                end
                when time_over.timer begin
                    say_title("Information:")
                    say("")
                    say("You look on the ground and you see the")
                    say("Cake the spiders have left. Too late,")
                    say("all is dried out.")
                    say("")
                    say_reward("You wasted too much time, the Cake is dried out.")
                    say_reward("You failed the Quest.")
                    say("")
                    set_state(__FAIL__)
                    q.done()
                                                                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                                                                        when 2001.kill begin
                    local cur_kill_count=pc.getqf("kill_count")+1
                    pc.setqf("kill_count", cur_kill_count)

                    if cur_kill_count>=number(30, 40) then
                                pc.give_item2(30158)
                                set_state(report)
                    end
                end



        end
        state report begin
                when letter begin
                        send_letter("You have found Yu-Rang��s Rice Cake!")

                        local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Return to Yu-Rang")
                        end

                end
                when button or info begin
                        say_title("You have found Yu-Rang��s Rice Cake!")
                        say("")
                        say("Carry her the Rice Cake you have found")
                        say("at the spiders.")
                        say("")
                end

                when __TARGET__.target.click or
                        20012.chat."Deliver the Rice Cake to Yu-Rang." with pc.count_item(30158) >0  begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say("")
                        say("You are really great.")
                        say("I don't know what to say, really...")
                        say("Now I can sell it on the market tomorrow.")
                        say("Thanks a lot!")
                        say("")
                        say_title("Reward:")
                        say("")
                        say_reward("You receive 25.000 Yang")
                        pc.remove_item(30158)
                        pc.change_money(25000)
                        say_reward("You receive 900.000 Experience Points.")
                        pc.give_exp2(900000)

                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end
        state __FAIL__ begin
        end
    state __GIVEUP__ begin
    end
    state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
    end
end
