
module Person
  class Juridica   
    def initialize(name, cnpj)
      @name = name
      @cnpj = cnpj
    end

    def add
      puts "Empresa #{@name}  com CNPJ #{@cnpj} adicionada com sucesso"
    end
  end

  class Physical
    def initialize(name, cpf)
      @name = name
      @cpf = cpf
    end

    def add
      puts "Pessoa Física #{@name}  com CPF #{@cpf} adicionada com sucesso."
    end
  end
end

Person::Juridica.new('M. C. Investimentos', '4241.123/0001').add
Person::Physical.new('José Almeida', '425.123.123-123').add

  