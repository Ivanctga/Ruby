# #! Definição de um bloco de 1 linha
# 5.times { puts "Exec the block" }

# #! Definição de um bloco de uma linha com argumento
# sum = 0 
# numbers = [5, 10, 5]
# numbers.each { |number| sum += number }
# puts sum

# #! Definição de um bloco de multiplas linhas
# foo = {2 => 3, 4 => 5}

# foo.each do |key, value|
#     puts "key = #{key}"
#     puts "value = #{value}"
#     puts "key * value = #{key * value}"
#     puts "---"
# end

# #! Bloco como argumentos 
# def foo
#     # Call the block
#     yield
#     yield
# end

# foo { puts "Exec the block" } 

# #! Definição com bloco opcional
# def foo 
#   if block_given?
#     #Call the block
#     yield
#   else
#     puts "Sem parâmetro do tipo"    
#   end  
# end

# foo
# foo { puts "Com parâmetro do tipo" }

# #! Outra forma de passar bloco como parâmetro	
# def foo(name, &block)
#     @name = name
#     block.call
# end

# foo('Leonardo') { puts "Hellow #{@name}" }


def foo(numbers, &block)
    if block_given?
        numbers.each do |key, value|
            block.call(key, value)
        end
    end
end

numbers = {2 => 2, 3 => 3, 4 => 4}

foo(numbers) do |key, value|
    puts "#{key} * #{value} = #{key * value}"
    puts "#{key} + #{value} = #{key + value}"
    puts "---"
end
