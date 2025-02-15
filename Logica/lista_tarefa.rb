class TodoList
  def initialize
    @tasks = []
  end

  def adicionar_tarefa(descricao)
    @tasks << { descricao: descricao, concluida: false }
    puts "Tarefa adicionada: '#{descricao}'"
  end

  def listar_tarefas
    puts "\nLista de Tarefas:"
    @tasks.each_with_index do |tarefa, index|
      status = tarefa[:concluida] ? "[✔]" : "[ ]"
      puts "#{index + 1}. #{status} #{tarefa[:descricao]}"
    end
  end

  def concluir_tarefa(indice)
    if indice.between?(1, @tasks.length)
      @tasks[indice - 1][:concluida] = true
      puts "Tarefa marcada como concluída!"
    else
      puts "Índice inválido!"
    end
  end

  def remover_tarefa(indice)
    if indice.between?(1, @tasks.length)
      tarefa = @tasks.delete_at(indice - 1)
      puts "Tarefa removida: '#{tarefa[:descricao]}'"
    else
      puts "Índice inválido!"
    end
  end
end

# Interface no terminal
lista = TodoList.new

loop do
  puts "\n1. Adicionar Tarefa"
  puts "2. Listar Tarefas"
  puts "3. Concluir Tarefa"
  puts "4. Remover Tarefa"
  puts "5. Sair"
  print "Escolha uma opção: "

  escolha = gets.chomp.to_i

  case escolha
  when 1
    print "Digite a descrição da tarefa: "
    descricao = gets.chomp
    lista.adicionar_tarefa(descricao)
  when 2
    lista.listar_tarefas
  when 3
    print "Digite o número da tarefa concluída: "
    indice = gets.chomp.to_i
    lista.concluir_tarefa(indice)
  when 4
    print "Digite o número da tarefa a remover: "
    indice = gets.chomp.to_i
    lista.remover_tarefa(indice)
  when 5
    puts "Saindo..."
    break
  else
    puts "Opção inválida!"
  end
end
