require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  @name = params.fetch('name')
  @number = params.fetch('number')
  Contact.new({:name => @name, :number => @number}).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/new_numbers') do
  @new_number = params.fetch('new_number')
  @type = params.fetch('type')
  @new_number = Phone.new({:new_number => @new_number, :type => @type, :contact_id => @contact_id}).save()
  @contact = Contact.search(params.fetch('uid').to_i())
  @contact.add_phone(@new_number)
binding.pry
  @contacts = Contact.all()
  @new_numbers = Phone.all()
  erb(:contact)
end

get('/new_numbers/:contact_id') do
  @phone_number = Phone.find(params.fetch('contact_id').to_i())
  erb(:new_number)
end

get('/contacts/:uid') do
  @contact = Contact.search(params.fetch('uid').to_i())
  erb(:contact)
end
