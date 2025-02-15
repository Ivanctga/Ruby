def palindromo?(texto)
  texto_formatado = texto.downcase.gsub(/[^a-z0-9]/, '')
  texto_formatado == texto_formatado.reverse
end

puts "Digite uma palavra ou frase:"
entrada = gets.chomp

if palindromo?(entrada)
  puts "\"#{entrada}\" é um palíndromo"
else
  puts "\"#{entrada}\" não é um palíndromo"
end