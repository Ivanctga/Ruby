class BudgetManager
  attr_accessor :fixed_expenses, :variable_expenses

  def initialize
    @fixed_expenses = {}
    @variable_expenses = {}
  end

  # Registrar uma despesa fixa
  def add_fixed_expense(category, amount)
    @fixed_expenses[category] = amount
  end

  # Registrar uma despesa variável
  def add_variable_expense(category, amount)
    @variable_expenses[category] ||= []
    @variable_expenses[category] << amount
  end

  # Calcular despesas fixas totais
  def total_fixed_expenses
    @fixed_expenses.values.sum
  end

  # Calcular média de despesas variáveis por categoria
  def average_variable_expenses
    averages = {}
    @variable_expenses.each do |category, amounts|
      averages[category] = amounts.sum / amounts.size.to_f
    end
    averages
  end

  # Previsão de gastos com base nas médias de despesas variáveis
  def forecast_expenses
    forecast = {}
    average_variable_expenses.each do |category, average|
      forecast[category] = average
    end
    forecast
  end

  # Análise de economia: Sugestões e cálculo de saldo restante
  def analyze_savings(income)
    total_variable = average_variable_expenses.values.sum
    total_expenses = total_fixed_expenses + total_variable
    remaining = income - total_expenses

    suggestions = []
    if remaining < 0
      suggestions << "Considere reduzir despesas em categorias como alimentação ou lazer."
    elsif remaining < income * 0.1
      suggestions << "Você pode aumentar sua economia diminuindo despesas menores."
    else
      suggestions << "Ótimo trabalho! Considere investir parte do saldo restante."
    end

    { remaining: remaining, suggestions: suggestions }
  end
end

# Função principal para interação com o usuário
def main
  budget = BudgetManager.new

  puts "Bem-vindo ao Gerenciador de Orçamento Pessoal!"
  
  # Adicionando despesas fixas
  loop do
    puts "\nAdicione uma despesa fixa (ou digite 'sair' para continuar):"
    print "Categoria: "
    category = gets.chomp
    break if category.downcase == 'sair'

    print "Valor (R$): "
    amount = gets.chomp.to_f
    budget.add_fixed_expense(category, amount)
  end

  # Adicionando despesas variáveis
  loop do
    puts "\nAdicione uma despesa variável (ou digite 'sair' para continuar):"
    print "Categoria: "
    category = gets.chomp
    break if category.downcase == 'sair'

    print "Valor (R$): "
    amount = gets.chomp.to_f
    budget.add_variable_expense(category, amount)
  end

  # Solicitar a renda mensal
  print "\nDigite sua renda mensal (R$): "
  income = gets.chomp.to_f

  # Exibindo os resultados
  puts "\n--- RESULTADOS ---"
  puts "Despesas fixas totais: R$ #{budget.total_fixed_expenses}"
  puts "Média de despesas variáveis por categoria:"
  budget.average_variable_expenses.each do |category, average|
    puts "  - #{category}: R$ #{average.round(2)}"
  end
  puts "Previsão de gastos futuros:"
  budget.forecast_expenses.each do |category, forecast|
    puts "  - #{category}: R$ #{forecast.round(2)}"
  end

  analysis = budget.analyze_savings(income)
  puts "Saldo restante: R$ #{analysis[:remaining].round(2)}"
  puts "Sugestões: #{analysis[:suggestions].join(' ')}"
end

# Executa o programa
main

