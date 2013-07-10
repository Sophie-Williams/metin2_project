----------------------------------------------------
--COLLECT QUEST_lv30
--METIN2 Collecting Quest
----------------------------------------------------
quest collect_quest_lv30  begin
	state start begin
		when login or levelup with pc.level >= 30 begin
			set_state(information)
		end
	end
			
	state information begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then
				target.vid("__TARGET__", v, "Biyolog Chaegirab")
			end
			q.set_icon("scroll_open_green.tga")
			send_letter("&Chaegirab'�n Ara�t�rmas� ")
		end
					
		when button or info begin
			say_title_mob()
			say("")
			say("Uriel'in ��rencisi Biyolog Chaegirab yard�m�na ihtiyac� var.")
			say("")
			say("Acele et ve ona git.")
			say("")
		end
		
		when __TARGET__.target.click or 20084.chat."Yard�m�na ihtiyac�m var." begin
			target.delete("__TARGET__")
			say_title_mob()
			say("")
			say("Oh!!! L�tfen bana yard�m et...")
			say("")
			say("Krall���m�zdaki canavarlar hakk�nda ara�t�rma yap�yorum.")
			say("Ama bunu sadece kendim yapamam! Ben sadece bir bilim adam�y�m anlayabiliyor musun?")
			say("... ve bir bilim adam� olarak sorunlar�m� anlad���n� umut ediyorum.")
			say("")
			say("L�tfen bana yard�m et. Kesinlikle �d�l� verece�im.")
			say("")
			wait()
			say_title_mob()
			say("")
			say("Seungryong Vadisindeki orklar ile ilgili bir ara�t�rma y�r�t�yorum.")
			say("Orklar�n di�leri bir demir par�as�n� ezebilir.")
			say("")
			say("Bu bu ara�t�rmay� yapmam�n sebebi.")
			say("")
			say("Teorim ork di�leri ile ilgili. Belki bunun s�rr�n� ��zebilirsek bir devrim yapabiliriz!")
			say("")
			wait()
			say_title_mob()
			say("")
			say("Bana biraz ork di�i getirebilir misin?")
			say("")
			say("Di�leri bana sadece teker teker getir ki onlar� do�ru d�zg�n inceleyebileyim.")
			say("Bol �anslar!")
			say("")
			set_state(go_to_disciple)
			pc.setqf("duration",0)
			pc.setqf("collect_count",0)
			pc.setqf("drink_drug",0)
		end
	end

	state go_to_disciple begin
		when letter begin
			send_letter("&Chaegirab'�n Ara�t�rmas� ")
		end

		when button or info begin
			say_title("Seungryong Vadisindeki Ork Di�leri:")
			say("")
			say("Biyolog Chaegirab'�n ara�t�rmas�n� s�rd�rebilmesi i�in Seungryong Vadisindeki ork di�lerine")
			say("ihtiyac� var.")
			say("")
			say("Ara�t�rabilmesi i�in ona di�leri teker teker ver.")
			say("")
			say_item_vnum(30006)
			say_reward("�u ana kadar "..pc.getqf("collect_count").." adet ork di�i toplad�n.")
			say("")
		end
					
        when 71035.use begin 
			if get_time() < pc.getqf("duration") then
				syschat("G�rev iksirini �u an kullanamazs�n.")
				return
			end
			if pc.getqf("drink_drug")==1 then
				syschat("G�rev iksirini zaten kullanm��s�n.")
				return
			end
			if pc.count_item(30006)==0 then
				syschat("G�rev iksirini ork di�i bulduktan sonra kullanabilirsin.")
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
				syschat("K�rm�z� Monokl kullanmana gerek yok. Yeni bir nesne verebilirsin.")
				return
			end
			if pc.getqf("monocles_used") > 2 then
				syschat("Zaten bug�n 3 adet K�rm�z� Monokl kulland�n.")
				return
			end
			if pc.getqf("monocles_used") == 0 then
				pc.setqf("redm_duration", get_time()+24*60*60)
			end
			item.remove()
			pc.setqf("duration", get_time()-1)
			local use = pc.getqf("monocles_used")+1
			pc.setqf("monocles_used",use)
			syschat("K�rm�z� Monokl kullan�ld�. �imdi bir di�er Ork Di�ini Chaegirab'a verebilirsin.")
		end
		
		when 20084.chat."GM: Gecikmeyi Ge� lv30" with pc.count_item(30006) >0 and pc.is_gm() and get_time() <= pc.getqf("duration") begin
			say_title_mob()
			say("Sen GM'sin. Tamam.")
			pc.setqf("duration", get_time()-1)
			return
		end
		
		when 20084.chat."Ork Di�leri" with pc.count_item(30006) >0 begin
			if get_time() > pc.getqf("duration") then
				if  pc.count_item(30006) >0 then
					say_title_mob()
					say("")
					say("Merhaba! Bana bir Ork Di�i mi getirdin?!")
					say("�lk olarak kontrol etmem gerek...")
					say("Bana bir dakika ver.")
					say("")
					pc.remove_item("30006",1)
					pc.setqf("duration",get_time()+6*60*60) 
					wait()
					local pass_percent
					if pc.getqf("drink_drug")==0 then
						pass_percent=70
					else
						pass_percent=100
					end
					local s= number(1,100)
					if s<= pass_percent  then
						if pc.getqf("collect_count")< 9 then
							local index =pc.getqf("collect_count")+1
							pc.setqf("collect_count",index)
							say_title_mob()
							say("")
							say("Oh!!! ��te bu...")
							say("L�tfen bana "..10-pc.getqf("collect_count").. " tane daha ork di�i getir.")
							say("Ara�t�rma i�in bana bu di�lerden daha fazlas� gerek.")
							say("Bol �anslar!")
							say("")
							pc.setqf("drink_drug",0)
							return
						end
						say_title_mob()
						say("")
						say("B�t�n Ork Di�lerini toplad�n!")
						say("")
						say("�imdi bana ara�t�rmam� tamamen bitirebilmem i�in Jinunggynin Ruh Ta�� gerek.")
						say("")
						say("Bu ta�� orklardan elde edebilirsin.")
						say("")
						pc.setqf("collect_count",0)
						pc.setqf("drink_drug",0)
						pc.setqf("duration",0)
						set_state(key_item)
						return
					else
						say_title_mob()
						say("")
						say("Hmm... Bu k�r�k g�z�k�yor.")
						say("�zg�n�m. Bunu kullanamam.")
						say("L�tfen bana bir di�erini getirebilir misin?")
						say("")
						pc.setqf("drink_drug",0)
						return
					end
				else
					say_title_mob()
					say("")
					say("Sende "..item_name(30006).." yok!")
					return
				end
			else
				say_title_mob()
				say("")
				say("�ok �zg�n�m....")
				say("Bana verdi�in ork di�inin analizini hen�z bitiremedim!")
				local hoursleft = (pc.getqf("duration")-get_time())/60/60
				if hoursleft > 12 then
					say("L�tfen bu di�i bana yar�n getirebilir misin?")
				elseif hoursleft < 1 then
					say("L�tfen bu di�i bana bir ka� dakika sonra getirebilir misin?")
				else
					say("L�tfen bu di�i bana bir ka� saat sonra getirebilir misin?")
				end
				return
			end
		end
	end
			
	state key_item begin
		when letter begin
			send_letter("&Chaegirab'�n Ara�t�rmas� ")
			if pc.count_item(30220)>0 then
				local v = find_npc_by_vnum(20084)
				if v != 0 then
					target.vid("__TARGET__", v, "")
				end
			end
		end
		
		when button or info begin
			if pc.count_item(30220) >0 then
				say_title("Ruh Ta��:")
				say("")
				say_reward("Sonunda Jinunggynin Ruh Ta��n� buldun!")
				say_reward("Onu Biyolog'a g�t�r.")
				say_reward("Seni bekliyor.")
				say("")
				return
			end
			say_title("�zel Ta�:")
			say("")
			say("10 Adet ork di�ini toplad�n..")
			say("Biyolog Chaegirab'�n ara�t�rmas�n� tamamen bitirmek i�in Jinunggynin Ruh Ta��na ihtiyac� var.")
			say("")
			say_item_vnum(30220)
			say("Ta�� buldu�unda Biyolog Chaegirab'a g�t�r.")
			say("Bu ta�� �u orklardan bulabilirsin: "..mob_name(635)..", "..mob_name(636).." ve "..mob_name(637)..".")
			say("")
		end
					
		when 635.kill or 636.kill or 637.kill  begin
			local s = number(1, 100)
			if s == 1 and pc.count_item(30220)==0 then
				pc.give_item2(30220, 1)
				send_letter("&Jinunggynin Ruh Ta��n� buldun!")
			end
		end
					
		when __TARGET__.target.click or 20084.chat."Jinunggynin Ruh Ta��n� buldum." with pc.count_item(30220) > 0  begin
			target.delete("__TARGET__")
			if pc.count_item(30220) > 0 then 
				say_title_mob()
				say("")
				say("Ohh!!! �ok te�ekk�r ederim.")
				say("�d�l olarak seni g��lendirece�im.")
				say("Bu �zel re�ete �ok �zel bitkilerden yap�ld�. Sana daha fazla g�� verecek.")
				say("Bunu Baek-Go'ya g�t�r. Senin i�in bu re�eteden iksir yapacak.")
				say("�yi E�lenceler.")
				say("Senin yard�m�nla orklar hakk�nda �ok �ey ��rendim!")
				say("")
				pc.remove_item(30220,1)
				set_state(__reward)
			else
				say_title_mob()
				say("Sende "..item_name(30220).." yok!")
				say("")
				return
			end
		end
	end
			
	state __reward begin
		when letter begin
			send_letter("&Gizli Re�ete")
			local v = find_npc_by_vnum(20018)
			if v != 0 then
				target.vid("__TARGET__", v, "Baek-Go")
			end
		end
	
		when button or info begin
			say_title("Biyolog Chaegirab'�n �d�l�:")
			say("")
			say("Ork Di�i ve Jinunggynin Ruh Ta��na �d�l olarak Biyolog Chaegirab sana �zel bir re�ete verdi.")
			say("Bu re�eteyi sana �zel iksiri yapmas� i�in Baek-Go'ya g�t�r.")
			say("")
		end
		
		when __TARGET__.target.click or 20018.chat."Gizli Re�ete"  begin
			target.delete("__TARGET__")
			say_title_mob()
			say("")
			say("Bir bakal�m..")
			say("Yani bu re�ete Biyolog Chaegirab'�n sana verdi�i re�ete mi?")
			say("Hmm, artt�r�lm�� hareket h�z�. Fena de�il ha?")
			say("Oh! al bakal�m, K�rm�z� Abanoz sand�k.")
			say("")
			say_reward("Biyolog Chaegirab'�n g�revini tamamlad���n i�in +10 hareket h�z� kazand�n.")
			say("")
			say_reward("Bu etki ge�ici de�il, kal�c�.")
			affect.add_collect(apply.MOV_SPEED, 10, 60*60*24*365*60) -- 60 Years
			pc.give_item2(50109)
			clear_letter()
			set_quest_state("collect_quest_lv40", "run")
			set_state(__complete)
		end
	end
	state __complete begin
	end
end