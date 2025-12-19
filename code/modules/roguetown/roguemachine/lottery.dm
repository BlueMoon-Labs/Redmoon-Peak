/obj/structure/roguemachine/lottery_roguetown
	name = "XYLIX'S FORTUNE"
	desc = "Ненасытная пасть, что рождает королей и пожирает дураков. Испытай Судьбу!"
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "lottery"
	density = FALSE
	pixel_y = 32
	light_outer_range = 5
	light_color = "#1b7bf1"
	var/gamblingprice = 0
	var/checkchatter = 0
	var/chatterbox = 0

//ensure these two are the same, or else first roll will be fucky
	var/gamblingprob = 60
	var/gamblingbaseprob = 60

	var/diceroll = 100
	var/maxtithing = 100
	var/mintithing = 5
	var/stopgambling = 0
	var/probpenalty = 2
	var/oldtithe = 0


/obj/structure/roguemachine/lottery_roguetown/attack_hand(mob/living/user) //empty hand

	src.say("Текущая дань тебе: [src.gamblingprice] маммон. Повернёшь колесо Фортуны?")
	playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	return

/obj/structure/roguemachine/lottery_roguetown/attackby(obj/item/roguecoin/P, mob/living/user)

	. = ..()

	if(src.stopgambling == 1)
		return
	if(istype(P, /obj/item/roguecoin/aalloy))
		return
	if(istype(P, /obj/item/roguecoin/inqcoin))	
		return
	if(istype(P, /obj/item/roguecoin))
		if(src.gamblingprice + (P.sellprice * P.quantity) > src.maxtithing)
			say("Это превышает порог дани в [src.maxtithing] маммон.")
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return
		if(src.gamblingprice + (P.sellprice * P.quantity) < src.mintithing)
			say("Дань меньше потребных [src.mintithing] маммон.")
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return

		else
			src.gamblingprice += (P.sellprice * P.quantity)
			qdel(P)
			src.say("Текущая дань тебе: [src.gamblingprice] маммон. Повернёшь колесо Фортуны?")
			playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
			return


/obj/structure/roguemachine/lottery_roguetown/MiddleClick(mob/living/user, params) //LET'S GO GAMBLING
//checks - is it time to go gambling??
	if(src.stopgambling == 1)
		return
	if(src.gamblingprice == 0)
		src.say(pick("Глупец! Тебе нужны хотя бы что-то иметь, чтобы проиграть это и свою жизнь.", "И где твоя дань?.", "Владыка без владений - не владыка."))
		src.stopgambling = 1
		sleep(20)
		src.stopgambling = 0
		return


	else
		src.diceroll = rand(1,100)
		src.say(pick("И вращаюсь, и кружу; где конец, лишь Я сужу.", "Ксайликс улыбается твоей глупости, дитя.", "Рок всё подступает и подступает.", "О, какой жалкий глупец.", "Один из нас сейчас пожалеет.", "Мой смех - твой плач. Мои слёзы - твоё ликование.", "Побуду твоим шутом, сыграю-ка для тебя..", "Отдадимся Судьбе!", "Всё вертится, всё кружится, а глупость здесь лишь множится.", "Танец меж злата и погибели.."))
		playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		playsound(src, 'sound/misc/letsgogambling.ogg', 100, FALSE, -1)
		src.gamblingprob += (user.STALUC - src.probpenalty)
		src.stopgambling = 1

		src.checkchatter -= 1

//thug shaker
		var/oldx = pixel_x
		animate(src, pixel_x = oldx+1, time = 1)
		animate(pixel_x = oldx-1, time = 1)
		animate(pixel_x = oldx, time = 1)
		sleep(50)

//let's actually go gambling and determine results
		if(src.gamblingprob > src.diceroll)
			src.oldtithe = src.gamblingprice
			src.gamblingprice *= pick(1.1, 1.1, 1.1, 1.1, 1.2, 1.2, 1.2, 1.4, 1.4, 2)
			src.gamblingprice = round(src.gamblingprice)

			peasant_betting()
			letsgogamblinggamblers()
			src.say(pick("Искусное решение, знатный муж! Крепостные выплатили [src.gamblingprice] маммон. Повторишь?", "Богатая жатва ныне - крепостные собрали урожая на [src.gamblingprice] маммон. Запустишь меня ещё разок?",))

			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			src.gamblingprob = src.gamblingbaseprob
			src.oldtithe = src.gamblingprice //this is redundant but i feel like bad things will happen if i don't do this :T
			sleep(15)
			src.stopgambling = 0
			return

		else
			src.say(pick("Десять, перевёрнутое Колесо Фортуны!", "Дурное знамение!", "Жатва для саранчи!", "Взгляни мне в глаза и прошепчи о своей скорби.", "Ах, вот досада!.", "Глупец. Жалкий глупец.", "Глаза покидают твой череп, слюна изливается изо рта.", "Божественная глупость!", "Ты сидишь, как я сидел здесь когда-то. Как неудачник и урод."))
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
			sleep(20) //really make them THINK about their life choices up to this point
			src.say(pick("Царь глупцов, твои земли пусты. Сыграешь снова?", "Не только глупость, но и потеха. Сыграешь снова?", "В следующий раз ТОЧНО повезёт. Сыграешь снова?", "Хаха-... ах-ха-ха! Снова! Шут мой, сыграй ещё!", "Жалкий нищий! Запустишь меня снова?"))
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
			src.gamblingprob = src.gamblingbaseprob
			src.gamblingprice = 0
			src.oldtithe = 0
			sleep(15)
			src.stopgambling = 0
			return



