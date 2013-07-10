--------------------------------------------------
-- SUB QUEST
-- LV 37
-- The Story of a bell hung on a Desert Spider
----------------------------------------------------

quest subquest_44 begin
        state start begin
                when login or  levelup with pc.level >= 37 and pc.level <= 39 begin
                        set_state(information)
                end

        end

        state information begin
                when letter begin
                        local v = find_npc_by_vnum(20012)
                        if v!= 0 then
                                target.vid("__TARGET__", v, "The Spider")
                        end
                end


                when __TARGET__.target.click or
                        20012.chat."Find the Spider" with pc.level >= 37 begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say("")
                        ----"12345678901234567890123456789012345678901234567890"|
                        say("Hey, can you do me a favour?")
                        say("My friend Taurean was always angry because")
                        say("I called her a coward. She says she would")
                        say("be rather brave, and she made a bet that")
                        say("she would hang a bell ")
                        say("at a Desert Spider.")
                        say("She said she did it, but")
                        say("I can't believe it at all.")
                        say("It is too dangerous though for me")
                        say("to go and look.")
                        say("")
                        wait()
                        say_title("Yu-Rang:")
                        say("")
                        say("I know I should trust my friend,")
                        say("but I want to know if she really did it.")
                        say("You look very strong, you can do that with ease.")
                        say("Would you go and have a look?")
                        say("")
                        local s=select("Accept", "Reject")
                        if 2==s then
                                say("Reject the Quest?")
                                say("")
                                local a=select("Yes","No")
                                if 2==a then
                                        say_title("Yu-Rang:")
                                        say("")
                                        say("Why not?")
                                        say("Okay, if you are afraid..")
                                        say("Visit me when you have changed your mind.")
                                        return
                                end
                                say_title("Yu-Rang:")
                                say("")
                                say("Aaah you are afraid?")
                                say("You are much bigger than me and you are")
                                say("afraid? I ask someone else.")
                                say("Go away, coward.")
                                say("")
                                set_state(__GIVEUP__)
                                return
                        end
                        say_title("Yu-Rang:")
                        say("")
                        say("This Spider lives in the desert.")
                        say("You are that strong, you'll make it.")
                        say("Good luck!")
                        say("")
                        set_state(go_to_desert)
                        pc.setqf("kill_count", 0)
                end
    end

    state go_to_desert begin
                when letter begin
                    send_letter("Find the Spider with the Bell")
                end
                when button or info begin
                        say_title("Find the Spider")
                        say("")
                        say("Yu-Rang says her friend Taurean did hang")
                        say("a bell on a Desert spider.")
                        say("Yu-Rang thinks that Taurean tricked her.")
                        say("Find the Spider. It should be in")
                        say("the desert.")
                        say("")
                end

                when 20012.click begin
                        say("Is it true, or isn't it!")
                        say("It can't be true that Taurean is that brave.")
                        say("")
                end



                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill with pc.getf("subquest_44","spider_eye")==0  begin
                        local cur_kill_count=pc.getqf("kill_count")+1
                        pc.setqf("kill_count", cur_kill_count)

                        if cur_kill_count>=number(10, 50) then
                                set_state(fail_find_bell)
                        end
                end
        end
        state fail_find_bell begin
                when letter begin
                        send_letter("You failed to find the Spider.")
                end

                when info or  button begin
                        say_title("You couldn't find the Spider")
                        say("")
                        say("What should I do now?")
                        say("Maybe it is best to go to Taurean")
                        say("and ask for the truth.")
                        say("")
                        set_state(go_to_boy)
                end
        end

    state go_to_boy begin
                when letter begin
                  send_letter("Find Taurean!")

                  local v = find_npc_by_vnum(20014)

                        if v != 0 then
                                target.vid("__TARGET__", v, "Go to Taurean")
                        end

                end
                when button or info begin
                        say_title("Find Taurean!")
                        say("")
                        say("Find Taurean and ask for ")
                        say("the truth!")
                        say("")
                end

                when __TARGET__.target.click or
                        20014.chat."You are Taurean, correct?" begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say("")
                        say("Yes! You know about the bet with Yu-Rang?")
                        say("She doesn't really trust me and thinks")
                        say("I didn't do it.")
                        say("She things the beast is too strong for me")
                        say("and would have killed me, even")
                        say("when I stood far away.")
                        say("")
                        wait()
                        say_title("Taurean:")
                        say("")
                        say("So, uhm, yeah, she is right, I ")
                        say("wasn't brave enough to tell her this.")
                        say("I am too proud. You look strong, can't you hang")
                        say("a bell on a spider")
                        say("for me and saying that is")
                        say("was me?")
                        say("Please, please, only this way I can look")
                        say("into her eyes again.")
                        say("")
                        wait()
                        say_title("Taurean:")
                        say("")
                        say("You know how dangerous this")
                        say("beast is. I have heard that the Spider has")
                        say("killed many warriors already.")
                        say("Please, help me!")
                        say("")
                        local s=select("Accept", "Reject")
                        if 2==s then
                                say("You want to give up?")
                                say("")
                                local a= select("Yes","No")
                                if 2==a then
                                        say_title("Taurean:")
                                        say("")
                                        say("You..you don't want to do it?")
                                        say("You'll tell Yu-Rang the truth?")
                                        say("Please...help me..")
                                        say("Nothing I could do?")
                                        say("")
                                        return
                                end
                                say_title("Taurean:")
                                say("")
                                say("Oh..shame..ok..")
                                say("Now Yu-Rang will never talk to me again.")
                                say("")
                                set_state(report_YuRang)
                                return
                        end
                        say_title("Taurean:")
                        say("")
                        say("I was right, I ")
                        say("thought you were nice, very much")
                        say("so. Good luck!")
                        say("")
                        set_state(attach_bell)
                end
    end

    state report_YuRang begin

                when letter begin
                   send_letter("Return to Yu-Rang")

                   local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Return to Yu-Rang")
                        end

                end
                when button or info begin
                        say_title("Return to Yu-Rang")
                        say("")
                        say("Return to Yu-Rang and tell her")
                        say("Taureans lie.")
                        say("")
                end

                when 20014.chat."The Story of Yu-Rang" begin
                        say_title("Taurean:")
                        say("")
                        say("Yu-Rang doesn't want to talk with me anymore.")
                        say("")
                end
                when __TARGET__.target.click or
                        20012.chat."Tell the Lie of Taurean" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say("")
                        say("What? Oh my.")
                        say("That she lied to me is hard enough,")
                        say("but that she didn't even try to do it, is as hard.")
                        say("Hmm! I'll end the friendship with Taurean!")
                        say("I am really disappointed.")
                        say("")
                        say_reward("Your reward:")
                        say("")
                        say_reward("You received 30.000 Yang.")
                        pc.change_money(30000)
                        say_reward("DYou received 350.000 Experience Points.")
                        pc.give_exp2(350000)


                        clear_letter()
                        set_state(__COMPLETE__)
                end
        end

    state attach_bell begin
                when letter begin
                    send_letter("Hang the Bell at the Desert spider!")
                end

                when button or info begin
                        say_title("Hang the Bell at the Desert spider!")
                        say("")
                        say("Capture the Desert spider and hang the Bell")
                        say("at the Desert spider!")
                        say("")
                end
                when 20014.chat."The Story of the Hanging of the Bell" begin
                        say_title("Taurean:")
                        say("")
                        say("Did you hang up the Bell?")
                        say("No?")
                        say("Ok, take care that you don't run into Yu-Rang.")
                        say("")
                end

                when 2001.kill or 2002.kill or 2003.kill or 2004.kill or  2005.kill  begin
                        local cur_kill_count=pc.getqf("kill_count")+1
                        pc.setqf("kill_count", cur_kill_count)

                        if cur_kill_count>=number(10, 50) then
                                send_letter("It was very difficult, but you made it.")
                                set_state(report_girl_lie)
                        end
                end

        end
    state report_girl_lie begin
                when letter begin
                        send_letter("Return to Yu-Rang")

                        local v=find_npc_by_vnum(20012)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Return to Yu-Rang")
                        end

                end

                when button or info begin
                        say_title("Return to Yu-Rang")
                        say("")
                        say("It was very difficult, but finally you have")
                        say("hanged the bell at the Desert spider.")
                        say("Now go back to Yu-Rang and tell the lie")
                        say("that Taurean hang the bell at the ")
                        say("Desert spider.")
                        say("")
                end

                when 20014.chat."The Story of the Bellhanging" begin
                        say_title("Taurean:")
                        say("")
                        say("You hang up the bell?")
                        say("Oh, thanks.")
                        say("Please tell this to Yu-Rang now.")
                        say("")
                end
                when __TARGET__.target.click or
                        20012.chat."Tell Yu-Rang about the Bell" begin
                        target.delete("__TARGET__")
                        say_title("Yu-Rang:")
                        say("")
                        say("What? Taurean really hang up the bell?")
                        say("Hmm, nice to know. Really brave.")
                        say("She is my friend then.")
                        say("I am sorry I didn't trust her.")
                        say("That's your reward for your")
                        say("help.")
                        say("")

                        set_state(report_boy_lie)
                end
        end
    state report_boy_lie begin
                when letter begin
                        send_letter("Return to Taurean")
                        local v=find_npc_by_vnum(20014)
                        if v!=0 then
                                target.vid("__TARGET__", v, "Return to Taurean.")
                        end
                end

                when button or info begin
                        say_title("Return to Taurean")
                        say("")
                        say("Return to Taurean and")
                        say("tell him that you told Yu-Rang that ")
                        say("the bell is hanged at the Desert spider.")
                        say("")
                end

                when __TARGET__.target.click or
                        20014.chat."The Storry of a Happy End." begin
                        target.delete("__TARGET__")
                        say_title("Taurean:")
                        say("")
                        say("Thanks a lot.")
                        say("Now Yu-Rang doesn't hate me.")
                        say("You have to keep this secret.")
                        say("Here is a reward for your troubles.")
                        say("")
                        say_reward("As a reward to keep all secret you received:")
                        say_reward("30.000 Yang and")
                        pc.change_money(30000)

                        say_reward("700.000 Experience Points.")
                        pc.give_exp2(700000)


                        clear_letter()
                        set_state(__COMPLETE__)
                end
    end
    state __COMPLETE__ begin
                when enter begin
                        q.done()
                end
        end
    state __GIVEUP__ begin
    end
end
