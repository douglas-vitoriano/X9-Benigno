require "sinatra"
require "twilio-ruby"
require "google_drive"

BOT_NAME = "X9 Benigno"

def salvar_na_planilha(usuario, texto)
  session = GoogleDrive::Session.from_service_account_key("secret.json")
  
  spreadsheet = session.spreadsheet_by_key("1GOGjSwwGcCPlI7IXyv1ZqgDifLg4VZXgtitKoFB2S8M")
  worksheet = spreadsheet.worksheets.first
  
  worksheet.insert_rows(worksheet.num_rows + 1, [[Time.now.strftime("%d/%m/%Y %H:%M"), usuario, texto]])
  worksheet.save
end

post "/whatsapp" do
  corpo_mensagem = params["Body"]
  remetente = params["From"]

  puts "Auditando mensagem de #{remetente}..."

  begin
    salvar_na_planilha(remetente, corpo_mensagem)
    resposta = "🕵️‍♂️ *#{BOT_NAME}* informa: Sua mensagem foi registrada na planilha com sucesso!"
  rescue => e
    puts "ERRO: #{e.message}"
    resposta = "⚠️ Eita! O #{BOT_NAME} tentou anotar, mas deu erro: #{e.message}"
  end

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: resposta)
  end

  content_type "text/xml"
  twiml.to_s
end