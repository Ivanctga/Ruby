puts "Digite o valor mínimo do intervalo:"
  min = gets.chomp.to_i

puts "Digite o valor máximo do intervalo:"
  max = gets.chomp.to_i 

if min > max
  puts "o valor mínimo não pode ser maior que o valor máximo"
else 
  numero_aleatorio = rand(min..max)
  puts "O número aleatório gerado é: #{numero_aleatorio}"
end

