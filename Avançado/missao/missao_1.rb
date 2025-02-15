# Passo 1: Criar a lambda que capitaliza o nome
capitalize_lambda = ->(name) { puts name.capitalize }

# Passo 2: Criar o método que recebe a lambda como argumento e a executa duas vezes
def capitalize_name(lambda_function)
  lambda_function.call('fernando')
  lambda_function.call('maria')
end

# Passo 3: Chamar o método passando a lambda como argumento
capitalize_name(capitalize_lambda)


