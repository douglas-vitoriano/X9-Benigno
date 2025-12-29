RSpec.describe FallbackIntent do
  subject { described_class.new }

  it "sempre corresponde" do
    expect(subject.match?("qualquer coisa")).to be true
  end

  it "retorna mensagem padrão" do
    resposta = subject.execute(nil, "???")
    expect(resposta).to include("Não entendi")
  end
end
