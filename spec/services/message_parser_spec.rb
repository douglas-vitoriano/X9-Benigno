RSpec.describe MessageParser do
  let(:usuario) { "whatsapp:+5511999999999" }

  it "responde greeting" do
    resposta = described_class.process(usuario, "Oi")
    expect(resposta).to include("X9 Benigno")
  end

  it "processa despesa" do
    allow(SheetWriter).to receive(:write)

    resposta = described_class.process(usuario, "Gastei 35 almoço")

    expect(SheetWriter).to have_received(:write)
    expect(resposta).to include("Despesa registrada")
  end

  it "processa receita" do
    allow(SheetWriter).to receive(:write)

    resposta = described_class.process(usuario, "Recebi 1500 salário")

    expect(SheetWriter).to have_received(:write)
    expect(resposta).to include("Receita registrada")
  end

  it "cai no fallback quando não entende" do
    resposta = described_class.process(usuario, "asdasdasd")
    expect(resposta).to include("Não entendi")
  end
end
