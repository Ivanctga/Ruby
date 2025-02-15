puts "Qual é seu nome"
nome = gets.chomp
puts "Qual é a sua idade"
idade = gets.chomp.to_i  # to_i para transforforma número em inteiro


puts "Hello #{nome}"
puts "#{nome} tem #{idade} anos"    

