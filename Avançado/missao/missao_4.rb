class Carro
  # Método público que recebe a frase e chama o método privado
  def get_km(frase)
    velocidade = find_km(frase)
    puts velocidade
  end

  private

  # Método privado que localiza e retorna a velocidade no formato "80km/h"
  def find_km(frase)
    frase.match(/\d+km\/h/)[0]
  end
end

# Criando um objeto da classe Carro
carro = Carro.new

# Chamando o método público com a frase fornecida
carro.get_km("Um fusca de cor amarela viaja a 80km/h.")


