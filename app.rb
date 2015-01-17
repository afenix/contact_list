require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact')
require('pry')


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

post('/new_number') do
  @new_number = params.fetch('new_number')
  @type = params.fetch('type')
  @new_number = Phone.new({:new_number => @new_number, :type => @type}).save()
  @new_number = Contact.search(params.fetch('uid').to_i())
  @contacts.add_phone(@new_number)
  @new_numbers = Phone.all()
  erb(:contacts)
end

get('/new_numbers/:uid') do
  @phone_numbers = Phone.search(params.fetch('uid').to_i())
  erb(:new_numbers)
end

get('/contacts/:uid') do
  @contacts = Contact.search(params.fetch('uid').to_i())
  erb(:contacts)
end
