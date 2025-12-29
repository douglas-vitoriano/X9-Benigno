require_relative "base_intent"
require_relative "../services/sheet_writer"
require_relative "../responses/messages"

class IncomeIntent < BaseIntent
  def match?(texto)
    texto.match?(/recebi|ganhei|entrou|receita/)
  end

  def execute(usuario, texto)
    valor = texto.scan(/\d+(?:[.,]\d{1,2})?/).first
    descricao = texto.gsub(valor.to_s, "").strip

    SheetWriter.write(
      usuario: usuario,
      tipo: "RECEITA",
      valor: valor,
      descricao: descricao
    )

    Messages.income_saved(valor, descricao)
  end
end
