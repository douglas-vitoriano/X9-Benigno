require_relative "../intents/greeting_intent"
require_relative "../intents/expense_intent"
require_relative "../intents/income_intent"
require_relative "../intents/summary_intent"
require_relative "../intents/fallback_intent"

class MessageParser
  INTENTS = [
    GreetingIntent.new,
    ExpenseIntent.new,
    IncomeIntent.new,
    SummaryIntent.new,
    FallbackIntent.new
  ]

  def self.process(usuario, texto)
    texto = texto.downcase.strip

    intent = INTENTS.find { |i| i.match?(texto) }
    intent.execute(usuario, texto)
  end
end
