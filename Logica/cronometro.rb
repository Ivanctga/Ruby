class Cronometro
  def initialize
    @inicio = nil
    @tempo_total = 0
    @rodando = false
  end

  def iniciar
    return if @rodando  # Se já estiver rodando, não faz nada

    @inicio = Time.now  # Marca o tempo inicial
    @rodando = true
  end

  def pausar
    return unless @rodando  # Se não estiver rodando, não faz nada

    @tempo_total += Time.now - @inicio  # Calcula o tempo decorrido e soma ao total
    @rodando = false
  end

  def zerar
    @inicio = nil
    @tempo_total = 0
    @rodando = false
  end

  def tempo_decorrido
    if @rodando
      @tempo_total + (Time.now - @inicio)  # Se estiver rodando, soma o tempo atual ao total
    else
      @tempo_total  # Se estiver pausado, retorna o tempo salvo
    end
  end
end

# Exemplo de uso:
cronometro = Cronometro.new

cronometro.iniciar
sleep(2)  # Simula a passagem de 2 segundos
cronometro.pausar

puts "Tempo decorrido: #{cronometro.tempo_decorrido} segundos"

cronometro.iniciar
sleep(3)  # Simula mais 3 segundos
cronometro.pausar

puts "Tempo total após retomar: #{cronometro.tempo_decorrido} segundos"

cronometro.zerar
puts "Tempo após zerar: #{cronometro.tempo_decorrido} segundos"
