puts "Digite um texto:"
texto = gets.chomp

numero_de_palavras = texto.split.count
numero_de_caracteres = texto.length

puts "O texto digitado contém #{numero_de_palavras} palavras e #{numero_de_caracteres} caracteres"