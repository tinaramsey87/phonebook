require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact.rb')
require('./lib/phone.rb')


get('/') do

  @contacts = Contact.list()
  erb(:index)

end

post('/addcontact') do

  name = params.fetch('name')
  number = params.fetch('number')
  contact = Contact.new({:name => name, :number => number})
  contact.add()
  @contacts = Contact.list()
  erb(:index)

end

get('/contacts/:id') do

  @contact = Contact.find(params.fetch("id").to_i())

  erb(:contacts)

end
