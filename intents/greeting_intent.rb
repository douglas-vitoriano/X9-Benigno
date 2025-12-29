require_relative "base_intent"
require_relative "../responses/messages"

class GreetingIntent < BaseIntent
  def match?(texto)
    texto.match?(/oi|olá|ola|menu|x9/)
  end

  def execute(_usuario, _texto)
    Messages.greeting
  end
end
