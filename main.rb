require 'telegram/bot'
require './api-key.rb'

count = 0
Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
  		case message.text
  		when '/start', '/restart'
  			count = 0
  			bot.api.send_message(chat_id: message.chat.id, text: "Дякуємо, що проходете наш опрос.\nВідправьте /stop якщо бажаете припинити або /restart якщо бажаєте почати спочатку")
    		question = 'Столиця Англії?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Лондон Київ), %w(Париж Берлін)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    	

    	when 'Лондон'
    		count = count + 1
    		bot.api.send_message(chat_id: message.chat.id, text: "Вірно")
    		question = 'Від якого півострова вирушили у плавання кораблі експедицій під командуванням Х. Колумба і Ф. Магеллана?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Скандинавського Піренейського), %w(Апеннінського Балканського)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    	when 'Київ', 'Париж','Берлін'
    		bot.api.send_message(chat_id: message.chat.id, text: "Не вірно")
    		question = 'Від якого півострова вирушили у плавання кораблі експедицій під командуванням Х. Колумба і Ф. Магеллана?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Скандинавського Піренейського), %w(Апеннінського Балканського)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    	when 'Піренейського'
    		count = count + 1
    		bot.api.send_message(chat_id: message.chat.id, text: "Вірно")
    		question = 'У якому економічному районі України основними забруднювачами повітря є Зміївськая ТЕС, ВАТ «Шебелинкагазпром», ВАТ «Сумихімпром»?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Придніпровському Центральному), %w(Північно-Східному Північно-Західному)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    	
    	when 'Скандинавського', 'Апеннінського','Балканського'
    		bot.api.send_message(chat_id: message.chat.id, text: "Не вірно")
    		question = 'У якому економічному районі України основними забруднювачами повітря є Зміївськая ТЕС, ВАТ «Шебелинкагазпром», ВАТ «Сумихімпром»?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Придніпровському Центральному), %w(Північно-Східному Північно-Західному)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    	when 'Північно-Східному'
    		count = count + 1
    		bot.api.send_message(chat_id: message.chat.id, text: "Вірно")
    		question = 'З якою країною Єгипет узгоджує обсяги споживання води річки Ніл?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Лівія Судан), %w(Нігер Алжир)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    	when 'Придніпровському', 'Центральному','Північно-Західному'
    		bot.api.send_message(chat_id: message.chat.id, text: "Не вірно")
    		question = 'З якою країною Єгипет узгоджує обсяги споживання води річки Ніл?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Лівія Судан), %w(Нігер Алжир)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		when 'Судан'
    		count = count + 1
			bot.api.send_message(chat_id: message.chat.id, text: "Вірно")
			question = 'Якої частини світу немає на глобусі, створеному Мартіном Бехаймом у 1492 році?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Африки Європи), %w(Азії Америки)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

		when 'Лівія', 'Нігер','Алжир'
    		bot.api.send_message(chat_id: message.chat.id, text: "Не вірно")
    		question = 'Якої частини світу немає на глобусі, створеному Мартіном Бехаймом у 1492 році?'
    		answers =
      			Telegram::Bot::Types::ReplyKeyboardMarkup
      			.new(keyboard: [%w(Африки Європи), %w(Азії Америки)], one_time_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		when 'Америки'
    		count = count + 1
    		kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
			bot.api.send_message(chat_id: message.chat.id, text: "Вірно")
			bot.api.send_message(chat_id: message.chat.id, text: "На цьому все, ви відповіли на #{count} питань з 5", reply_markup: kb)

		when 'Азії', 'Європи','Африки'
			kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: "Не вірно")
    		bot.api.send_message(chat_id: message.chat.id, text: "На цьому все, ви відповіли на #{count} питань з 5", reply_markup: kb)

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   		

  		when '/stop'
    		kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
    		bot.api.send_message(chat_id: message.chat.id, text: 'Допобачення', reply_markup: kb)
  		end
	end
end