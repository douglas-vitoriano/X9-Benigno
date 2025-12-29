source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.4.7"

# Sinatra is a DSL for quickly creating web applications in Ruby with minimal effort.
gem "sinatra", "~> 4.2", ">= 4.2.1"

# The official library for communicating with the Twilio REST API, building TwiML, and generating Twilio JWT Capability Tokens
gem "twilio-ruby", "~> 7.9"

# A library to read/write files/spreadsheets in Google Drive/Docs.
gem "google_drive", "~> 3.0", ">= 3.0.7"

# A fast and simple web server for Ruby/Rack applications.
gem "thin", "~> 2.0", ">= 2.0.1" 

# Puma is a concurrent web server for Ruby/Rack applications.
gem "puma", "~> 7.1"

# A general server command for Rack applications.
gem "rackup", "~> 2.3", ">= 2.3.1"

# Loads environment variables from .env file into ENV in Ruby projects.
gem "dotenv", "~> 3.2"

group :test do
  gem "rspec"
  gem "simplecov"
end