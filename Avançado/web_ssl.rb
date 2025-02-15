require 'net/https'

https = Net::HTTP.new('reqres.in', 443)
# para fazer chamadas https, é necessário usar a porta 443
# caso contrário, será necessário usar a porta 80
https.use_ssl = true

response = https.get('/api/users')
# status Code
puts response.code

# status message
puts response.message

# body (json)
puts response.body

