#lista = [1, 2, 3.9, "nome", [1, 2, 3, 4]]

lista = []

lista.push("Diego", "João")
lista << "Maria"

lista.insert(0, "Fulano")
lista.insert(2, "Siclano")
#lista.delete("Siclano")
#puts lista.length
#puts lista.sort.first  #last

lista_organizada = lista.sort
puts lista_organizada.last   # ou first  primeira da lista ou útimo