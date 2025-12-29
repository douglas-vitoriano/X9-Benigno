require "google_drive"

module GoogleSheets
  SPREADSHEET_KEY = "1GOGjSwwGcCPlI7IXyv1ZqgDifLg4VZXgtitKoFB2S8M"

  def self.session
    @session ||= GoogleDrive::Session.from_service_account_key("secret.json")
  end

  def self.worksheet
    session.spreadsheet_by_key(SPREADSHEET_KEY).worksheets.first
  end
end
