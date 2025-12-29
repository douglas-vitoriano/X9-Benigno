require_relative "base_intent"
require_relative "../services/sheet_writer"
require_relative "../responses/messages"

class ExpenseIntent < BaseIntent
  def match?(texto)
    texto.match?(/gastei|paguei|despesa|saída/)
  end

  def execute(usuario, texto)
    valor = texto.scan(/\d+(?:[.,]\d{1,2})?/).first
    descricao = texto.gsub(valor.to_s, "").strip

    SheetWriter.write(
      usuario: usuario,
      tipo: "DESPESA",
      valor: valor,
      descricao: descricao
    )

    Messages.expense_saved(valor, descricao)
  end
end
