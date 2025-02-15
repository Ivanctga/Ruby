# Classe Cliente para representar cada cliente na fila
class Cliente
  attr_accessor :tempo_chegada, :tempo_atendimento

  def initialize(tempo_chegada, tempo_atendimento)
    @tempo_chegada = tempo_chegada
    @tempo_atendimento = tempo_atendimento
  end
end

# Classe Simulacao para gerenciar a fila de atendimento
class Simulacao
  attr_reader :clientes, :tempo_simulacao, :servidor_ocupado

  def initialize(tempo_simulacao)
    @clientes = []
    @tempo_simulacao = tempo_simulacao
    @servidor_ocupado = false
    @fila = []
    @tempo_atual = 0
    @total_tempo_espera = 0
    @total_tempo_no_sistema = 0
    @clientes_atendidos = 0
    @tempo_ocupado_servidor = 0
  end

  # Gera clientes com tempos aleatórios de chegada e atendimento
  def gerar_clientes
    (1..tempo_simulacao).each do |tempo|
      if rand < 0.3 # Probabilidade de chegada de cliente (30%)
        tempo_atendimento = rand(2..5) # Tempo de atendimento entre 2 e 5 unidades
        cliente = Cliente.new(tempo, tempo_atendimento)
        @clientes << cliente
        @fila << cliente
        puts "Cliente chegou no tempo #{tempo} com tempo de atendimento de #{tempo_atendimento}."
      end
    end
  end

  # Executa a simulação
  def executar
    gerar_clientes

    while @tempo_atual <= tempo_simulacao || !@fila.empty?
      processar_fila
      @tempo_atual += 1
    end

    exibir_estatisticas
  end

  private

  def processar_fila
    if @fila.any? && !@servidor_ocupado
      cliente = @fila.shift
      @servidor_ocupado = true
      @tempo_ocupado_servidor += cliente.tempo_atendimento
      tempo_espera = [@tempo_atual - cliente.tempo_chegada, 0].max
      @total_tempo_espera += tempo_espera
      @total_tempo_no_sistema += tempo_espera + cliente.tempo_atendimento
      @clientes_atendidos += 1
      puts "Cliente atendido no tempo #{@tempo_atual} (esperou #{tempo_espera})."
      @tempo_atual += cliente.tempo_atendimento - 1
      @servidor_ocupado = false
    end
  end

  # Exibe as estatísticas da simulação
  def exibir_estatisticas
    puts "\n=== Estatísticas da Simulação ==="
    puts "Total de clientes atendidos: #{@clientes_atendidos}"
    puts "Tempo médio de espera: #{@total_tempo_espera.to_f / @clientes_atendidos if @clientes_atendidos > 0} unidades"
    puts "Tempo médio no sistema: #{@total_tempo_no_sistema.to_f / @clientes_atendidos if @clientes_atendidos > 0} unidades"
    puts "Taxa de ocupação do servidor: #{(@tempo_ocupado_servidor.to_f / tempo_simulacao * 100).round(2)}%"
  end
end

# Executa a simulação com uma duração de 20 unidades de tempo
simulacao = Simulacao.new(20)
simulacao.executar
