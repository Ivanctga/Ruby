nomes = ["João", "Maria", "José", "Mateus"]

nomes_completos = nomes.map do |nomes_completos|  # acrescenter nome na lista
  nomes_completos + " sobrenome"
end

puts nomes
puts "-----------"
puts nomes_completos

nomes.map! do |nomes_completos|          # dessa forma vai sobre-escrever a primeira lista
  nomes_completos + " Ferreira Silva"    # acrescentar função ao nome
end
puts "---------------------"
puts nomes

