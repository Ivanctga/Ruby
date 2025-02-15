def celsius_para_fahrenheit(celsius)
  (celsius * 9.0 / 5) + 32
end

def celsius_para_kelvin(celsius)
  celsius + 273.15
end

def fahrenheit_para_celsius(fahrenheit)
  (fahrenheit - 32) * 5.0 / 9
end

def fahrenheit_para_kelvin(fahrenheit)
  (fahrenheit - 32) * 5.0 / 9 + 273.15
end

def kelvin_para_celsius(kelvin)
  kelvin - 273.15
end

def kelvin_para_fahrenheit(kelvin)
  (kelvin - 273.15) * 9.0 / 5 + 32
end

puts "Conversor de Temperatura"
puts "Escolha a unidade de entrada:"
puts "1 - Celsius"
puts "2 - Fahrenheit"
puts "3 - Kelvin"
print "Opção: "
unidade_origem = gets.to_i

puts "Escolha a unidade de saída:"
puts "1 - Celsius"
puts "2 - Fahrenheit"
puts "3 - Kelvin"
print "Opção: "
unidade_destino = gets.to_i

print "Digite o valor da temperatura: "
temperatura = gets.to_f

resultado = case [unidade_origem, unidade_destino]
            when [1, 2] then celsius_para_fahrenheit(temperatura)
            when [1, 3] then celsius_para_kelvin(temperatura)
            when [2, 1] then fahrenheit_para_celsius(temperatura)
            when [2, 3] then fahrenheit_para_kelvin(temperatura)
            when [3, 1] then kelvin_para_celsius(temperatura)
            when [3, 2] then kelvin_para_fahrenheit(temperatura)
            else temperatura # Se mesma unidade, mantém o valor
            end

puts "Resultado: #{resultado.round(2)}"
