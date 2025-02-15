require 'net/http'
require 'json'

class ConversorDeMoedas
  API_URL = "https://api.exchangerate-api.com/v4/latest/"

  def initialize(base_moeda)
    @base_moeda = base_moeda
    @taxas = obter_taxas
  end

  def obter_taxas
    url = URI("#{API_URL}#{@base_moeda}")
    resposta = Net::HTTP.get(url)
    dados = JSON.parse(resposta)
    dados["rates"]
  rescue
    puts "Erro ao obter taxas de câmbio. Verifique sua conexão com a internet."
    exit
  end

  def converter(valor, moeda_destino)
    return nil unless @taxas[moeda_destino]
    
    (valor * @taxas[moeda_destino]).round(2)
  end
end

puts "Bem-vindo ao Conversor de Moedas!"
print "Digite a moeda base (ex: USD, BRL, EUR): "
moeda_base = gets.chomp.upcase

conversor = ConversorDeMoedas.new(moeda_base)

print "Digite a moeda para conversão (ex: USD, BRL, EUR): "
moeda_destino = gets.chomp.upcase

print "Digite o valor a ser convertido: "
valor = gets.chomp.to_f

resultado = conversor.converter(valor, moeda_destino)

if resultado
  puts "O valor convertido é: #{resultado} #{moeda_destino}"
else
  puts "Moeda de destino inválida."
end
