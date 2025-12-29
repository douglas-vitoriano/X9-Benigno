require_relative "base_intent"
require_relative "../responses/messages"

class FallbackIntent < BaseIntent
  def match?(_texto)
    true
  end

  def execute(_usuario, _texto)
    Messages.fallback
  end
end
