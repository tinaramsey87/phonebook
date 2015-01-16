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

post('/contacts') do

  hnumber = params.fetch('hnumber')
  cnumber = params.fetch('cnumber')
  wnumber = params.fetch('wnumber')
  @numbers = Phone.new({:home => hnumber, :work => wnumber, :cell => cnumber})
  @contact = Contact.find(params.fetch("id").to_i())
  @contact.add_home(hnumber)
  @contact.add_cell(cnumber)
  @contact.add_work(wnumber)
  @numbers = Phone.list()
  erb(:contacts)

end

get('/contacts/:id') do

  @contact = Contact.find(params.fetch("id").to_i)
  @numbers = Phone.list()

  erb(:contacts)

end
