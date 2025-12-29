require "sinatra"
require "twilio-ruby"
require "dotenv/load"

require_relative "services/message_parser"

BOT_NAME = "X9 Benigno"

post "/whatsapp" do
  mensagem = params["Body"]
  remetente = params["From"]

  puts "[X9] #{remetente}: #{mensagem}"

  resposta = MessageParser.process(remetente, mensagem)

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: resposta)
  end

  content_type "text/xml"
  twiml.to_s
end
