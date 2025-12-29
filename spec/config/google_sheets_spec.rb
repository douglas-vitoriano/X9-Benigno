RSpec.describe GoogleSheets do
  let(:fake_session) { double("GoogleDrive::Session") }
  let(:fake_spreadsheet) { double("Spreadsheet") }
  let(:fake_worksheet) { double("Worksheet") }

  before do
    GoogleSheets.instance_variable_set(:@session, nil)

    allow(GoogleDrive::Session)
      .to receive(:from_service_account_key)
      .and_return(fake_session)

    allow(fake_session)
      .to receive(:spreadsheet_by_key)
      .with(GoogleSheets::SPREADSHEET_KEY)
      .and_return(fake_spreadsheet)

    allow(fake_spreadsheet)
      .to receive(:worksheets)
      .and_return([fake_worksheet])
  end

  describe ".session" do
    it "retorna uma sessão do GoogleDrive" do
      expect(GoogleSheets.session).to eq(fake_session)
    end
  end

  describe ".worksheet" do
    it "retorna a primeira worksheet da planilha" do
      expect(GoogleSheets.worksheet).to eq(fake_worksheet)
    end
  end
end
