nomes = ["João", "Maria", "José", "Mateus"]

dict = {nome: "Ivan", idade: 44, altura: 1.70}

# nome = "Ivan"
# nomes.each do |nome|
#   puts nome  
# end
# puts nome

dict.each do |chave, valor|
  puts "#{chave}: #{valor}"
end