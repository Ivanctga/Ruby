
nome = "Ivan"
n = 5

# if nome.eql?("Ivan" )
#   puts "Aprendis de programação"
# else
#   puts "Visitante"
# end

# condição ? verdadeiro : falso

puts nome.eql?("Ivan") ? "Aprendis de programação" : "Visitante"
resultado = nome.eql?("Ivan") ? "Aprendis de programação - resultado" : "Visitante - resultado"
puts resultado
puts "---------------"

soma = n.eql?(5) ? n + 10 : n - 1
puts soma