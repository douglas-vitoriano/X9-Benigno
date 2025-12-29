require_relative "base_intent"
require_relative "../responses/messages"

class SummaryIntent < BaseIntent
  def match?(texto)
    texto.match?(/resumo|balanço|extrato/)
  end

  def execute(_usuario, _texto)
    Messages.summary(3500, 2100)
  end
end
