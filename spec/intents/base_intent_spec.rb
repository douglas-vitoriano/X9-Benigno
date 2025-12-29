RSpec.describe BaseIntent do
  subject { described_class.new }

  describe "#match?" do
    it "retorna false por padrão" do
      expect(subject.match?("qualquer coisa")).to be false
    end
  end

  describe "#execute" do
    it "lança NotImplementedError" do
      expect {
        subject.execute("user", "texto")
      }.to raise_error(NotImplementedError)
    end
  end
end
