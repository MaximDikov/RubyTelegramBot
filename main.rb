require 'telegram/bot'
require './api-key.rb'

Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
		case message.text
		when '/start'
			bot.api.send_message(
				chat_id: message.chat.id,
				text: "Привіт, #{message.from.first_name}"
			)
		else
			bot.api.send_message(
				chat_id: message.chat.id,
				text: "Ви написали: #{message.text}"
			)
		end
	end
end