/obj/structure/roguemachine/lottery_roguetown/attack_right(mob/living/user) //how the fuck do i
	. = ..()

	if(!ishuman(user))
		return
	if(src.stopgambling == 1)
		return

	else
		if(gamblingprice <= 0)
			say("Бедняжка, ты безмонетчик.")
			return
		if(gamblingprice < 0)
			say("Ты должен своим крепостным!")
			return
		var/list/choicez = list()
		if(gamblingprice > 10)
			choicez += "GOLD"
		if(gamblingprice > 5)
			choicez += "SILVER"
		choicez += "BRONZE"
		var/selection = input(user, "Make a Selection", src) as null|anything in choicez
		if(!selection)
			return
		var/mod = 1
		if(selection == "GOLD")
			mod = 10
		if(selection == "SILVER")
			mod = 5
		var/coin_amt = input(user, "Sayyid, you have [src.gamblingprice] mammon in tithes. You may withdraw [floor(gamblingprice/mod)] [selection] COINS.", src) as null|num
		coin_amt = round(coin_amt)
		if(coin_amt < 1)
			return
		if(!Adjacent(user))
			return
		if(src.stopgambling == 1) // double check because it's possible to have input field open before starting gambling
			return
		if((coin_amt*mod) > gamblingprice)
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			return
		else
			budget2change(coin_amt*mod, user, selection)
			gamblingprice -= coin_amt*mod



/obj/structure/roguemachine/lottery_roguetown/proc/peasant_betting()

	if(src.gamblingprice == oldtithe)
		src.gamblingprice += pick(1,1,1,1,2,2)


/obj/structure/roguemachine/lottery_roguetown/proc/letsgogamblinggamblers()

	if(src.checkchatter > 1) //procs any time it's under 1
		return

	if(prob(90))
		return

	chatterbox = rand(1,12)

	switch(chatterbox)
		if(1)
			src.say("Я всё ещё помню, как дождь касался моей кожи.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Ветер в моей шерсти.. или это волосы? Впрочем, неважно...")
			playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
		if(2)
			src.say("Служение богам губительно.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(20)
			src.say("Это наказание не так уж страшно в сравнении с иными! Ха-ха-ха!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		if(3)
			src.say("Бывает участь страшнее смерти...")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("...особенно для глупца, возомнившего себя царём.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(4)
			src.say("Она, конечно, не ожидала, что Её же машина погубит Её.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("...хотя трудно спорить с тем, что случившееся позже пошло Ей на пользу.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(5)
			src.say("O, Псайдон?")
			playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Честно, ПСАЙ-ДОвольно с меня этих споров! Ха-ха-ха ...Не? Рано? Ну ладно.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		if(6)
			src.say("Дурак, ты же знаешь, что идеи Экклесии в целом верны?")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Неужто никто не подумает о любящих мертвецов, ненавидящих поборы, наркотических убийцах?!")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(7)
			src.say("...не жди, что я поддержу с тобой беседу.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Хотя я здесь единственный болтун.")
			playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		if(8)
			src.say("Ты не чувствуешь вонь в воздухе? Она ужасна.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Раньше было лучше, а сейчас только гниль и гной. Ну да ладно.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(9)
			src.say("Ты не чувствуешь вонь в воздухе? Она ужасна.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Раньше было лучше, а сейчас только гниль и гной. Ну да ладно.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(10)
			src.say("Может остановишься, пока ты в выигрыше, дурак?")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("...ибо алчность и загнала твой род в этот Хаос.")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		if(11)
			src.say("Отец и сын его ехали через лес на повозке. Вдруг, проклятье З.! Ось сломалась!")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Отец умер, но сын.. сын ещё жив! Его доставили к лекарю в ближайшей деревне.")
			playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			sleep(30)
			src.say("Увидев его, лекарь ахн-... что значит ты уже слышал этот рассказ?")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)
		else
			src.say("Я? Важен ли я? О, нет.")
			playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
			sleep(25)
			src.say("Я всего лишь жалкий никому не нужный дурак. Как и ты! Ха-ха-ха!")
			playsound(src, 'sound/misc/bug.ogg', 100, FALSE, -1)

	sleep(40)
	src.checkchatter = rand(1,11) //hope he doesn't have pocket aces
