File.open('list.txt', 'a') do |line| 
  # #! para subistituir o conteúdo do arquivo, use 'w' ao invés de 'a' 
  line.puts('banana')
  line.puts('arroz')
  line.puts('feijão')
  line.puts('carne')
  line.print('azeite')
  line.print(' de ')
  line.print('oliva')
end

# #* puts File.open('list.txt').size -- para saber o tamanho do arquivo