require_relative "../config/google_sheets"

class SheetWriter
  def self.write(usuario:, tipo:, valor:, descricao: nil)
    ws = GoogleSheets.worksheet

    ws.insert_rows(
      ws.num_rows + 1,
      [[
        Time.now.strftime("%d/%m/%Y %H:%M"),
        usuario,
        tipo,
        valor,
        descricao
      ]]
    )

    ws.save
  end
end
