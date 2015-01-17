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
  contact = Contact.new({:name => name})
  contact.add()
  @contacts = Contact.list()
  erb(:index)

end

post('/addnumbers') do

  numbertype = params.fetch('numbertype')
  newnumber = params.fetch('newnumber')
  @number = Phone.new({:new_number => newnumber, :type => numbertype})
  @number.add()
  @contact = Contact.find(params.fetch('id').to_i())
  @contact.add_number(@number)
  @numbers = Phone.list()
  erb(:contacts)

end


get('/contacts/:id') do

  @contact = Contact.find(params.fetch("id").to_i)
  @numbers = Phone.list()
  erb(:contacts)

end
