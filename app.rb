require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/contact')
require('./lib/phone')
require('pry')


get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contacts') do
  name = params.fetch('name')
  number = params.fetch('number')
  Contact.new(name).save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  make = params.fetch('phone_number')
  @number = Phone.new(number)
  @number.save()
  @number = Contact.find(params.fetch('number_id').to_i())
  @contacts.add_number(@number)
  erb(:contacts)
end

get('/phone_numbers/:id') do
  @phone_numbers = Phone.find(params.fetch('id'))
  erb(:phone_numbers)
end

get('/contacts/:id') do
  @contacts = Contact.find(params.fetch('id').to_i())
  erb(:contacts)
end
