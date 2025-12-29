RSpec.describe SummaryIntent do
  subject { described_class.new }

  it "reconhece resumo" do
    expect(subject.match?("resumo do mês")).to be true
  end

  it "retorna resumo formatado" do
    resposta = subject.execute(nil, "resumo")
    expect(resposta).to include("Resumo do mês")
  end
end
