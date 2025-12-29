RSpec.describe IncomeIntent do
  subject { described_class.new }
  let(:usuario) { "user" }

  it "reconhece receita" do
    expect(subject.match?("recebi 1000")).to be true
  end

  it "salva receita corretamente" do
    allow(SheetWriter).to receive(:write)

    resposta = subject.execute(usuario, "recebi 2000 salário")

    expect(SheetWriter).to have_received(:write)
    expect(resposta).to include("Receita registrada")
  end
end
