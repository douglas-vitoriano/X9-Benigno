RSpec.describe ExpenseIntent do
  subject { described_class.new }
  let(:usuario) { "user" }

  it "reconhece despesa" do
    expect(subject.match?("gastei 20")).to be true
  end

  it "salva despesa corretamente" do
    allow(SheetWriter).to receive(:write)

    resposta = subject.execute(usuario, "gastei 50 mercado")

    expect(SheetWriter).to have_received(:write).with(
      usuario: usuario,
      tipo: "DESPESA",
      valor: "50",
      descricao: "gastei  mercado"
    )

    expect(resposta).to include("Despesa registrada")
  end
end
