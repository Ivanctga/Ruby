require 'date'

# Classe principal para o Planejador de Eventos
class PlanejadorDeEventos
  attr_accessor :participantes, :tarefas, :eventos

  def initialize
    @participantes = {} # Armazena disponibilidade dos participantes
    @tarefas = {}       # Tarefas do evento
    @eventos = []       # Eventos planejados
  end

  # Adicionar um participante e sua disponibilidade
  def adicionar_participante(nome, disponibilidade)
    @participantes[nome] = disponibilidade.map { |d| Date.parse(d) }
  end

  # Sugestão de datas ideais
  def sugerir_data_evento
    datas_disponiveis = @participantes.values.flatten
    datas_ideais = datas_disponiveis.group_by(&:itself).select { |_, v| v.size == @participantes.size }
    datas_ideais.keys.sort.first  # Retorna a primeira data que atende a todos os participantes
  end

  # Criar um evento com a data sugerida automaticamente
  def criar_evento(nome)
    data_evento = sugerir_data_evento
    if data_evento
      @eventos << { nome: nome, data: data_evento, tarefas: {} }
      puts "Evento '#{nome}' criado para o dia #{data_evento}."
    else
      puts "Não foi possível sugerir uma data para o evento."
    end
  end

  # Adicionar tarefas ao evento
  def adicionar_tarefa(evento_nome, tarefa, responsavel)
    evento = @eventos.find { |e| e[:nome] == evento_nome }
    if evento
      evento[:tarefas][tarefa] = responsavel
    else
      puts "Evento não encontrado!"
    end
  end

  # Listar tarefas de um evento
  def listar_tarefas(evento_nome)
    evento = @eventos.find { |e| e[:nome] == evento_nome }
    if evento
      evento[:tarefas].each { |tarefa, responsavel| puts "#{tarefa}: #{responsavel}" }
    else
      puts "Evento não encontrado!"
    end
  end

  # Enviar lembretes de eventos
  def enviar_lembretes
    hoje = Date.today
    @eventos.each do |evento|
      dias_restantes = (evento[:data] - hoje).to_i
      if dias_restantes > 0
        puts "Lembrete: O evento '#{evento[:nome]}' será em #{dias_restantes} dias!"
      elsif dias_restantes == 0
        puts "Hoje é o dia do evento '#{evento[:nome]}'!"
      end
    end
  end
end

# Exemplo de uso interativo
planejador = PlanejadorDeEventos.new

# Entrada dos participantes e suas disponibilidades
puts "Digite os nomes dos participantes (separados por vírgula):"
nomes = gets.chomp.split(",").map(&:strip)

nomes.each do |nome|
  puts "Digite a disponibilidade para #{nome} (datas separadas por vírgula, no formato YYYY-MM-DD):"
  disponibilidade = gets.chomp.split(",").map(&:strip)
  planejador.adicionar_participante(nome, disponibilidade)
end

# Criar evento com data sugerida automaticamente
puts "Digite o nome do evento:"
evento_nome = gets.chomp
planejador.criar_evento(evento_nome)

# Adicionar tarefas ao evento
loop do
  puts "Deseja adicionar uma tarefa ao evento? (sim/não)"
  resposta = gets.chomp.downcase
  break if resposta != "sim"

  puts "Digite o nome da tarefa:"
  tarefa = gets.chomp
  puts "Quem será o responsável por essa tarefa?"
  responsavel = gets.chomp
  planejador.adicionar_tarefa(evento_nome, tarefa, responsavel)
end

# Listar tarefas do evento
puts "\nTarefas do evento '#{evento_nome}':"
planejador.listar_tarefas(evento_nome)

# Enviar lembretes
puts "\nLembretes de eventos:"
planejador.enviar_lembretes

