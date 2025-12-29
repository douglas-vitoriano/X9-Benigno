require "simplecov"
SimpleCov.start

require_relative "../services/message_parser"
require_relative "../services/sheet_writer"

require_relative "../intents/greeting_intent"
require_relative "../intents/expense_intent"
require_relative "../intents/income_intent"
require_relative "../intents/summary_intent"
require_relative "../intents/fallback_intent"

require_relative "../responses/messages"

RSpec.configure do |config|
  config.order = :random
end
