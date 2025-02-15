def calculadora 
  puts "Claculadora Simples"
  puts "Escolha a operação desejada"
  puts "1 - Soma"
  puts "2 - Subtracao"
  puts "3 - Multiplicacao"  
  puts "4 - Divisao"

  print "Digite a opção desejada: "
  operacao = gets.chomp.to_i

  print "Digite o primeiro numero: "
  num1 = gets.chomp.to_f

  print "Digite o segundo numero: "
  num2 = gets.chomp.to_f

  case operacao
  when 1
    resultado = num1 + num2 
    puts "O resultado : #{num1} + #{num2} = #{resultado}"

  when 2
    resultado = num1 - num2 
    puts "O resultado : #{num1} - #{num2} = #{resultado}"  

  when 3
    resultado = num1 * num2
    puts "O resultado : #{num1} * #{num2} = #{resultado}"  

  when 4
    if num2 != 0
      resultado = num1 / num2
      puts "O resultado : #{num1} / #{num2} = #{resultado}"
    else
      puts "Não é possível dividir por zero"
    end  
  else
    puts "Opção inválida. Escolha uma opção de 1 a 4"
  end   
end  

calculadora