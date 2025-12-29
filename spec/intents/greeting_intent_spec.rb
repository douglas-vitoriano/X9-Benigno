RSpec.describe GreetingIntent do
  subject { described_class.new }

  it "reconhece saudação" do
    expect(subject.match?("oi")).to be true
    expect(subject.match?("menu")).to be true
  end

  it "responde corretamente" do
    resposta = subject.execute(nil, "oi")
    expect(resposta).to include("X9 Benigno")
  end
end
