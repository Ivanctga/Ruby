require 'nokogiri'
require 'net/http'

https = Net::HTTP.new('onebit.com', 443)

https.use_ssl = true

response = https.get('/')

doc = Nokogiri::HTML(response.body)

h1 = doc.at('h1')

puts h1

last_post = doc.at('h3 a')
puts last_post.content
puts last_post['href']

# Buscando todos os pots da primeira página
doc.search('h3 a').each do |a|
  puts a.content
  puts a['href']
end