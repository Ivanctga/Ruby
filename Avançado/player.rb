module Football
  class Player
    def self.info
      puts 'Um jogador de futebol precisa de um bom condicionamento físico.'
    end
  end
end

module Videogame
  class Player
    def self.info
      puts 'Um jogador de video game precisa de um bom reflexo.'
    end
  end
end

Football::Player.info
Videogame::Player.info
