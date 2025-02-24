class Agenda
  def initialize
    @contatos = []
  end

  # Adiciona um novo contato
  def adicionar_contato(nome, telefone, email)
    contato = { id: @contatos.length + 1, nome: nome, telefone: telefone, email: email }
    @contatos << contato
    puts "Contato adicionado com sucesso!"
  end

  # Lista todos os contatos
  def listar_contatos
    if @contatos.empty?
      puts "Nenhum contato cadastrado."
    else
      puts "Lista de Contatos:"
      @contatos.each do |contato|
        puts "ID: #{contato[:id]} | Nome: #{contato[:nome]} | Telefone: #{contato[:telefone]} | Email: #{contato[:email]}"
      end
    end
  end

  # Edita um contato pelo ID
  def editar_contato(id, novo_nome, novo_telefone, novo_email)
    contato = @contatos.find { |c| c[:id] == id }
    if contato
      contato[:nome] = novo_nome
      contato[:telefone] = novo_telefone
      contato[:email] = novo_email
      puts "Contato atualizado com sucesso!"
    else
      puts "Contato não encontrado."
    end
  end

  # Exclui um contato pelo ID
  def excluir_contato(id)
    contato = @contatos.find { |c| c[:id] == id }
    if contato
      @contatos.delete(contato)
      puts "Contato excluído com sucesso!"
    else
      puts "Contato não encontrado."
    end
  end
end

# Interface do Usuário
agenda = Agenda.new
loop do
  puts "\n--- MENU ---"
  puts "1. Adicionar Contato"
  puts "2. Listar Contatos"
  puts "3. Editar Contato"
  puts "4. Excluir Contato"
  puts "5. Sair"
  print "Escolha uma opção: "
  opcao = gets.chomp.to_i

  case opcao
  when 1
    print "Nome: "
    nome = gets.chomp
    print "Telefone: "
    telefone = gets.chomp
    print "Email: "
    email = gets.chomp
    agenda.adicionar_contato(nome, telefone, email)
  when 2
    agenda.listar_contatos
  when 3
    print "ID do contato a editar: "
    id = gets.chomp.to_i
    print "Novo Nome: "
    novo_nome = gets.chomp
    print "Novo Telefone: "
    novo_telefone = gets.chomp
    print "Novo Email: "
    novo_email = gets.chomp
    agenda.editar_contato(id, novo_nome, novo_telefone, novo_email)
  when 4
    print "ID do contato a excluir: "
    id = gets.chomp.to_i
    agenda.excluir_contato(id)
  when 5
    puts "Saindo do sistema..."
    break
  else
    puts "Opção inválida!"
  end
end
