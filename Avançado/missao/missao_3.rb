texto = 'Olá, tudo bem? Meu whats app é (99) 7 4321-1234'

regex = /\(\d{2}\) \d \d{4}-\d{4}/

if texto.match(regex)
  numero_encontrado = texto.match(regex)[0]
  puts "Número de telefone encontrado: #{numero_encontrado}"
else
  puts 'Nenhum número de telefone encontrado'
end 
