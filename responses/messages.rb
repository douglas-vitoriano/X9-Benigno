module Messages
  def self.greeting
    <<~MSG
      👋 Olá! Eu sou o *X9 Benigno* 🕵️‍♂️

      Posso te ajudar com:
      💸 Gastos
      💰 Receitas
      📊 Resumo mensal

      Exemplos:
      • Gastei 35 com almoço
      • Recebi 1500 salário
      • Resumo do mês
    MSG
  end

  def self.expense_saved(valor, descricao)
    "💸 Despesa registrada: R$ #{valor} #{descricao}"
  end

  def self.income_saved(valor, descricao)
    "💰 Receita registrada: R$ #{valor} #{descricao}"
  end

  def self.summary(receitas, despesas)
    saldo = receitas - despesas

    <<~MSG
      📊 *Resumo do mês*

      💰 Receitas: R$ #{receitas}
      💸 Despesas: R$ #{despesas}
      📉 Saldo: R$ #{saldo}
    MSG
  end

  def self.fallback
    "🤔 Não entendi. Tente algo como:\nGastei 30 mercado\nRecebi 1500 salário"
  end
end
