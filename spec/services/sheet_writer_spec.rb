RSpec.describe SheetWriter do
  it "escreve na planilha" do
    fake_ws = double("Worksheet", num_rows: 1)

    allow(fake_ws).to receive(:insert_rows)
    allow(fake_ws).to receive(:save)

    allow(GoogleSheets).to receive(:worksheet).and_return(fake_ws)

    described_class.write(
      usuario: "user",
      tipo: "DESPESA",
      valor: "30",
      descricao: "almoço"
    )

    expect(fake_ws).to have_received(:insert_rows)
    expect(fake_ws).to have_received(:save)
  end
end
