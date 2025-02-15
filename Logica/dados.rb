class Dados
  def self.lancar 
    rand(1..6)
  end
end

loop do 
  puts "Pressione ENTER para lançar o dado ou digite 'sair' para sair"
  entrada = gets.chomp.downcase
  break if entrada == 'sair'

  resultado = Dados.lancar
  puts "🎲 O dado rolou e caiu no número: #{resultado}\n\n"
end