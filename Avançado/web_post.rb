require 'net/https'

req = Net::HTTP::Post.new('/api/users')
req.set_form_data({name: 'Mario', job: 'Encanador'})

# para fazer chamadas https
response = Net::HTTP.start('reqres.in', use_ssl: true) do |http|
  http.request(req)
end

puts response.code 
puts response.body