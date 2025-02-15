def jogo_adivinhacao
  puts "Bem-vindo ao Jogo da Adivinhação!"
  print "Escolha o nível de dificuldade (1 - Fácil, 2 - Médio, 3 - Difícil): "
  nivel = gets.to_i

  case nivel
  when 1
    limite = 50
  when 2
    limite = 100
  when 3
    limite = 500
  else
    puts "Nível inválido! Definindo para nível Médio (1 a 100)."
    limite = 100
  end

  numero_secreto = rand(1..limite)
  tentativas = 0
  acertou = false

  puts "Tente adivinhar o número entre 1 e #{limite}!"

  until acertou
    print "Digite seu palpite: "
    palpite = gets.to_i
    tentativas += 1

    if palpite < numero_secreto
      puts "O número secreto é maior!"
    elsif palpite > numero_secreto
      puts "O número secreto é menor!"
    else
      puts "Parabéns! Você acertou o número #{numero_secreto} em #{tentativas} tentativas."
      acertou = true
    end
  end

  print "Deseja jogar novamente? (s/n): "
  resposta = gets.chomp.downcase
  jogo_adivinhacao if resposta == 's'
end

jogo_adivinhacao
